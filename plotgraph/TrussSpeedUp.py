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
df  = pd.read_csv(sys.argv[1],header=0,names=['-1','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'],sep=' ')
#df  = pd.read_csv(sys.argv[1],header=0,names=['-1','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18'],sep=' ')
#df  = pd.read_csv(sys.argv[1],header=0)
#df  = pd.read_csv(sys.argv[1],header=0,names=['0'])
#df  = pd.read_csv(sys.argv[1],header =1)
print(df)
print("$$$$$$$$$$$$$$$$$$$$$$$$$$")
NaivePathMerge=df[-1]
for i in NaivePathMerge:
	print( i)
print("*************************")
print(NaivePathMerge[3])
print("###################")
print(NaivePathMerge[:])
'''
NaiveMinSearch=df['0']
PathMerge=df['1']
NonMinSearch=df['2']
MinSearch=df['3']
Mix=df['4']
MaxPathMerge=df['6']
MaxNonMinSearch=df['8']
MaxMinSearch=df['10']
MaxMix=df['12']

DecoNaivePathMerge=df['13']
DecoNaiveMinSearch=df['14']
DecoPathMerge=df['15']
DecoNonMinSearch=df['16']
DecoMinSearch=df['17']
DecoMix=df['18']

aNaivePathMerge=np.array(NaivePathMerge)
aNaiveMinSearch=np.array(NaiveMinSearch)
aPathMerge=np.array(PathMerge)
aNonMinSearch=np.array(NonMinSearch)
aMinSearch=np.array(MinSearch)
aMix=np.array(Mix)

aMaxPathMerge=np.array(MaxPathMerge)
aMaxNonMinSearch=np.array(MaxNonMinSearch)
aMaxMinSearch=np.array(MaxMinSearch)
aMaxMix=np.array(MaxMix)

aDecoNaivePathMerge=np.array(DecoNaivePathMerge)
aDecoNaiveMinSearch=np.array(DecoNaiveMinSearch)
aDecoPathMerge=np.array(DecoPathMerge)
aDecoNonMinSearch=np.array(DecoNonMinSearch)
aDecoMinSearch=np.array(DecoMinSearch)
aDecoMix=np.array(DecoMix)



SpeedUpNaiveMinSearch=aNaivePathMerge/aNaiveMinSearch
SpeedUpPathMerge=aNaivePathMerge/aPathMerge
SpeedUpNonMinSearch=aNaivePathMerge/aNonMinSearch
SpeedUpMinSearch=aNaivePathMerge/aMinSearch
SpeedUpMix=aNaivePathMerge/aMix

SpeedUpMaxNonMinSearch=aMaxNaivePathMerge/aMaxNonMinSearch
SpeedUpMaxMinSearch=aMaxNaivePathMerge/aMaxMinSearch
SpeedUpMaxMix=aMaxNaivePathMerge/aMaxMix


SpeedUpDecoNaiveMinSearch=aDecoNaivePathMerge/aDecoNaiveMinSearch
SpeedUpDecoPathMerge=aDecoNaivePathMerge/aDecoPathMerge
SpeedUpDecoNonMinSearch=aDecoNaivePathMerge/aDecoNonMinSearch
SpeedUpDecoMinSearch=aDecoNaivePathMerge/aDecoMinSearch
SpeedUpDecoMix=aDecoNaivePathMerge/aDecoMix
'''

'''
x = np.array([0, 1, 2, 3, 4, 5, 6])

#df.plot(kind='scatter',x='0',y1='1',y2='2') # scatter plot
#df.plot(kind='density')  # estimate density function
# df.plot(kind='hist')  # histogram
ml.rc('font', size=15)
ml.rc('axes', titlesize=15)
Label1="Delaunay_n"
Label2=["CoForAll","ForAll"]
xlabels = ("Opt", "BagL", "/BagG","SetL","SetG","DomL","DomG")
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
'''
