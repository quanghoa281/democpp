#include <iostream>
#include <string>
#include "class.h"
using namespace std;


int main()
{
    arr a("123"), b("456");
    arr c = a + b;
    a.printArr();
    b.printArr();
    return 0;   
}
