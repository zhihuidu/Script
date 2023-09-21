#import tkinter
#import matplotlib
#matplotlib.use('TkAgg')
#matplotlib.use('Agg')
import matplotlib.pyplot as plt

import copy

import numpy as np
import pandas as pd
import sys

FontSize=24

# Check if a filename argument is provided
if len(sys.argv) < 2:
    print("Please provide a filename as an argument.")
    sys.exit(1)

# Get the filename from the command-line argument
filename = sys.argv[1]

algname = sys.argv[2]
# Read the text file
data = pd.read_csv(filename, sep=' ', header=None)
alg = pd.read_csv(algname, header=None)

# Extract the graph name

print(data)

print(alg.loc[0,0],alg.loc[1,0])
l=[]
for i in range(0,27):
    print(i)
    l.append(alg.loc[i,0])
print(l)
#execution_values = data.iloc[:, 0:27]
#exetime=execution_values.to_numpy()
#pda=pd.DataFrame(exetime,columns = range(0,27))
#plt.tight_layout()
#plt.figure(figsize(20,12))
plt.rcParams["figure.figsize"] = (40,16)
plt.rcParams.update({'font.size': FontSize})
ax=data.plot.line()
ax.legend(l,loc='lower center',ncols=4 )
#ax.set_yscale('symlog', basey=10)
plt.yscale('log',base=2) 
plt.ylabel("Execution Time(s)")
plt.xlabel("Graph ID")
#plt.legend(ncol=3)
plt.title("Comparison of Execution Time")
#plt.subplots_adjust(bottom=0.19)
plt.savefig(filename+"-ExeTime.png")
plt.show()
plt.close()
