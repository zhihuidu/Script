import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as ml 
import numpy as np
import sys
import csv

print("the data file ={}".format(sys.argv[1]))
print("the len ={}".format(len(sys.argv)))

if len(sys.argv) <1:
   print("No data file")
   exit()

inputfile=sys.argv[1][:-4]
df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14'])
#df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4'])
#df  = pd.read_csv(sys.argv[1],header =1)
print(df)
x=df['0'] #number of edges
y1=df['1'] #2 locales, directed
y2=df['2'] 
y3=df['3'] # 2 locales, undirected
y4=df['4']
y5=df['5'] # 4 locales, directed
y6=df['6']
y7=df['7'] # 4 locales, undirected
y8=df['8']
y9=df['9'] # 8 locales, directed
y10=df['10']
y11=df['11'] # 8 locales, undirected
y12=df['12']

print("x=",x)
print("y1=",y1)
print("y3=",y3)
print(y2)
print(y4)
ax=np.array(x)
ay1=np.array(y1)
ay2=np.array(y2)
ay3=np.array(y3)
ay4=np.array(y4)
ay5=np.array(y5)
ay6=np.array(y6)
ay7=np.array(y7)
ay8=np.array(y8)
ay9=np.array(y9)
ay10=np.array(y10)
ay11=np.array(y11)
ay12=np.array(y12)
e1=ax/(ay1*20*2)
e2=ax/(ay2*20*2)
e3=ax/(ay3*20*2)
e4=ax/(ay4*20*2)
e5=ax/(ay5*20*4)
e6=ax/(ay6*20*4)
e7=ax/(ay7*20*4)
e8=ax/(ay8*20*4)
e9=ax/(ay9*20*8)
e10=ax/(ay10*20*8)
e11=ax/(ay11*20*8)
e12=ax/(ay12*20*8)
#df.plot(kind='scatter',x='0',y1='1',y2='2') # scatter plot
#df.plot(kind='density')  # estimate density function
# df.plot(kind='hist')  # histogram

L1='BuildingD-2 L'
L2='BFSD-2 L'
L3='BuildingU-2 L'
L4='BFSU-2 L'
L5='BuildingD-4 L'
L6='BFSD-4 L'
L7='BuildingU-4 L'
L8='BFSU-4 L'
L9='BuildingD-8 L'
L10='BFSD-8 L'
L11='BuildingU-8 L'
L12='BFSU-8 L'
'''
L1='Building-4 L'
L2='BFS-4 L'
L3='Building-8 L'
L4='BFS-8 L'
L5='Building-16 L'
L6='BFS-16 L'
#L7='Building-16 L'
#L8='BFS-16 L'
L1='Graph Building-2 locales'
L2='BFS-2 locales'
L3='Graph Building-4 locales'
L4='BFS-4 locales'
L5='Graph Building-8 locales'
L6='BFS-8 locales'
L7='Graph Building-16 locales'
L8='BFS-16 locales'
'''
ml.rc('font', size=12)
ml.rc('axes', titlesize=12)
plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,ay1,marker='o',label=L1)
plt.plot(ax,ay2,marker='o',label=L2)
plt.plot(ax,ay3, marker='o',label=L3)
plt.plot(ax,ay4,marker='o',label=L4)
plt.plot(ax,ay5, marker='o',label=L5)
plt.plot(ax,ay6,marker='o',label=L6)
plt.plot(ax,ay7, marker='o',label=L7)
plt.plot(ax,ay8,marker='o',label=L8)
plt.plot(ax,ay9, marker='o',label=L9)
plt.plot(ax,ay10,marker='o',label=L10)
plt.plot(ax,ay11, marker='o',label=L11)
plt.plot(ax,ay12,marker='o',label=L12)
'''
plt.plot(ax,ay1,marker='o',label='Graph Building-2 locales')
plt.plot(ax,ay2,marker='o',label='BFS-2 locales')
plt.plot(ax,ay3, marker='o',label='Graph Building-4 locales')
plt.plot(ax,ay4,marker='o',label='BFS-4 locales')
plt.plot(ax,ay5, marker='o',label='Graph Building-8 locales')
plt.plot(ax,ay6,marker='o',label='BFS-8 locales')
plt.plot(ax,ay7, marker='o',label='Graph Building-16 locales')
plt.plot(ax,ay8,marker='o',label='BFS-16 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Execution Time(s)')
plt.title('Large Graph Building and BFS in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig( inputfile+"-Execution.png")
#plt.grid (True)
plt.show()
plt.close()

plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,ay2,marker='o',label=L2)
plt.plot(ax,ay4,marker='o',label=L4)
plt.plot(ax,ay6,marker='o',label=L6)
plt.plot(ax,ay8,marker='o',label=L8)
plt.plot(ax,ay10,marker='o',label=L10)
plt.plot(ax,ay12,marker='o',label=L12)
'''
plt.plot(ax,ay2,marker='o',label='BFS-2 locales')
plt.plot(ax,ay4,marker='o',label='BFS-4 locales')
plt.plot(ax,ay6,marker='o',label='BFS-8 locales')
plt.plot(ax,ay8,marker='o',label='BFS-16 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Execution Time(s)')
plt.title('Large Graph BFS in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig( inputfile+"-BFSExecution.png")
#plt.grid (True)
plt.show()
plt.close()

plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,ay1, marker='o',label=L1)
plt.plot(ax,ay3, marker='o',label=L3)
plt.plot(ax,ay5, marker='o',label=L5)
plt.plot(ax,ay7, marker='o',label=L7)
plt.plot(ax,ay9, marker='o',label=L9)
plt.plot(ax,ay11, marker='o',label=L11)
'''
plt.plot(ax,ay1, marker='o',label='Graph Building-2 locales')
plt.plot(ax,ay3, marker='o',label='Graph Building-4 locales')
plt.plot(ax,ay5, marker='o',label='Graph Building-8 locales')
plt.plot(ax,ay7, marker='o',label='Graph Building-16 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Execution Time(s)')
plt.title('Large Graph Building in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-BuildingExecution.png")
#plt.grid (True)
plt.show()
plt.close()


LE1='Building Efficiency-2 locales'
LE2='BFS Efficiency-2 locales'
LE3='Building Efficiency-4 locales'
LE4='BFS Efficiency-4 locales'
LE5='Building Efficiency-8 locales'
LE6='BFS Efficiency-8 locales'
LE7='Building Efficiency-16 locales'
LE8='BFS Efficiency-16 locales'
plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,e1, marker='o',label=L1)
plt.plot(ax,e2,marker='o',label=L2)
plt.plot(ax,e3, marker='o',label=L3)
plt.plot(ax,e4,marker='o',label=L4)
plt.plot(ax,e5, marker='o',label=L5)
plt.plot(ax,e6,marker='o',label=L6)
plt.plot(ax,e7, marker='o',label=L7)
plt.plot(ax,e8,marker='o',label=L8)
plt.plot(ax,e9, marker='o',label=L9)
plt.plot(ax,e10,marker='o',label=L10)
plt.plot(ax,e11, marker='o',label=L11)
plt.plot(ax,e12,marker='o',label=L12)
'''
plt.plot(ax,e1, marker='o',label='Building Efficiency-2 locales')
plt.plot(ax,e2,marker='o',label='BFS Efficiency-2 locales')
plt.plot(ax,e3, marker='o',label='Building Efficiency-4 locales')
plt.plot(ax,e4,marker='o',label='BFS Efficiency-4 locales')
plt.plot(ax,e5, marker='o',label='Building Efficiency-8 locales')
plt.plot(ax,e6,marker='o',label='BFS Efficiency-8 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Efficiency(Edges/s/core)')
plt.title('Large Graph Building and BFS in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-Efficiency.png")
plt.show()
plt.close()


plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,e2,marker='o',label=L2)
plt.plot(ax,e4,marker='o',label=L4)
plt.plot(ax,e6,marker='o',label=L6)
plt.plot(ax,e8,marker='o',label=L8)
plt.plot(ax,e10,marker='o',label=L10)
plt.plot(ax,e12,marker='o',label=L12)
'''
'''
'''
plt.plot(ax,e2,marker='o',label='BFS Efficiency-2 locales')
plt.plot(ax,e4,marker='o',label='BFS Efficiency-4 locales')
plt.plot(ax,e6,marker='o',label='BFS Efficiency-8 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Efficiency(Edges/s/core)')
plt.title('Large Graph BFS Efficiency in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-BFSEfficiency.png")
plt.show()
plt.close()



plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,e1, marker='o',label=L1)
plt.plot(ax,e3, marker='o',label=L3)
plt.plot(ax,e5, marker='o',label=L5)
plt.plot(ax,e9, marker='o',label=L9)
plt.plot(ax,e11, marker='o',label=L11)
'''
plt.plot(ax,e1, marker='o',label='Building Efficiency-2 locales')
plt.plot(ax,e3, marker='o',label='Building Efficiency-4 locales')
plt.plot(ax,e5, marker='o',label='Building Efficiency-8 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Efficiency(Edges/s/core)')
plt.title('Large Graph Building Efficiency in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-BuildingEfficiency.png")
plt.show()
plt.close()


