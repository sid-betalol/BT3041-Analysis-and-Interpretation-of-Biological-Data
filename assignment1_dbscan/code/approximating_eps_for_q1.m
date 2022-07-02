% Siddharth Betala BE19B032

data=importdata('dbscan2000.mat');
X=cell2mat(data);
min_pts = 4; %according to the Intro to Data Mining book, for 2D data sets, min_pts = 4 is a good choice. 
distance_matrix=zeros(size(X,1));    
for i=1:size(X,1)
    for j=1:size(X,1)
        distance_matrix(i,j)=sqrt((X(j,1)-X(i,1))^2+(X(j,2)-X(i,2))^2); %constructing a matrix of ditances for each point from all the other points
    end
end

kth_distance=zeros(size(distance_matrix,1),1); %array to store the distance of the kth closest point, where k starts from the point itself to the farthest point in the range of min_pts.
new=sort(distance_matrix,2);
find_index=zeros(size(distance_matrix,1),1);
for i=1:size(distance_matrix,1)
    find_index(i,1)=find(distance_matrix(i,:)==new(i,min_pts));
end
for i=1:size(distance_matrix,1)
    kth_distance(i)=distance_matrix(i,find_index(i,1));
end
sorted_distance=sort(kth_distance);
plot(sorted_distance); %sorted distances are plotted so that the an apporximate guess of the steepest point can be guessed, to find the epsilon radius value.
