import numpy as np
import networkx as nx
import sys

from scipy.io import mmread
import networkx as nx

# The first element in sys.argv is the script name itself
script_name = sys.argv[0]

# Command-line arguments start from index 1
# Check if there are additional command-line arguments
if len(sys.argv) > 1:
    # Access additional command-line arguments
    arguments = sys.argv[1: ]
    
    # Print all command-line arguments
    #print("Command-line arguments:", arguments)

    # Access specific command-line arguments
    if len(arguments) >= 2:
        first_arg = arguments[0]
        second_arg = arguments[1]
        print("First argument:", first_arg)
        print("Second argument:", second_arg)
else:
    print("No additional command-line arguments provided.")
    exit(0)


# Specify the path to your Matrix Market (MTX) graph file
#file_name = "/rhome/zhihui/Adata/SNAP/ca-GrQc.mtx"

# Read the graph from the MTX file
#G = nx.readwrite.mtx.read_mtx_graph(file_path)

a = mmread(sys.argv[1])
G = nx.Graph(a)

# Now you can use NetworkX functions on the graph
#print("Nodes:", G.nodes())
#print("Edges:", G.edges())

# Example: Calculate the diameter of the graph
#diameter = nx.algorithms.distance_measures.diameter(G)
InducedGS = [G.subgraph(c).copy() for c in nx.connected_components(G)]

i=0
maxdia=0
for sub in InducedGS :
    print(sub)
    diameter=nx.diameter(sub)
    print("Diameter of the ",i," subgraph is :", diameter)
    i=i+1
    if maxdia<diameter:
        maxdia=diameter
print("Graph=",sys.argv[1]," Num of Components=",len(InducedGS)," Largest Diameter=",maxdia)
#diameter = nx.diameter(G)
#print("Diameter of the graph:", diameter)

#adjacency_matrix = nx.to_numpy_matrix(G)
#adjacency_matrix =nx.adjacency_matrix(G)
#print(adjacency_matrix)
#adjacency_matrix = nx.to_numpy_array(G)

def matrix_power(matrix, exponent):
    result = np.eye(len(matrix), dtype=int)
    while exponent > 0:
        if exponent % 2 == 1:
            result = np.dot(result, matrix)
        matrix = np.dot(matrix, matrix)
        exponent //= 2
    return result

def find_diameter(adjacency_matrix):
    #n = len(adjacency_matrix)
    A = np.array(adjacency_matrix)
    
    # Set M0 = A
    Mk = A.copy()
    k = 0

    # Compute Mk+1 = Mk^2 until Mk contains no zeros
    while np.any(Mk == 0):
        Mk = matrix_power(Mk, 2)
        k += 1

    # Binary search between MK = A^(2^k) and MK-1 = A^(2^(k-1))
    left, right = matrix_power(A, 2**(k-1)), matrix_power(A, 2**k)
    B = left.copy()
    DIAMETER = 2**(k-1)

    for i in range(k-2, -1, -1):
        M_i = matrix_power(A, 2**i)

        # Multiply B by Mi
        B = np.dot(B, M_i)

        # Check for zeroes in the resulting matrix
        if np.any(B == 0):
            B = np.dot(left, M_i)
            DIAMETER += 2**i

    return DIAMETER

# Example usage:
# Define your graph as an adjacency matrix with added self-loops
graph_adjacency_matrix = [
    [1, 1, 0, 0, 0],
    [1, 1, 1, 0, 0],
    [0, 1, 1, 0, 1],
    [0, 0, 0, 1, 1],
    [0, 0, 1, 1, 1]
]

#result = find_diameter(adjacency_matrix)
#print("Diameter of the graph:", result)

