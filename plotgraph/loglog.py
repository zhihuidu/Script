import pandas as pd
import matplotlib.pyplot as plt
import sys



df  = pd.read_csv(sys.argv[1],header=0)
print(df.info())
print(df)
Graphs_Name=df['Graphs']
Num_Edges=df['Num Edges']
Graph_Construction=df['Graph Construction']
BFS=df['BFS']
Conn_Comps=df['Conn-Comps']
Tricnt_Min=df['Tricnt-Min']
Tricnt_Merge=df['Tricnt-Merge']
Jaccard=df['Jaccard']
Trictr_Min=df['Trictr-Min']
Trictr_Merge=df['Trictr-Merge']
K_Truss=df['K-Truss']
Max_Truss=df['Max-Truss']
Truss_Dec=df['Truss-Dec']


#f, (plt, ax2) = plt.subplots(1, 2, sharey=True)


plt.loglog(Num_Edges[0:13], Graph_Construction[0:13], '-b', basex=2, linewidth=2, 
           label='Graph Construction')
plt.loglog(Num_Edges[0:13], BFS[0:13], '-g', basex=2, linewidth=2, 
           label='BFS')
plt.loglog(Num_Edges[0:13], Conn_Comps[0:13], '-r', basex=2, linewidth=2, 
           label='Conn-Comps')
plt.loglog(Num_Edges[0:13], Tricnt_Min[0:13], '-c', basex=2, linewidth=2, 
           label='Tricnt-Min')
plt.loglog(Num_Edges[0:13], Tricnt_Merge[0:13], '-m', basex=2, linewidth=2, 
           label='Tricnt-Merge')

plt.loglog(Num_Edges[0:9], Jaccard[0:9], '-y', basex=2, linewidth=2, 
           label='Jaccard')
plt.loglog(Num_Edges[0:13], Trictr_Min[0:13], '-k', basex=2, linewidth=2, 
           label='Trictr-Min')

plt.loglog(Num_Edges[0:13], Trictr_Merge[0:13], ':b', basex=2, linewidth=2, 
           label='Trictr-Merge')

plt.loglog(Num_Edges[0:13], K_Truss[0:13], ':g', basex=2, linewidth=2, 
           label='K-Truss')

plt.loglog(Num_Edges[0:13], Max_Truss[0:13], ':r', basex=2, linewidth=2, 
           label='Max-Truss')
plt.loglog(Num_Edges[0:13], Truss_Dec[0:13], ':c', basex=2, linewidth=2, 
           label='Truss_Dec')
#plt.title('Execution Time vs Number of Edges for Real-world Graphs', fontsize=13)
plt.xlabel('Number of Edges', fontsize=13)
plt.ylabel('Execution Time (seconds)', fontsize=13)

plt.legend()
#plt.show()
plt.tight_layout()
plt.savefig('realworld.png')
plt.clf()


plt.loglog(Num_Edges[13:28], Graph_Construction[13:28], '-b', basex=2, linewidth=2, 
           label='Graph Construction')
plt.loglog(Num_Edges[13:28], BFS[13:28], '-g', basex=2, linewidth=2, 
           label='BFS')
plt.loglog(Num_Edges[13:28], Conn_Comps[13:28], '-r', basex=2, linewidth=2, 
           label='Conn-Comps')
plt.loglog(Num_Edges[13:28], Tricnt_Min[13:28], '-c', basex=2, linewidth=2, 
           label='Tricnt-Min')
plt.loglog(Num_Edges[13:28], Tricnt_Merge[13:28], '-m', basex=2, linewidth=2, 
           label='Tricnt-Merge')

plt.loglog(Num_Edges[13:20], Jaccard[13:20], '-y', basex=2, linewidth=2, 
           label='Jaccard')
plt.loglog(Num_Edges[13:28], Trictr_Min[13:28], '-k', basex=2, linewidth=2, 
           label='Trictr-Min')

plt.loglog(Num_Edges[13:28], Trictr_Merge[13:28], ':b', basex=2, linewidth=2, 
           label='Trictr-Merge')

plt.loglog(Num_Edges[13:28], K_Truss[13:28], ':g', basex=2, linewidth=2, 
           label='K-Truss')

plt.loglog(Num_Edges[13:28], Max_Truss[13:28], ':r', basex=2, linewidth=2, 
           label='Max-Truss')
plt.loglog(Num_Edges[13:28], Truss_Dec[13:28], ':c', basex=2, linewidth=2, 
           label='Truss_Dec')
#plt.title('Execution Time vs Number of Edges for Synthetic Graphs', fontsize=13)
#plt.title('Synthetic Graphs', fontsize=13)
plt.xlabel('Number of Edges', fontsize=13)
plt.ylabel('Execution Time (seconds)', fontsize=13)

plt.legend()
#plt.show()
plt.tight_layout()
plt.savefig('synthetic.png')
