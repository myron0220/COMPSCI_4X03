#include <stdio.h>
int main() {
  int    i = 0, j = 0;
  float  f;
  double d;
  for (f = 0.5; f < 1.0; f += 0.1)  i++;
  for (d = 0.5; d < 1.0; d += 0.1)  j++;
  printf("float loop %d  double loop %d \n", i, j);
}