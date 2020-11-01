#include <iostream>
#include <string>

class arr
{
    private: 
     std::string str;
     public:
     arr()
     {str="";};
     ~arr(){};
     arr(std::string str)
     {
        this->str = str;
     };
     void setArr(std::string str)
     {
         this->str = str;
     }
     std::string getArr()
     {
         return str;
     };
     void printArr()
     {
         std::cout<<str<<std::endl;
     }
     const arr operator+ (const arr &ar)
     {
         arr at;
         at.str = str + ar.str;
         return at;
     };
};