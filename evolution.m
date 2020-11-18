function[RI,ARI,NMI]=evolution(A,F,c)
%%%%%%%%%%%%%%%%%%%%%%%%%%���ۺ�������
f11=0;
f00=0;
fz=0;
fm1=0;
fm2=0;
r1=0;
r2=0;
[n,d]=size(A);
%%%%% ԭʼ���ݼ���Ԫ��ͳ��
for i=1:c
     a(i).jh=[];
     b(i).jh=[];
 end
 for i=1:n
     for j=1:c
     if A(i,d)==j
        a(j).jh=[a(j).jh;A(i,1:d-1)];
     end
     if F(i,d)==j
         b(j).jh=[b(j).jh;F(i,1:d-1)];
     end
     end
 end
 %%%%%%%%%%%%%%%������������
 for i=1:c
     for j=1:c
         if size(a(j).jh,1)>0
            hx(i,j)=sum(ismember(a(i).jh,b(j).jh,'rows'));
            if hx(i,j)>=2
               f11=nchoosek(hx(i,j), 2)+f11;
            end
         else
             hx(i,j)=0;
         end
     end
 end
 for i=1:c
     for j=1:c
         f00=hx(i,j)*(sum(sum(hx))-sum(hx(i,:))-sum(hx(:,j))+hx(i,j))+f00;
     end
 end
 f00=f00/2;
 %%%%%%% Rand Index
 RI=(f00+f11)/(n*(n-1)/2);
 %%%%%%% Adjust Rand Index
 for i=1:c
     if sum(hx(i,:))>=2
     r1=r1+nchoosek(sum(hx(i,:)), 2);
     end
 end
 for j=1:c
     if sum(hx(:,j))>=2
        r2=r2+nchoosek(sum(hx(:,j)), 2);
     end
 end
 ARI=(f11-(r1*r2)/(n*(n-1)/2))/((r1/2+r2/2)-(r1*r2)/(n*(n-1)/2));
 
 %%%%%%% NMI(Normalized Mutual Information) 
 for i=1:c
     for j=1:c
         if size(a(j),1)>0&&hx(i,j)>0
            fz=fz+hx(i,j)*log((n*hx(i,j))/(size(a(i).jh,1)*size(b(j).jh,1)));
         end
     end
 end
 for i=1:c
        fm1=fm1+size(a(i).jh,1)*log(size(a(i).jh,1)/n);
 end
 for j=1:c
     if size(a(j).jh,1)>0
        fm2=fm2+size(b(j).jh,1)*log(size(b(j).jh,1)/n);
     end
 end
 if fm1*fm2==0
     NMI=0;
 else
     NMI=fz/sqrt(fm1*fm2);
 end