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

#df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4','5','6','7'])
df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4'])
#df  = pd.read_csv(sys.argv[1],header =1)
print(df)
x=df['0']
y1=df['1']
y2=df['2']
y3=df['3']
y4=df['4']
ax=np.array(x)
ay1=np.array(y1)
ay2=np.array(y2)
ay3=np.array(y3)
ay4=np.array(y4)
e1=ax/(ay1*1024)
e2=ax/(ay2*1024)
e3=ax/(ay3*1024)
e4=ax/(ay4*1024)

#df.plot(kind='scatter',x='0',y1='1',y2='2') # scatter plot
#df.plot(kind='density')  # estimate density function
# df.plot(kind='hist')  # histogram
ml.rc('font', size=12)
ml.rc('axes', titlesize=12)
plt.plot(x,y1, label='Len=1K')
plt.plot(x,y2,label='Len=2K')
plt.plot(x,y3,label='Len=4K')
plt.xlabel('Number of Strings')
plt.ylabel('Execution Time(s)')
plt.title('Parallel Execution Time of Different String Length')
plt.legend()
plt.savefig("Small.png")
#plt.grid (True)
plt.show()
plt.close()

plt.plot(ax,e1, label='Len=1K')
plt.plot(ax,e2,label='Len=2K')
plt.plot(ax,e3,label='Len=4K')
plt.xlabel('Number of Strings')
plt.ylabel('Sorting Efficiency(MB/s)')
plt.title('Parallel Sorting Efficiency of Different String Length')
plt.legend()
plt.savefig("SmallEfficiency.png")
plt.show()
plt.close()

