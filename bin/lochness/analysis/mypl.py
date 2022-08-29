import pandas as pd
import matplotlib as ml
import numpy as np
import sys
import csv

import numpy, scipy, scipy.optimize
import matplotlib
from mpl_toolkits.mplot3d import  Axes3D
from matplotlib import cm # to colormap 3D surfaces from blue to red
import matplotlib.pyplot as plt
import math

def func(data, a):

    # extract data from the single list
    x1 = data[0]
    #return a*(x1**b+x2**b+x3**b)*x4
    #x=a*(numpy.log2(x1)+numpy.log2(x2)+numpy.log2(x3))*numpy.log2(x4)
    x=(x1**2)
    r=x
    return r


if __name__ == "__main__":    

    '''
    if len(sys.argv) <1:
        print("No data file")
        exit()

    inputfile=sys.argv[1][:-4]
    df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4'])
    
    print(df)
    factor=numpy.array(df['0']) #number of triangles in sketch graph
    head=numpy.array(df['1']) #Sampling Factor
    mid=numpy.array(df['2']) #Degree Ratio1
    tail=numpy.array(df['3']) #Degree Ratio2
    exact=numpy.array(df['4'])  #Exact triangle number
    x1=numpy.log2(head)
    x2=numpy.log2(mid)
    x3=numpy.log2(tail)
    x4=factor
    y=numpy.log2(exact)
    x1=head
    x2=mid
    x3=tail
    x4=factor
    y=exact
    '''
    x1=[0.01,0.5,0.99]
    y=[0.001,0.25,0.7]
    k=-numpy.log(y)/numpy.log(x1)
    print(k)
    for i in {0,1,2} :
       x = np.linspace(0.001,0.999,100)
       y=x**(-k[i])
       plt.plot(x,y)
       plt.show()       

    print(x)
    exit(0)
    data = [x1,x2,x3,x4,y]

    #initialParameters = [1.0, 1.0, 1.0, 0.0] # these are the same as scipy default values in this example
    initialParameters = [1.0,1.0,1.0] # these are the same as scipy default values in this example

    fittedParameters, pcov = scipy.optimize.curve_fit(func, [x1,x2,x3,x4], y, p0 = initialParameters)
    #fittedParameters, pcov = scipy.optimize.curve_fit(func, [x1,x2,x3], y )
    #print("Fun(T,F,R)= {:.2e} *x1+ {:.2e} *x1*x2 + {:.2e}*x1*x2*x3+{:.2e}".format(fittedParameters[0],fittedParameters[1],fittedParameters[2],fittedParameters[3]))
    modelPredictions = func(data, *fittedParameters) 
    absError = modelPredictions - y
    relError=absError/y
    print("prediction=")
    prediction=modelPredictions.astype(int)
    print(prediction)
    print("exact=")
    print(y)
    print("relative error=")
    print(relError)
    SE = numpy.square(absError) # squared errors
    MSE = numpy.mean(SE) # mean squared errors
    RMSE = numpy.sqrt(MSE) # Root Mean Squared Error, RMSE
    Rsquared = 1.0 - (numpy.var(absError) / numpy.var(y))
    print('RMSE:{:.2f}'.format(RMSE))
    print('R-squared:{:.2f}'.format(Rsquared))
    print(fittedParameters)
    #print("Fun(h,m,t,f)={:.2e} *(h+m+t)*f".format(fittedParameters[0]))

