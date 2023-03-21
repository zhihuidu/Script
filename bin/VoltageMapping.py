from numpy import random
import numpy as np
import math
N=15
A=[0]
M=[0]
for i in range(N):
    A.append(N-i)
    M.append(i+1)
NewM=M[:]
OriM=M[:]
OA=A[:]
y=-1
while y<0:
  B=OA[:]
  arr = np.array(B[1:N+1])
  print("arr=",arr)
  random.shuffle(arr)
  print("after shuffle arr=",arr)
  for i in range(N):
     A[i+1]=arr[i]
  print(A)
  M=OriM[:]
  NewM=M[:]
  print(M)
  i=1
  x=-1
  while x<0:
     for j in range(N):
            tmp=min(M[A[j]],M[A[j+1]],M[M[A[j]]],M[M[A[j+1]]])
            if (NewM[A[j]]>tmp) :
                NewM[A[j]]=tmp
            if (NewM[A[j+1]]>tmp):
                NewM[A[j+1]]=tmp
            if (NewM[M[A[j]]]>tmp):
                NewM[M[A[j]]]=tmp
            if (NewM[M[A[j+1]]]>tmp):
                NewM[M[A[j+1]]]=tmp
     print("After the ",i," iteration")
     print(M)
     print(NewM)
     for j in range(N+1):
         print("{0:2d} -> {1:2d} ->{2:2d}".format(A[j],NewM[A[j]],NewM[NewM[A[j]]]))
         #print("2dA[j]}," ->",NewM[A[j]]," ->",NewM[NewM[A[j]]])
     M=NewM[:]
     i=i+1
     x=1
     if i>6 :
        y=1
     for j in range(N+1):
         if M[j]>0:
            x=-1
            break
     if x==1:
        print("It takes ",i-1," iterations to converge")
