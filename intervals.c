#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main( ) {
  for (int i =0; i<500; i++) {
    printf("real t%d;\n",i);
  
}
  for(int i=0; i<500;i++) {
  double x = 127.5*sin(2*3.1415926/500*i)+127;
  printf("assign t%d <= %3.0f;\n",i,x);
  }
  return 0;
}


