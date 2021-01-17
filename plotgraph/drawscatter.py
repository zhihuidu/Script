import pandas as pd
import matplotlib.pyplot as plt
import sys
df  = pd.read_csv("data.csv")
df.plot()  # plots all columns against index
df.plot(kind='scatter',x='x',y='y') # scatter plot
df.plot(kind='density')  # estimate density function
# df.plot(kind='hist')  # histogram



w = 4
h = 3
d = 70
plt.figure(figsize=(w, h), dpi=d)
iris_data = np.genfromtxt( "iris.csv", names=True, dtype="float", delimiter=",")

plt.plot(iris_data["sepal_length"], iris_data["sepal_width"], "o")
plt.savefig("out.png")




import matplotlib.pyplot as plt
import csv

x = []
y = []

with open('example.txt','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        x.append(int(row[0]))
        y.append(int(row[1]))

plt.plot(x,y, label='Loaded from file!')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Interesting Graph\nCheck it out')
plt.legend()
plt.show()




import matplotlib.pyplot as plt
import numpy as np

x, y = np.loadtxt('example.txt', delimiter=',', unpack=True)
plt.plot(x,y, label='Loaded from file!')

plt.xlabel('x')
plt.ylabel('y')
plt.title('Interesting Graph\nCheck it out')
plt.legend()
plt.show()


#scatter_plotting.py

import pandas as pd
import matplotlib.pyplot as plt

plt.style.use('seaborn')  # to get seaborn scatter plot

# read the csv file to extract data

data = pd.read_csv('scatter_plot_data.csv')
view_count = data['view_count']
likes = data['likes']
ratio = data['ratio']

plt.scatter(view_count, likes, s=100, alpha=0.6, edgecolor='black', linewidth=1)

plt.title('Trending Videos')
plt.xlabel('Views')
plt.ylabel('Likes')

plt.tight_layout()
plt.show()



import pandas as pd
df3 = pd.DataFrame ([[5.1], [6.1]]) # 1 column only
print (df3)
input3 = df3.loc [:, 0]
output3 = df3.loc [:, 1] # KeyError: 'the label [1] is not in the [columns]'

df2 = pd.read_csv ('2.csv', header = None, delim_whitespace = True, decimal = ',') | column 1 | column 2 | column 3 |
input2 = df2.loc [:, 0]
output2 = df2.loc [:, 1]
df3 = pd.read_csv ('3.csv', header = None, delim_whitespace = True, decimal = ',')
input3 = df3.loc [:, 0]
output3 = df3.loc [:, 1]
df4 = pd.read_csv ('. csv', header = None, delim_whitespace = True, decimal = ',') | column 1 | column 2 | column 3 |
input4 = df4.loc [:, 0]
output4 = df4.loc [:, 1]
#x = np.linspace (-6,6,1000)
ax.scatter (input2, output2)
ax.scatter (input3, output3)
ax.scatter (input4, output4)
ax.set_xlabel ('x')
ax.set_ylabel ('y')
ax.grid (True)
fig.show ()


data1 = pd.read_csv ("1.csv")
data2 = pd.read_csv ("2.csv")
data3 = pd.read_csv ("3.csv")
X1 = data1 ['X_1']
Y1 = data1 ['Y_1']
X2 = data2 ['X_2']
Y2 = data2 ['Y_2']
X3 = data3 ['X_3']
Y3 = data3 ['Y_3']
plt.scatter (X1, Y1, edgecolor = 'black', color = 'red', label = 'Y_1')
plt.scatter (X2, Y2, edgecolor = 'black', color = 'blue', label = 'Y_2')
plt.scatter (X3, Y3, edgecolor = 'black', color = 'yellow', label = 'Y_3')
# plt.title ('sample')
plt.xlabel ('time')
plt.ylabel ('data')
plt.grid (True)
plt.legend (bbox_to_anchor = (1, 1)) # Display labels representing data groups outside the graph
plt.show ()



