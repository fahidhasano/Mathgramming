#include<stdio.h>
int main()
{
    int a,b,k,i,gcd;
    printf("Welcome to GCD calculator!!!");
    printf("\n Input two numbers:");
    scanf("%d %d",&a,&b);
    if (a<b)
    {
        k=a;

    }
    else
    {
        k=b;
    }
    for (i=1; i<=k; i=i+1)
    {
        if ((a%i==0)&&(b%i==0))
        gcd=i;

    }
    printf("GCD of %d and %d is: %d",a,b,gcd);
}
