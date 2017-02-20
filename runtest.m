I = imread('Lena.jpg');

numClusters = 64;

[Adj_list, s, Centroids, L, NumLabels, Adj_matrix]=processImage(I, numClusters);
