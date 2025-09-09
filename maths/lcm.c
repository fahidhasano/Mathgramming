#include<stdio.h>
int main()
{
    int a,b,i,k;
    printf("Enter 2 numbers:");
    scanf("%d %d",&a,&b);
    if (a>b)
        i=a;
    else
        i=b;

    while (1)
    {

        if ((i%a==0)&&(i%b==0))

        break;
        i=i+1;

    }
    printf("The lcm is %d",i);
}
