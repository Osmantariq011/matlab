function d= Lagrange(x,f,xp)
n=length(x)-1;
sum=0;
for i=1:n+1
    p=1;
    for j=1:n+1
        if i~=j
            p=p*((xp-x(j))/(x(i)-x(j)));
        end
    end
     sum=sum+(p*f(i));
end
disp(sum)
d=sum;
end
