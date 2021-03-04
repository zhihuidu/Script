#!/usr/bin/env python3                                                         

import time, argparse
import numpy as np
import arkouda as ak
import random
import string

TYPES = ('int64', 'float64', 'bool', 'str')

def time_ak_bfs_graph(trials:int,fn:int):
    print("Graph BFS")
    cfg = ak.get_config()
    print("server Hostname =",cfg["serverHostname"])
    print("Number of Locales=",cfg["numLocales"])
    print("number of PUs =",cfg["numPUs"])
    print("Max Tasks =",cfg["maxTaskPar"])
    print("Memory =",cfg["physicalMemory"])

    lgNv=8
    Ne_per_v=3
    p=0.03
    directed=0
    weighted=1
    
    filename="kron_g500-logn"+str(fn)
    f = open("../../arkouda/data/kron_g500-logn/"+filename+"/"+filename+".mtx")
    Line = f.readline()
    while not(Line[1]>='0' and Line[0]<='9'):
         Line = f.readline()
         b = Line.split(" ")
    edges=int(b[2])
    vertices=max(int(b[0]),int(b[1]))


    start = time.time()
    Graph=ak.graph_file_read(edges,vertices,3,directed,"../arkouda/data/kron_g500-logn/"+filename+"/"+filename+".gr")
    #Graph=ak.graph_file_read(91,20,3,directed,"kang.gr")
    #Graph=ak.graph_file_read(3056,1024,2,directed,"../arkouda/data/"+filename)
    #Graph=ak.graph_file_read(393176,131072,2,directed,"../arkouda/data/"+filename)
    #Graph=ak.graph_file_read(786396,262144,2,directed,"../arkouda/data/delaunay/delaunay_n18.gr")
    #Graph=ak.rmat_gen(lgNv, Ne_per_v, p, directed, weighted)
    #Graph=ak.graph_file_read(103689,8276,2,directed,"data/graphs/wiki")
    #Graph=ak.graph_file_read(2981,2888,2,directed,"data/graphs/fb")
    end = time.time()
    BuildingTime=end-start
    print("Building ", filename , " takes {:.4f} seconds".format(end-start))
    print("directed graph  ={}".format(Graph.directed))
    print("weighted graph  ={}".format(Graph.weighted))
    '''
    print("source of edges   ={}".format(Graph.src))
    print("R dest of edges   ={}".format(Graph.dstR))
    print("dest of edges   ={}".format(Graph.dst))
    print("R source of edges   ={}".format(Graph.srcR))
    print("start   ={}".format(Graph.start_i))
    print("R start   ={}".format(Graph.start_iR))
    print(" neighbour   ={}".format(Graph.neighbour))
    print("R neighbour   ={}".format(Graph.neighbourR))
    print("vertices weight    ={}".format(Graph.v_weight))
    print("edges weight    ={}".format(Graph.e_weight))
    start = time.time()
    deparray = ak.graph_bfs(Graph,4)
    end = time.time()
    #print(deparray)
    #print("BFS  the graph takes {:.4f} seconds".format(end-start))
    ll,ver = ak.graph_bfs(Graph,4)
    old=-2;
    visit=[]
    for i in range(int(Graph.n_vertices)):
        cur=ll[i]
        if (int(cur)!=int(old)):
            if len(visit) >0:
                print(visit)
            print("current level=",cur,"the vertices at this level are")
            old=cur
            visit=[]
        visit.append(ver[i])
    print(visit)
    print("total edges are as follows")
    #for i in range(int(Graph.n_edges)):
    for i in range(100):
         print("<",Graph.src[i]," -- ", Graph.dst[i],">")
    print("total reverse edges are as follows")
    for i in range(int(Graph.n_edges)):
         print("<",Graph.srcR[i]," -- ", Graph.dstR[i],">")
    
    '''
    timings = []
    totalV=int(Graph.n_vertices)
    trials=1
    #selectroot = np.random.randint(0, totalV-1, trials)
    #selectroot=[0,totalV-1,(totalV-1)/2]
    selectroot=[(totalV-1)/2]

    #for root in range(trials):
    for root in selectroot:
        start = time.time()
        _ = ak.graph_bfs(Graph,int(root))
        end = time.time()
        timings.append(end - start)
    tavg = sum(timings) / trials

    BFSTime=tavg
    print("Average BFS time = {:.4f} s for {} executions".format(tavg,trials))
    print("number of vertices ={}".format(Graph.n_vertices))
    print("number of edges ={}".format(Graph.n_edges))
    print("Average BFS Edges = {:.4f} M/s".format(int(Graph.n_edges)/tavg/1024/1024))
    print("Average BFS Vertices = {:.4f} M/s".format(int(Graph.n_vertices)/tavg/1024/1024))
    print("-----------------------------------")
    print(Graph.n_edges)
    print(BuildingTime)
    print(BFSTime)
    print("-----------------------------------")
    #print("Average rate = {:.2f} GiB/sec".format(bytes_per_sec/2**30))


def create_parser():
    parser = argparse.ArgumentParser(description="Measure the performance of suffix array building: C= suffix_array(V)")
    parser.add_argument('hostname', help='Hostname of arkouda server')
    parser.add_argument('port', type=int, help='Port of arkouda server')
    parser.add_argument('-v', '--logvertices', type=int, default=5, help='Problem size: log number of vertices')
    parser.add_argument('-e', '--vedges', type=int, default=2,help='Number of edges per vertex')
    parser.add_argument('-p', '--possibility', type=float, default=0.01,help='Possibility ')
    parser.add_argument('-t', '--trials', type=int, default=6, help='Number of times to run the benchmark')
    parser.add_argument('-f', '--fileNo', type=int, default=17, help='Number of times to run the benchmark')
    parser.add_argument('-m', '--perm', type=int, default=0 , help='if permutation ')
    parser.add_argument('--numpy', default=False, action='store_true', help='Run the same operation in NumPy to compare performance.')
    parser.add_argument('--correctness-only', default=False, action='store_true', help='Only check correctness, not performance.')
    return parser


    
if __name__ == "__main__":
    import sys
    parser = create_parser()
    args = parser.parse_args()
    ak.verbose = False
    ak.connect(args.hostname, args.port)

    '''
    if args.correctness_only:
        check_correctness(args.number, args.size, args.trials, args.dtype)
        print("CORRECT")
        sys.exit(0)
    time_ak_bfs_graph(args.trials,args.fileNo)
    '''
    for i in range(18,22):
         time_ak_bfs_graph(args.trials,i)
    sys.exit(0)
