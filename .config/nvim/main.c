#include <stdio.h>

int sum(int a, int b) { return a + b; }

int main() {
  int a = 2;
  int b = 3;
  int s = sum(a, b);
  printf("hello world\n");
  printf("The sum is: %d", s);
}
