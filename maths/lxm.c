#include <stdio.h>
int main()
{
    int a,b,k,i,lcm;
    printf("Enter two numbers:");
    scanf("%d %d",&a,&b);
    if (a>b)
    {
        k=a;
    }
    else
    {
        k=b;
    }
    i=k;
    while(1)
    {
        if ((i%a==0)&&(i%b==0))
        {
            break;
        }
        i=i+1;
    }
    lcm=i;

   printf("%d",lcm) ;
}
