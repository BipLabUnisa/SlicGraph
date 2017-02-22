% INPUT
%   Centroids: NumLabels x 3 Matrix which contains the index of the
%       centroid and its coords
%   Adj_list: the adjacency list. each edge is represented by the couple
%       of vertices i and j

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


function plotGraph(Centroids, Adj_list)
  
    for i=1:size(Centroids, 1)
        if (Centroids(i,1)~=0)
            plot(Centroids(i, 2), Centroids(i, 3), '*');
            text(double(Centroids(i, 2)), double(Centroids(i, 3)), num2str(Centroids(i, 1)), 'Color', 'white','FontSize', 12);
        end
    end
    
    for i = 1: size(Adj_list, 1)
        src = Adj_list(i, 1);
        dst = Adj_list(i, 2);

        x(1) = Centroids(src, 2);
        x(2) = Centroids(dst, 2);
        y(1) = Centroids(src, 3);
        y(2) = Centroids(dst, 3);
        hold on;
        plot(x,y, '-b')
    end
    
   

end