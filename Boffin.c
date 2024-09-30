#include<stdio.h>
int main()
{
    int a,b,k,i,gcd;
    printf("Let's try to make a gcd calculator!!!");
    printf("\n enter two numbers:");
    scanf("%d %d",&a,&b);
    if (a>b)
    {
        k=b;
    }

    else
        {
            k=a;
        }


    for (i=1;i<=k;i=i+1)
    {
        if ((a%i==0) && (b%i==0))
            {
                gcd=i;
            }
    }

    printf("The gcd is: %d ",gcd);

}


