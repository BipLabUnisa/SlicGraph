% INPUT
%   I: the input image
%   numClusters: number of clusters desired
    
% OUTPUT
%   Adj_list: the adjacency list. each edge is represented by the couple
%       of vertices i and j
%   s: output of regionprops over L
%   Centroids: NumLabels x 3 Matrix which contains the index of the
%       centroid and its coords
%   L: the slic clustered regions
%   NumLabels: the number of clusters detected by slic
%   Adj_matrix: the adjacency matrix. each edge is represented by a 1 in
%       position i, j


% Please cite the following paper, if you use this software in your
% project.
% 
%     Abate, A.F., Barra, S., D'Aniello, F., & Narducci, F. (2016, December). 
%     Two-Tier Image Features Clustering for Iris Recognition on Mobile. 
%     In International Workshop on Fuzzy Logic and Applications (pp. 260-269). 
%     Springer, Cham.
% 
% Copyright (c) 2017, BIPLab, Biometric and Image Processing Laboratory
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.

function [Adj_list, s, Centroids, L, NumLabels, Adj_matrix]=processImage(I, numClusters) 

    [L,NumLabels] = superpixels(I,numClusters, 'Method', 'slic', 'NumIterations', 100); 
    [Adj_list, Adj_matrix] = buildAdjList(L, NumLabels);
    s = regionprops(L);
    [Centroids] = buildCentroidsMatrix(NumLabels, s);
    figure();
    clusteredimg = slic_draw_contours(L,I);
    subplot(1, 2, 1); imshow(I);
    subplot(1, 2, 2); imshow(clusteredimg);
    hold on; plotGraph(Centroids, Adj_list); 
    
end

