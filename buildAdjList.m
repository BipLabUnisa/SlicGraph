% INPUT
%   L: the slic clustered regions
%   NumLabels: the number of clusters detected by slic
    
% OUTPUT
%   Adj_list: the adjacency list. each edge is represented by the couple
%   of vertices i and j
%   Adj_matrix: the adjacency matrix. each edge is represented by a 1 in
%   position i, j

    
% Please cite the following paper, if you use this software in your
% project.

%     Abate, A.F., Barra, S., D'Aniello, F., & Narducci, F. (2016, December). 
%     Two-Tier Image Features Clustering for Iris Recognition on Mobile. 
%     In International Workshop on Fuzzy Logic and Applications (pp. 260-269). 
%     Springer, Cham.

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

function [Adj_list, Adj_matrix] = buildAdjList(L, NumLabels)
    
    Adj_matrix = zeros(NumLabels, NumLabels); 

    s1L = size(L, 1);
    s2L = size(L, 2);
    for i = 1:size(L, 1)
        for j = 1:size(L, 2)
            val = L(i, j);
            n_0 = val; n_1 = val; n_2 = val; n_3=val; 
            if (i+1<=s1L) 
                n_1 = L(i+1, j); 
                if (j+1<=s2L)
                    n_2 = L(i, j+1);
                    n_3 = L(i+1, j+1); 
                    if(i-1>0)
                        n_0 = L(i-1, j+1);
                    end
                end
            else
                if (j+1<=s2L)
                    n_2 = L(i, j+1);
                    if(i-1>0)
                        n_0 = L(i-1, j+1);
                    end
                end
            end
            

            if(val ~= n_0 & Adj_matrix(val, n_0) ~=1)
                Adj_matrix(min(val, n_0),max(val, n_0)) = 1;
            end
            if(val ~= n_1 & Adj_matrix(val, n_1) ~=1)
                Adj_matrix(min(val, n_1),max(val, n_1)) = 1;
            end
            if(val ~= n_2 & Adj_matrix(val, n_2) ~=1)
                Adj_matrix(min(val,n_2),max(val,n_2)) = 1;
            end
            if(val ~= n_3 & Adj_matrix(val, n_3) ~=1)
                Adj_matrix(min(val,n_3), max(val,n_3)) = 1;
            end
        end
    end
    
    [Adj_list(:, 1), Adj_list(:, 2)] = find(Adj_matrix == 1);
    Adj_matrix = Adj_matrix+Adj_matrix';
end