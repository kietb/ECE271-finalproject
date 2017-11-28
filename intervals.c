#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main( ) {

for(int i=0; i<525;i++) {
  double x = 127.5*sin(2*3.1415926/525*i)+127;
  printf("%d: wave <=%3.0f;\n",i,x);
  }
  return 0;
}
