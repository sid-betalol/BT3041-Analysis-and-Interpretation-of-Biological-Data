% Siddharth Betala BE19B032

%importing the data
X=csvread('Clustering_gmm.csv',1,0);

% eps and min_pts values are given
eps= 0.5;
min_pts= 10;

%using the clustering algorithm on the dataset
[core, neighbours, clusters]= clustering_algo(X,eps,min_pts);

x=X(:,1);
y=X(:,2);

%finding the number of core, border, and noise points
core_pts = size(find(x(core=='c')&y(core=='c')));
border_pts = size(find(x(core=='b')&y(core=='b')));
noise_pts = size(find(x(core=='')&y(core=='')));

%plotting core, border and noise points
subplot(2,2,1);
plot(x(core=='c'),y(core=='c'),'.','markersize',5,'color','red'); 
hold on;
plot(x(core=='b'),y(core=='b'),'.','markersize',8,'color','green'); 
plot(x(core==''),y(core==''),'.','markersize',8,'color','black'); 
legend('Core','Border','Noise');
xlabel('Weight');
ylabel('Height');

%plotting the different clusters
subplot(2,2,4);
plot(x(clusters==1),y(clusters==1),'.','markersize',8,'color','red'); 
hold on;
plot(x(clusters==2),y(clusters==2),'.','markersize',8,'color','green'); 
plot(x(clusters==3),y(clusters==3),'.','markersize',8,'color','magenta'); 
plot(x(clusters==4),y(clusters==4),'.','markersize',8,'color','blue');
plot(x(clusters==0),y(clusters==0),'.','markersize',8,'color','black'); 
legend('Cluster 1','Cluster 2','Cluster 3', 'Cluster 4', 'Noise');
xlabel('Weight');
ylabel('Height');

%the following code snippet was added after finding out that the given
%parameters give 4 clusters

%finding the number of points in each cluster
cluster1_pts = size(find(x(clusters==1)&y(clusters==1)));
cluster2_pts = size(find(x(clusters==2)&y(clusters==2)));
cluster3_pts = size(find(x(clusters==3)&y(clusters==3)));
cluster4_pts = size(find(x(clusters==4)&y(clusters==4)));
noise_cluster = size(find(x(clusters==0)&y(clusters==0)));
