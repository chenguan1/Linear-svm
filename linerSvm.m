%%
clc;
clear;
close all;

%% load data
x=load('data1.txt')';
y=load('data2.txt')';

d=2;
n=size(x,2);
m=size(y,2);


%%
%show the data
figure;
plot(x(1,:),x(2,:),'rs');
hold on;
plot(y(1,:),y(2,:),'go');
legend('Positive samples','Negative samples');

%%
%training..
for i=1:n
    A(i,:) = [-x(:,i)',-1];
end
for i=1:m
    A(i+n,:) = [y(:,i)',1];
end
c = ones(n+m,1)*(-1);
w = linprog(zeros(d+1,1),A,c);
hold on;

%% visualize the classification aera
minx=min(min(x(1,:)),min(y(1,:)));
maxx=max(max(x(1,:)),max(y(1,:)));
x1 = minx:0.1:maxx;
y1 = (-w(3)-w(1)*x1)/w(2);
plot(x1,y1,'-','LineWidth',2);
legend('Positive samples','Negative samples','Linear programming');


% %% svm
% H = eye(d+1);
% H(d+1,d+1) = 0;
% w = quadprog(H,zeros(d+1,1),A,c);
% hold on;
% x1 = minx:0.1:maxx;
% y1 = (-w(3)-w(1)*x1)/w(2);
% plot(x1,y1,'g-','LineWidth',2);
% y1 = (-1-w(3)-w(1)*x1)/w(2);
% plot(x1,y1,'g-','LineWidth',2);
% y1 = (1-w(3)-w(1)*x1)/w(2);
% plot(x1,y1,'g-','LineWidth',2);
% legend('Positive samples','Negative samples','Linear programming','Linear SVM');

