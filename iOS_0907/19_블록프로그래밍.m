#import <Foundation/Foundation.h>

// Cocoa Design Pattern
// 1. Target Action
// 2. Delegate
//------------------------
// 3. Functional - Block Programming
//   1) 함수를 일급 객체로 취급한다.
//     => 함수를 참조할 수 있다.
//     => 함수를 인자로 전달하거나, 함수를 반환할 수 있다. - 고차 함수
//   2) 익명 함수를 지원해야 한다.
//     => Lambda / Closure

// 블록(Block) 프로그래밍
// 1. ObjC의 문법이 아닙니다.
//   => Apple에서 확장한 'C 문법'입니다.

void swap(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

// sort의 정책(오름차순, 내림차순)은 사용자가 결정해야 한다.
// => 정책을 함수형 인자로 처리한다.
//             C: 함수 포인터
// iOS(ObjC + C): 블록 프로그래밍


void sort(int *x, int n, int (^cmp)(int a, int b)) {
  for (int i = 0 ; i < n - 1; ++i) {
    for (int j = i + 1; j < n ; ++j) {
      // if (x[i] > x[j])
      if (cmp(x[i], x[j]) > 0)
        swap(&x[i], &x[j]);
    }
  }
}

int cmp1(int a, int b) { return a - b; }
int cmp2(int a, int b) { return b - a; }

int main() {
  int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
  // sort(x, 10, cmp2);
  
  int n = 42;
  sort(x, 10, ^int(int a, int b) {
    printf("%d\n", n);
    // return a - b;
    return b - a;
  });
  
  for (int i = 0 ; i < 10 ; ++i) {
    printf("%d\n", x[i]);
  }
}


/*
void sort(int *x, int n) {
  for (int i = 0 ; i < n - 1; ++i) {
    for (int j = i + 1; j < n ; ++j) {
      if (x[i] > x[j])
        swap(&x[i], &x[j]);
    }
  }
}
*/

// 함수 포인터 버전입니다.
/*
void sort(int *x, int n, int (*cmp)(int a, int b)) {
  for (int i = 0 ; i < n - 1; ++i) {
    for (int j = i + 1; j < n ; ++j) {
      // if (x[i] > x[j])
      if (cmp(x[i], x[j]) > 0)
        swap(&x[i], &x[j]);
    }
  }
}

int cmp1(int a, int b) { return a - b; }
int cmp2(int a, int b) { return b - a; }

int main() {
  int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
  sort(x, 10, cmp2);
  
  for (int i = 0 ; i < 10 ; ++i) {
    printf("%d\n", x[i]);
  }
}
*/
