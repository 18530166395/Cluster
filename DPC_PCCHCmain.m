clc;
clear;
close all; 
%% ��ȡ����
%  AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\flame.txt');KK=2;
%          AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\Aggregation.txt');KK=7;
%    AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\pathbased.txt');KK=3;
% %      AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\spiral.txt');KK=3;
% %       AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\jain.txt');KK=2;
% % % % % % % % %  AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\Compound.txt');KK=6;
%            AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\R15.txt');KK=15;
%         AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\shape\D31.txt');KK=31;
% % % % % % % % % % % %%%%
%         AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\large2d\s2-lab.txt');KK=15
% % %     AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\large2d\birch1-lab.txt');KK=100;
% % % %  AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\large2d\magic04.lab.txt');KK=14;%�ܲ���
% % % %  AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\large2d\Skin_NonSkin.txt');K=14;
% % % % % % % % % %AA=load('MLL1.mat');AA=AA.MLL1;KK=3;
% % % % % % % % % %%%%%UCI���ݼ�%%%%%%%%
%      AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\iris.txt');KK=3;  
% %     AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\seeds_dataset.txt');KK=3;
%        AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\Wine.txt');KK=3;
% %       AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\Wdbc.txt');KK=2;
%        AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\Segmentation.txt');KK=7;
%                 AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\\uci\Libras.txt');KK=15;
% %       AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\Ionosphere.txt');KK=2;
% %         AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\ecoli.data');KK=8
% %   AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\waveform.data');KK=3
% % % % % % % % % % % % % % AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\RingNorm.txt');KK=2
% % % % % % % % % % % % % % AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\pendigits.txt');KK=10
% %       AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\balance-scale.txt');KK=3
% %      AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\parkinsons.txt');KK=2
%       AA=load('C:\Users\MAIBENBEN\Desktop\ԭʼ\dataset\uci\dermatology.txt');KK=6
% % %  
% %% �����й�һ�� 
 AA=load('C:\Users\MAIBENBEN\Desktop\1.txt');KK=5;



B=AA(:,1:end-1);
B= libsvmscale(B,0,1);  % ���ݹ�һ��
[rows,dim]=size(AA);
A=[B,AA(:,end)];
LAB=AA(:,end);
%% ��ʾԭʼ��� 
%���ݸ�ʽΪ���У�ǰ�����Ƕ�ά���ݣ����һ�������  x,y,c  
%�����ʾ7�����ľ���
if( dim==3)
    ShowClusterA(A,'origin spiral')
end
j=1;

%         for      i=0.05:0.05:5
%        for d=0.0004:0.00004:0.0012;
          for i=3.55
%     for p=1:1:5;
for d=0.00084
    for l=19

%DPC�ܶȷ����
%ret=FADPC(A,B,KK);
%ret=FADPC_H(B,KK);
%ret=FADPC_DIV(B,KK);
tic
ret=DPC_t1(B,KK,i,d,l); 
toc
LB=ret.cl';
F=[B,ret.cl'];
% [RI(j),ARI(j),NMI(j)]=evolution(A,F,KK);
% ami(j)=GetAmi(LAB,LB);
% fmi(j)=GetFmi(LAB,LB);
% ari(j)=GetAri(LAB,LB);
%   end
 j=j+1;
% jj=jj+1;
% end
    end
    end
       end
%%%%%% 
F=[B,ret.cl'];
if( dim==3)
ShowClusterA(F,'DPC Clustering');
end
% max(ARI)
% [n,m]=find(ari==max(max(ari)))
% max(ami)
% [v,b]=find(ami==max(max(ami)))
% max(fmi)
% [x,c]=find(fmi==max(max(fmi)))
icl=ret.icl;
% for i=1:length(icl)
%    cl=icl(i);
%    plot(B(cl,1),B(cl,2),'*');
%    hold on;
% end
% LB=ret.cl';
% critcurr1 = evalclusters(B,LB,'DaviesBouldin');
% [RI,ARI,NMI]=evolution(A,F,KK);
% RI
% ARI
% NMI