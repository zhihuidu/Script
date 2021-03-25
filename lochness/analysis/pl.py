import pandas as pd
import matplotlib as ml
import numpy as np
import sys
import csv
import statistics

import numpy, scipy, scipy.optimize
import matplotlib
from mpl_toolkits.mplot3d import  Axes3D
from matplotlib import cm # to colormap 3D surfaces from blue to red
import matplotlib.pyplot as plt
import math

def func(data, a,b,c):

    # extract data from the single list
    x1 = data[0]
    x2 = data[1]
    x3 = data[2]
    low=x1.copy()
    high=x1.copy()
    mid=x1.copy()
    
    for i in range(len(x1)):
        tmp=[x1[i],x2[i],x3[i]]
        tmp.sort()
        low[i]=tmp[0]
        mid[i]=tmp[1]
        high[i]=tmp[2]
  
    penulty=0
    #low=numpy.amin(data,axis = 1)
    #high=numpy.amax(data,axis = 1)
    #mid=numpy.mean(data,axis = 1)
    
    '''
    if a<=b :
        penulty+=10000
    if b<=c :
        penulty+=10000
    if a>5 :
        penulty+=10000
    if c<=0  :
        penulty+=10000
    '''
    return (a*low+b*mid+c*high)+penulty


if __name__ == "__main__":    
    if len(sys.argv) <1:
        print("No data file")
        exit()

    inputfile=sys.argv[1][:-4]
    df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4','5'])
    
    print(df)
    Name=df['0']
    factor=numpy.array(df['1']) #number of triangles in sketch graph
    head=numpy.array(df['2']) #Sampling Factor
    mid=numpy.array(df['3']) #Degree Ratio1
    tail=numpy.array(df['4']) #Degree Ratio2
    exact=numpy.array(df['5'])  #Exact triangle number
    x1=head*factor
    x2=mid*factor
    x3=tail*factor
    y=exact
    data = [x1,x2,x3,y]

    #initialParameters = [1.0, 1.0, 1.0, 0.0] # these are the same as scipy default values in this example
    initialParameters = [1.30,1.2,1.1] # these are the same as scipy default values in this example

    fittedParameters, pcov = scipy.optimize.curve_fit(func, [x1,x2,x3], y, p0 = initialParameters)
    #fittedParameters, pcov = scipy.optimize.curve_fit(func, [x1,x2,x3], y )
    #print("Fun(T,F,R)= {:.2e} *x1+ {:.2e} *x1*x2 + {:.2e}*x1*x2*x3+{:.2e}".format(fittedParameters[0],fittedParameters[1],fittedParameters[2],fittedParameters[3]))
    modelPredictions = func(data, *fittedParameters) 
    absError = modelPredictions - y
    relError=absError/y
    prediction=modelPredictions.astype(int)
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

