%
% Liscense Notification 2013
%
% Redistributions in source and binary forms, with or without
% modification, are totally FREE provided that you keep this keep this
% notification
%
%  Descritption: This package demonstrates how to use the logistic
%  regression for classfication of 2D data.
%  Author:  Ranch Lai (ranchlai@hotmail.com)
%  Release date: Aug 17, 2013
%/
%%
clc;
clear;
close all;
%% generate random data
shift = 3;
n = 200;
m=200;
d = 2;
sigma = 1;
x = randn(d,n)-shift;
y = randn(d,m)*sigma+shift;
%%
%show the data
figure;
plot(x(1,:),x(2,:),'rs');
hold on;
plot(y(1,:),y(2,:),'go');
%title('2d training data');
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
x1 = -shift-2:0.1:shift+2*sigma;
y1 = (-w(3)-w(1)*x1)/w(2);
plot(x1,y1,'-','LineWidth',2);
legend('Positive samples','Negative samples','Linear programming');
 

%% svm
H = eye(d+1);
H(d+1,d+1) = 0;
w = quadprog(H,zeros(d+1,1),A,c);
hold on;
x1 = -shift-2:0.1:shift+2*sigma;
y1 = (-w(3)-w(1)*x1)/w(2);
plot(x1,y1,'g-','LineWidth',2);
y1 = (-1-w(3)-w(1)*x1)/w(2);
plot(x1,y1,'g-','LineWidth',2);
y1 = (1-w(3)-w(1)*x1)/w(2);
plot(x1,y1,'g-','LineWidth',2);
legend('Positive samples','Negative samples','Linear programming','Linear SVM');
        
        




