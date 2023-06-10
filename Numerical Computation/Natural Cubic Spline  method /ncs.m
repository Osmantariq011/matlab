function [b,c,d] = ncs(x,a)
n=length(x)-1;
h=zeros(1,n+1);
alpha=zeros(1,n+1);
c=zeros(1,n+1);
d=zeros(1,n+1);
for i=1:n       
    h(1,i)=x(i+1)-x(i);
end
for i=2:n        
    alpha(1,i)=((3/h(1,i))*(a(i+1)-a(i)))-((3/h(1,i-1))*(a(i)-a(i-1)));
end
l(1)=1;
mico(1)=0;
z(1)=0;
for i=2:n
    l(i)=2*(x(i+1)-x(i-1))-(h(1,i-1)*mico(i-1));
    mico(i)=h(1,i)/l(i);
    z(i)=(alpha(1,i)-(h(1,i-1)*z(i-1)))/l(i);
end
l(n+1)=1;
z(n+1)=0;
c(n+1)=0;
for j=n:-1:1
    c(j)=z(j)-(mico(j)*c(j+1));
    b(j)=((a(j+1)-a(j))/h(1,j))-(h(1,j)*(c(j+1)+2*c(j))/3);
    d(j)=(c(j+1)-c(j))/(3*h(1,j));
end
 
for j=1:n
    a(j);
    b(j);
    c(j);
    d(j);
end  
size=1:n+1;
b(1,21)=0;
T=table( size' ,  x' , a' , b' , c' , d' )
end
