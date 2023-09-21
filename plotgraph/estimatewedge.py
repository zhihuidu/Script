import sys
import math

a = 0.57
b = 0.19
c = 0.19
d = 0.05

def NumVertices(a,b,deg,m,n,scale):
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

for scale in range(6,43):
    sum=0
    for i in range(int(math.e*math.log(2)*scale), int(math.sqrt(2**scale))+1): 
        numVertices=NumVertices(a,b,i,16*2**scale, 2**scale,scale)
        sum=sum+math.comb(i,2)*int(numVertices)
        #print("degree =",i, " number of vertices=",int(numVertices)," sum=",sum)
    print("Scale=",scale," Estimated wedges=",sum)
