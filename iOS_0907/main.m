#import <Foundation/Foundation.h>

// Cocoa Design Pattern
// 1. Target Action
// 2. Delegate
//------------------------
// 3. Functional - Block Programming

// 블록(Block) 프로그래밍
// 1. ObjC의 문법이 아닙니다.
//   => Apple에서 확장한 'C 문법'입니다.

void swap(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

void sort(int *x, int n) {
  for (int i = 0 ; i < n - 1; ++i) {
    for (int j = i + 1; j < n ; ++j) {
      if (x[i] > x[j])
        swap(&x[i], &x[j]);
    }
  }
}

int main() {
  int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
  sort(x, 10);
  
  for (int i = 0 ; i < 10 ; ++i) {
    printf("%d\n", x[i]);
  }
}
