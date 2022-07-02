% Siddharth Betala BE19B032

function [core, neighbours, clusters]= clustering_algo(X,eps,min_pts)
    counter=zeros(size(X,1),1); %counter keeps track of the number of neighbours for each point
    core=strings(size(X,1),1); %whether a point is core-'c', border-'b' or noise-''
    neighbours=cell(size(X,1),1); %array where entries are vectors of the indices of each point's neighbours
    for i=1:size(X,1)
        for j=1:size(X,1)
            if sqrt((X(j,1)-X(i,1))^2+(X(j,2)-X(i,2))^2)<eps  %if the distance between the two points is less than eps, counter is incremented and that particular point is added to neighbours
                counter(i,1)=counter(i,1)+1;
                neighbours{i}(end+1)=j;
            end
        end
        if counter(i,1)>=min_pts %for core points, the number of points within eps > min_pts
            core(i,1)='c';
        end
    end

    for i=1:size(X,1)
        if core(i,1)~='c' %iterating over all those points that aren't core points
            for j=1:size(X,1)
                if sqrt((X(j,1)-X(i,1))^2+(X(j,2)-X(i,2))^2)<eps && core(j,1)=='c' %if a point is close to a core point, it is a border point
                    core(i,1)='b';
                    break; %once a point is identified as a border point, it's distance with other points need not be checked
                end
            end
        end
    end
    
    %the points that aren't labelled 'c' or 'b' are noise points

    %dbscan algorithm
    currentlabel=0;
    clusters=zeros(size(X,1),1); %keeping track of which cluster each point is assigned to
    visited=zeros(size(X,1),1); %keeping track of whether a point has been labelled or not

    for i=1:size(X,1) %iterating over each point in the dataset
        if visited(i)==0 %enter the loop if the current point hasn't been visited yet
            visited(i)=1; %updating the visitation details
            if core(i)~='' %if the current point is not a noise point
                currentlabel=currentlabel+1; %then it needs to be added to a cluster
                clusters(i)=currentlabel;
                j=1;
                temp=neighbours{i}; %temp now contains indices of the neighbours of the ith point
                while true
                    k=temp(j); %iterating over the temp vector
                    if visited(k)==0 %if the neighbour k has not been visited yet
                        new_neighbours=neighbours{k}; %the neighbours of k are now in new_neighbours
                        temp=[temp, new_neighbours]; %these new neighbours are density-reachable points (refer: <https://towardsdatascience.com/understanding-dbscan-algorithm-and-implementation-from-scratch-c256289479c5 towardsdatascience>), hence are added to the same cluster
                        if core(k)~='' && clusters(k)==0
                            clusters(k)=currentlabel; %the kth point is now labeled with the currentlabel
                        end
                        visited(k)=1; %that point is now visited
                    end
                    j=j+1;
                    if j>size(temp,2) %if j exceeds the dimensions of temp, the loop breaks
                        break;
                    end
                end
            end
        end
    end
end
