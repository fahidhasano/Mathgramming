#include<stdio.h>
int main()

{
    int a,b,c,l;
    char sts[100] ;


    scanf("%d",&a);
    scanf("%d %d",&b,&c);
    scanf("%s",&sts);


    l=a+b+c;
    printf("%d %s ",l,sts);
    return 0;
}
