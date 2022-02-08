#include <stdio.h>
#include <math.h>

int main(){
  double a = exp(1.0)-1;
  for (int i = 1; i <= 25; i++)
    a = i * a - 1;
  printf("%e\n", a);  
  return 0;
}  
 