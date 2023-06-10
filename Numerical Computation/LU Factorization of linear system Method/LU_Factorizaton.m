function x=LU_Factorizaton (a,b,n)
global l u
l=zeros(n);
u=eye(n);
l(1,1)=a(1,1)/u(1,1);
if l(1,1)*u(1,1)==0
    disp('Factorization impossible');
    return
end
for j=2:n
    u(1,j)=a(1,j)/l(1,1);
    l(j,1)=a(j,1)/u(1,1);
end
for i=2:n-1
    sum=0;
    for k=1:i-1
        sum= sum + l(i,k)*u(k,i);
    end
    l(i,i)=(a(i,i)-sum)/u(i,i);
    if l(i,i)*u(i,i)==0;
        disp('Factorization impossible')
        break;
    end
    for j=i+1:n
        sum_1=0;
        sum_2=0;
        for k=1:i-1
            sum_1=sum_1+l(i,k)*u(k,j);
            sum_2=sum_2+l(j,k)*u(k,i);
        end
        u(i,j)=(a(i,j)-sum_1)/l(i,i);
        l(j,i)=(a(j,i)-sum_2)/u(i,i);
        end
    end
    sum_3=0;
    for k =1:n-1
        sum_3=sum_3+l(n,k)*u(k,n);
    end
    l(n,n)=(a(n,n)-sum_3)/u(n,n);
    if l(n,n)*u(n,n)==0
        disp('A is singular');
    end
    l;
    u;
    A=l*u;
    a==A
    y(1)=b(1)/l(1,1);
    for i= 2:n
        sum_4=0;
        for j=1:i-1
            sum_4=sum_4+l(i,j)*y(j);
        end
        y(i)=(b(i)-sum_4)/l(i,i);
    end
    x(n)=y(n)/u(n,n);
    for i=n-1:-1:1
        sum_5=0;
        for j=i+1:n
            sum_5=sum_5+u(i,j)*x(j);
        end
        x(i)=(y(i)-sum_5)/u(i,i);
    end
    disp('solve');
    x;
    x_1=linsolve(a,b)
end
