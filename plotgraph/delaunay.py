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
df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4','5','6','7','8','9','10'])
#df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4'])
#df  = pd.read_csv(sys.argv[1],header =1)
print(df)
x=df['0'] #number of edges
y1=df['1'] #graph building time 2 locales
y2=df['2'] #BFS time
y3=df['3'] # 4 locales
y4=df['4']
y5=df['5'] # 8 locales
y6=df['6']
y7=df['7'] # 16 locales
y8=df['8']
y9=df['7'] # number of vertices
y10=df['8']

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
e1=ax/(ay1*1024)
e2=ax/(ay2*1024)
e3=ax/(ay3*1024)
e4=ax/(ay4*1024)
e5=ax/(ay5*1024)
e6=ax/(ay6*1024)
e7=ax/(ay7*1024)
e8=ax/(ay8*1024)
#e4=ax/(ay4*1024)
#df.plot(kind='scatter',x='0',y1='1',y2='2') # scatter plot
#df.plot(kind='density')  # estimate density function
# df.plot(kind='hist')  # histogram

L1='Graph Building-2 locales'
L2='BFS-2 locales'
L3='Graph Building-4 locales'
L4='BFS-4 locales'
L5='Graph Building-8 locales'
L6='BFS-8 locales'
L7='Graph Building-16 locales'
L8='BFS-16 locales'
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
plt.plot(ax,e1, marker='o',label=LE1)
plt.plot(ax,e2,marker='o',label=LE2)
plt.plot(ax,e3, marker='o',label=LE3)
plt.plot(ax,e4,marker='o',label=LE4)
plt.plot(ax,e5, marker='o',label=LE5)
plt.plot(ax,e6,marker='o',label=LE6)
plt.plot(ax,e7, marker='o',label=LE7)
plt.plot(ax,e8,marker='o',label=LE8)
'''
plt.plot(ax,e1, marker='o',label='Building Efficiency-2 locales')
plt.plot(ax,e2,marker='o',label='BFS Efficiency-2 locales')
plt.plot(ax,e3, marker='o',label='Building Efficiency-4 locales')
plt.plot(ax,e4,marker='o',label='BFS Efficiency-4 locales')
plt.plot(ax,e5, marker='o',label='Building Efficiency-8 locales')
plt.plot(ax,e6,marker='o',label='BFS Efficiency-8 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Efficiency(KEdges/s)')
plt.title('Large Graph Building and BFS in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-Efficiency.png")
plt.show()
plt.close()


plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,e2,marker='o',label=LE2)
plt.plot(ax,e4,marker='o',label=LE4)
plt.plot(ax,e6,marker='o',label=LE6)
plt.plot(ax,e8,marker='o',label=LE8)
'''
plt.plot(ax,e2,marker='o',label='BFS Efficiency-2 locales')
plt.plot(ax,e4,marker='o',label='BFS Efficiency-4 locales')
plt.plot(ax,e6,marker='o',label='BFS Efficiency-8 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Efficiency(KEdges/s)')
plt.title('Large Graph BFS Efficiency in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-BFSEfficiency.png")
plt.show()
plt.close()



plt.yscale('log')
plt.xscale('log',base=2)
plt.plot(ax,e1, marker='o',label=LE1)
plt.plot(ax,e3, marker='o',label=LE3)
plt.plot(ax,e5, marker='o',label=LE5)
plt.plot(ax,e7, marker='o',label=LE7)
'''
plt.plot(ax,e1, marker='o',label='Building Efficiency-2 locales')
plt.plot(ax,e3, marker='o',label='Building Efficiency-4 locales')
plt.plot(ax,e5, marker='o',label='Building Efficiency-8 locales')
'''
plt.xlabel('Number of Edges')
plt.ylabel('Efficiency(KEdges/s)')
plt.title('Large Graph Building Efficiency in Arkouda')
plt.legend()
plt.tight_layout()
plt.savefig(inputfile+"-BuildingEfficiency.png")
plt.show()
plt.close()


