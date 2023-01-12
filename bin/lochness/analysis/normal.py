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
    return (a*low+b*mid+c*high)+penulty

def func2(data, a, b):
    # extract data from the single list
    x1 = data[0]
    x2 = data[1]
    x3 = data[2]
    x4 = data[3]
    return x1*x2+a*x4+b

if __name__ == "__main__":    
    if len(sys.argv) <1:
        print("No data file")
        exit()

    inputfile=sys.argv[1][:-4]
    df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3','4'])
    
    #print(df)
    '''
    x1=df['0'] #number of triangles in sketch graph
    x2=df['1'] #Sampling Factor
    x3=df['2'] #Degree Ratio1
    x4=df['3'] #Degree Ratio2
    y=df['4']  #Exact triangle number
    data = [x1,x2,x3,x4,y]
    data1 = [x1,x2,y]
    data2 = [x1,x2,x4,y]
    '''
    factor=numpy.array(df['0']) #number of triangles in sketch graph
    head=numpy.array(df['1']) #Sampling Factor
    mid=numpy.array(df['2']) #Degree Ratio1
    tail=numpy.array(df['3']) #Degree Ratio2
    exact=numpy.array(df['4'])  #Exact triangle number
    x1=head*factor
    x2=mid*factor
    x3=tail*factor
    y=exact
    data = [x1,x2,x3,y]


    #initialParameters = [1.0, 1.0, 1.0, 0.0] # these are the same as scipy default values in this example
    initialParameters = [1.0,1.0,1.0] # these are the same as scipy default values in this example

    fittedParameters1, pcov1 = scipy.optimize.curve_fit(func, [x1,x2,x3], y, p0 = initialParameters)
    modelPredictions1 = func(data, *fittedParameters1) 
    absError1 = modelPredictions1 - y
    relativeErr1=absError1/y
    print(relativeErr1)
    SE1 = numpy.square(absError1) # squared errors
    MSE1 = numpy.mean(SE1) # mean squared errors
    RMSE1 = numpy.sqrt(MSE1) # Root Mean Squared Error, RMSE
    Rsquared1 = 1.0 - (numpy.var(absError1) / numpy.var(y))
    print('RMSE:{:.2f}'.format(RMSE1))
    print('R-squared:{:.2f}'.format(Rsquared1))
    #print("Fun(T,F,R)=x1*x2+ {:.2e} * x3 + {:.2e}".format(fittedParameters1[0],fittedParameters1[1]))
    print(fittedParameters1)
    #print("Fun(T,F,R)=x1*x2 *  {:.2e} * x3 + {:.2e}".format(fittedParameters1[0],0))

    '''
    fittedParameters2, pcov2 = scipy.optimize.curve_fit(func, [x1,x2,x4], y, p0 = initialParameters)
    modelPredictions2 = func(data2, *fittedParameters2) 
    absError2 = modelPredictions2 - y
    SE2 = numpy.square(absError2) # squared errors
    MSE2 = numpy.mean(SE2) # mean squared errors
    RMSE2 = numpy.sqrt(MSE2) # Root Mean Squared Error, RMSE
    Rsquared2 = 1.0 - (numpy.var(absError2) / numpy.var(y))
    print('RMSE:{:.2f}'.format(RMSE2))
    print('R-squared:{:.2f}'.format(Rsquared2))
    #print("Fun(T,F,R)=x1*x2+ {:.2e} * x3 + {:.2e}".format(fittedParameters1[0],fittedParameters1[1]))
    print("Fun(T,F,R)=x1*x2+ {:.2e} * x3 + {:.2e}".format(fittedParameters2[0],0))
    '''
