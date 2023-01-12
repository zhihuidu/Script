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
filename=sys.argv[1][0:-4]
#df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4','5','6','7'])
df  = pd.read_csv(sys.argv[1],header=0,names=['0'])
#df  = pd.read_csv(sys.argv[1],header =1)
print(df)
y=df['0']
ay=np.array(y)
y11=ay[0:7]
y12=ay[7:14]
y21=ay[14:21]
y22=ay[21:28]
y31=ay[28:35]
y32=ay[35:42]
y41=ay[42:49]
y42=ay[49:56]



for i in range(4):
    speedup=ay[i*7*2:i*7*2+7]/ay[i*7*2+7:i*7*2+14]
    print(speedup)

x = np.array([0, 1, 2, 3, 4, 5, 6])

#df.plot(kind='scatter',x='0',y1='1',y2='2') # scatter plot
#df.plot(kind='density')  # estimate density function
# df.plot(kind='hist')  # histogram
ml.rc('font', size=15)
ml.rc('axes', titlesize=15)
Label1="Delaunay_n"
Label2=["CoForAll","ForAll"]
xlabels = ("Opt", "BagL", "BagG","SetL","SetG","DomL","DomG")
plt.xticks(x, xlabels)
for i in range(8):
    number=int(i/2+17)
    structure=i%2
    #plt.yscale('log')
    plt.ticklabel_format(axis="y", style="sci", scilimits=(0,0))
    if (i%2==0):
       plt.plot(x,ay[i*7:i*7+7],marker='o', label=Label1+str(number)+"-"+Label2[structure])
    else :
       plt.plot(x,ay[i*7:i*7+7],marker='*', label=Label1+str(number)+"-"+Label2[structure])

    if (i%2==1):
       plt.xlabel('Different Methods')
       plt.ylabel('Execution Time(s)')
       #plt.title('Parallel Execution Time of Different BFS Methods')
       plt.legend()
       plt.xticks(x, xlabels)
       #plt.grid (True)
       plt.show()
       plt.tight_layout()
       plt.savefig(filename+"-"+Label1+str(number)+"-bfs.png")
       plt.close()
