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

def func(data, a, b , c, d):

    # extract data from the single list
    x1 = data[0]
    x2 = data[1]
    x3 = data[2]
    x4 = data[3]
    return x1*x2+a*x2+b*x3+c*x4+d


if __name__ == "__main__":    
    if len(sys.argv) <1:
        print("No data file")
        exit()

    inputfile=sys.argv[1][:-4]
    df  = pd.read_csv(sys.argv[1],header=0,names=['0','1','2','3'])
    
    print(df)
    x1=df['0'] #number of triangles in sketch graph
    x2=df['1'] #Sampling Factor
    x3=df['2'] #Degree Ratio1
    x4=df['3'] #Degree Ratio2
    y=df['4']  #Exact triangle number
    xData=x1
    yData=x2
    zData=y
    data = [x1,x2,x3,x4,y]

    #initialParameters = [1.0, 1.0, 1.0, 0.0] # these are the same as scipy default values in this example
    initialParameters = [1.0, 1.0] # these are the same as scipy default values in this example

    fittedParameters, pcov = scipy.optimize.curve_fit(func, [x1,x2,x3,x4], y, p0 = initialParameters)
    #fittedParameters, pcov = scipy.optimize.curve_fit(func, [x1,x2,x3], y )
    #print("Fun(T,F,R)= {:.2e} *x1+ {:.2e} *x1*x2 + {:.2e}*x1*x2*x3+{:.2e}".format(fittedParameters[0],fittedParameters[1],fittedParameters[2],fittedParameters[3]))
    modelPredictions = func(data, *fittedParameters) 
    absError = modelPredictions - y
    SE = numpy.square(absError) # squared errors
    MSE = numpy.mean(SE) # mean squared errors
    RMSE = numpy.sqrt(MSE) # Root Mean Squared Error, RMSE
    Rsquared = 1.0 - (numpy.var(absError) / numpy.var(y))
    print('RMSE:{:.2f}'.format(RMSE))
    print('R-squared:{:.2f}'.format(Rsquared))
    print("Fun(T,F,R)=({:.2e} *x2+ {:.2e} * x3)*x1".format(fittedParameters[0],fittedParameters[1]))

