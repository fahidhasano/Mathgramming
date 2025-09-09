#include<iostream>
using namespace std;
int main()
{
    int n,t;
    cout<<"Enter the length:\n";
    cin>>  n;
    int a[n];
    cout<<"Enter the elements of the array:\n";
    for (int i=1; i<=n;i++)
    {
        cin>>a[i];
    }
    for (int i=1;i<=n-1;i++)
    {
        for(int j=1;j<=n-i;j++)
        {
            if (a[j]>a[j+1])
            {
               t=a[j];
               a[j]=a[j+1];
               a[j+1]=t;

            }
        }
    }

    for (int i=1; i<=n;i++)
    {
        cout<< a[i]<<"\n";
    }

    return 0;
}
