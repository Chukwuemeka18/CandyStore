#include <stdio.h>
#include <stdlib.h>
#include <string.h>




int Candy(int price, int money);
int Candy2(int money);


int x = 0, y = 0, z = 0;
int sum = 0;


void main(int argc, char **argv) {
    
       printf("Welcome to BobCat Candy, home to the famous BobCat Bars!\n");
     
       printf("Please enter the price of a BobCat Bar: \n");
       //int x;
       scanf("%i", &x);
       

       printf("Please enter the number of wrappers needed to exchange for a new bar: \n");
       //int y;
       scanf("%i", &y);
       

       printf("How, how much money do you have: \n");
       //int z;
       scanf("%i", &z);
       
       
       printf("Good! Let me run the number ...\n");
       int a = Candy(x,z);
       Candy2(a);


       printf("With $%i, you will receive a maximum of %i BobCat Bars!\n", z, sum);
       
       
}




int Candy(int price, int money){

          int profit = money / price;
          printf("You first buy %i bars.\n", profit);

          return profit;


}





int Candy2(int money){
//even when it shows int the computer knows its decimal
//breaks when coding it helps
//Use C or other source code as the blue print for MIPS
          
          
          sum = sum + money;
          //printf("You have %i bars\n", money);
         
          if (money < 1){
              return 1;
          }else if (money == 1){
              printf("You have %i bars\n", money);
              return 1;
          }else {
              printf("You have %i bars\n", money);
              return Candy2(money/y);
          }

}









