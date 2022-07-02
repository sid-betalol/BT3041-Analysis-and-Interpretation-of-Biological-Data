% Siddharth Betala BE19B032
%importing the data
data=importdata('dbscan2000.mat');
X=cell2mat(data);

% for 4 points, as according to the Intro to Data Mining book, for 2D data 
% sets, min_pts = 4 is a good choice.
min_pts=4;
eps=0.132; % approximated through the find_eps_for_q1.m file

% same epsilon but larger number of min_pts, as this is a huge dataset.
%min_pts = 12;
%eps = 0.132;

%using the clustering algorithm on the dataset
[core, neighbours, clusters]= clustering_algo(X,eps,min_pts);

x=X(:,1);
y=X(:,2);

%finding the number of core, border, and noise points
core_pts = size(find(x(core=='c')&y(core=='c')));
border_pts = size(find(x(core=='b')&y(core=='b')));
noise_pts = size(find(x(core=='')&y(core=='')));

%finding the number of points in each cluster
cluster1_pts = size(find(x(clusters==1)&y(clusters==1)));
cluster2_pts = size(find(x(clusters==2)&y(clusters==2)));
cluster3_pts = size(find(x(clusters==3)&y(clusters==3)));
cluster4_pts = size(find(x(clusters==4)&y(clusters==4)));
noise_cluster = size(find(x(clusters==0)&y(clusters==0)));

%plotting core, border and noise points
subplot(2,2,1);
plot(x(core=='c'),y(core=='c'),'.','markersize',5,'color','red'); 
hold on;
plot(x(core=='b'),y(core=='b'),'.','markersize',8,'color','green'); 
plot(x(core==''),y(core==''),'.','markersize',8,'color','black'); 
legend('core','Border','Noise');

%plotting the different clusters
subplot(2,2,4);
plot(x(clusters==1),y(clusters==1),'.','markersize',8,'color','red'); 
hold on;
plot(x(clusters==2),y(clusters==2),'.','markersize',8,'color','green'); 
plot(x(clusters==3),y(clusters==3),'.','markersize',8,'color','magenta'); 
plot(x(clusters==4),y(clusters==4),'.','markersize',8,'color','blue');
plot(x(clusters==0),y(clusters==0),'.','markersize',8,'color','black'); 
legend('Cluster 1','Cluster 2','Cluster 3', 'Cluster 4', 'Noise');
