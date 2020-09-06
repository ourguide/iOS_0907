
// 1. 확장자
//    .m   : ObjC + C
//    .mm  : ObjC + C++

// 2. 헤더파일
#import <Foundation/Foundation.h>
//    C: #include
// ObjC: #import (#include + include guard)
 
// Command + B: Build(Compile)
// Command + R: Build(Compile) + Run

int main() {
  // C의 문자열
  const char* s1 = "Hello, C";
  printf("%s\n", s1);
 
  // ObjC의 문자열 - NSString*
  //  - ObjC의 모든 객체는 '힙'에 생성됩니다.
  NSString* s2 = @"Hello, ObjC";
  NSLog(@"%@", s2);
  
}
