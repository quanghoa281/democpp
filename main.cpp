#include <iostream>
#include <string>
#include "class.h"
using namespace std;


int main()
{
    arr a("123"), b("456");
    arr c = a + b;
    c.printArr();
    a.printArr();
    return 0;   
}