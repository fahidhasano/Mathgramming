#include<iostream>
using namespace std;
int main()
{
    int a,b,c;
    cout<< "Enter 3 numbers:\n";
    cin>>a;cin>>b;cin>>c;
    if (a>b)
    {
        if (a>c)
        {
            cout<<"Largest number is:"<<a;
        } else
        {
            cout<<"Largest number is:"<<c;
        }
    }else if(b>c)
    {
        cout<<"Largest number is:"<<b;
    } else if(c>a)
    {
        cout<<"Largest number is:"<<c;
    }
return 0;
}
