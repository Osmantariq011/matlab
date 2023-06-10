function [T] = Jacobi(a,b,N,tol)
n=length(b);
xo=zeros(n,1);
x=zeros(n,1);
y=zeros(n,N);
k=1;
while k<=N
    for i=1:n
      sum=0;
        for j=1:n
            if j~=i  
               sum=sum+(a(i,j)*xo(j));
            else 
              continue;
            end
        end
        x(i,1)=((-sum+b(i))/a(i,i));
    end
    infN=norm(x-xo,inf)/norm(x,inf);
    if infN<tol
        disp(x);
    end
   
    k=k+1;
    for i=1:n
        xo(i)=x(i);
        y(i,k)=xo(i);
    end
end
if k>N
    disp('less N');
end
disp('sucessful')
end
