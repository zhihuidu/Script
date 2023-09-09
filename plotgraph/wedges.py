import sys
import math

if len(sys.argv) >= 2:
    # The second command line argument (sys.argv[1]) is the first argument provided by the user
    value_from_command_line = sys.argv[1]
    
    # You can convert it to the desired data type, like int or float, if needed
    try:
        scale = int(value_from_command_line)
        print("scale = :", scale)
    except ValueError:
        print("Value is not an integer.")
        exit(0)
else:
    print("No command line arguments provided.")
    exit(0)


a = 0.57
b = 0.19
c = 0.19
d = 0.05

def Gamma(a,b,c,d):
    return math.log(b + d) / math.log(a + c)

def NumVertices(scale):
    return 2**scale  

def MaxOut(n,a):
    return math.log(n)/math.log(1.0/(1-a))

def MaxIn(n,d):
    return math.log(n)/math.log(1.0/(1-d))

def DegreePossibilitySum(scale,gamma):
    sum=0
    for i in range(2, 2**scale+2):
        sum = sum  + (i-1)**(-gamma)
    return sum

def PowerLawCoeffient(scale,gamma):
    sum=DegreePossibilitySum(scale,gamma)
    print("Degree Possibility Sum=",sum)
    return (2**scale)/sum

def FitDegree(tri):
    return (math.sqrt(1+8*tri) +1)/2

def MaxDegree(n, a, d):
    return math.log(n * 1.0) / math.log(1.0 / (1.0 - a)) + math.log(n * 1.0) / math.log(1.0 / (1.0 - d))

def Possibility(v, gamma):
    return (v * 1.0) ** (1 - gamma) - (v + 1.0) ** (1 - gamma)

def Ratio(a,b,c,d,n,e):
    sumPWedge=(a**2+b**2+c**2+d**2+a*b+a*c+a*d+b*c+b*d+c*d) # +\
               #b*a+c*a+c*b+d*a+d*b+d*c
    sumPTriangle=(a**3+b**3+c**3+d**3+ \
           a**2*b+a**2*c+a**2*d+b**2*a+b**2*c+b**2*d+c**2*a+c**2*b+c**2*d+ d**2*a+d**2*b+d**2*c+ \
           a*b*c+a*c*d+b*c*d)
    print("Sum Possibility Wedge=",sumPWedge," Sum Possibility Triangle=",sumPTriangle)
    wedgeDensity=e*(e-1)/2*sumPWedge
    triangleDensity=e*(e-1)*(e-2)/6*sumPTriangle
    sumWedge=(a**2 *(2/(n*a)) +\
              b**2 *(2/(n*b)) +\
              c**2 *(2/(n*c)) +\
              d**2 *(2/(n*d)) +\
              (a*b+a*c+a*d+b*c+b*d+c*d)* 2/n)*wedgeDensity
    sumTriangle= (2/n**3 *4 +\
                 ((a*b +a*c+a*d+b*c+b*d+c*d )*2 + (a*b*c+a*c*d+b*c*d))* \
                  2/n**2/(n-1))*triangleDensity
    sumWedge=(e*(e-1))*2/n
    sumTriangle=e*(e-1)*(e-2)/6*2/n**2/(n-1)
    print("Sum Wedge=",sumWedge," Sum Triangle=",sumTriangle)
    return sumWedge/sumTriangle

def NumWedges(scale,a,b,c,d):  # Rename function to NumWedges
    gamma=Gamma(a,b,c,d)
    print(gamma)
    coefficient=PowerLawCoeffient(scale,gamma)
    print(coefficient)
    NumWedge = 0
    sumvertex=0
    for i in range(1, 2**scale + 1):
        numv=coefficient*i**(-gamma)
        sumvertex=sumvertex+numv
        NumWedge = NumWedge + i * (i + 1) / 2 * numv
        print("# Vertices for degree ", i, " = ",numv, "# wedges=",i * (i + 1) / 2 * numv)
    print(sumvertex)
    return NumWedge

def DegreeBound(a,b,deg,m,n,scale):
    averagedegree=m/n
    sigma=a+b-0.5
    tau=(1+2*sigma)/(1-2*sigma)
    lamda=averagedegree*(1-4*sigma**2)**(scale/2)
    thetad=math.log(deg/lamda)/math.log(tau)
    floorthetad=math.floor(thetad)
    if thetad-floorthetad>0.5 :
        Gammad=math.ceil(thetad)
    else:
        Gammad=floorthetad
    gammad=abs(thetad-Gammad)
    if Gammad>=scale/2:
        return 1
    else :
        return 1/math.sqrt(deg)* math.exp(-1.0* deg* gammad**2 *(math.log(tau))**2/2)*\
               math.comb(scale, int(scale/2+Gammad))

#print(NumWedges(36))
#print(NumWedges(42))
print(Ratio(a,b,c,d,2**scale,16*2**scale))
for scale in range(6,43):
    sum=0
    for i in range(int(math.e*math.log(2)*scale), int(math.sqrt(2**scale))): 
        numVertices=DegreeBound(a,b,i,16*2**scale, 2**scale,scale)
        sum=sum+math.comb(i,2)*int(numVertices)
        #print("degree =",i, " number of vertices=",int(numVertices)," sum=",sum)
    print("Scale=",scale," Estimated wedges=",sum)
