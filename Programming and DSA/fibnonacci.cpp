#include <iostream>
using namespace std;
long long fibonacci(int n)
{
    if(n>1)
    {
        return fibonacci(n-2) +fibonacci(n-1) ;
    }


}

int main()
{
    cout<< fibonacci(50);
    return 0;
}
