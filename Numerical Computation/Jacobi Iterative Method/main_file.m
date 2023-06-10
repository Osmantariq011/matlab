clc
clear all
close all
a=input('enter the a matrix=');
b=input('enter the b veotor=');
N=input('enter the N number=');
tol=input('enter the tol=');
[T] = Jacobi(a,b,N,tol)
