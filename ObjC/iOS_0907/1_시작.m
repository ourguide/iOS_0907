
// 1. 확장자
//    .m   : ObjC + C
//    .mm  : ObjC + C++

// 2. 헤더파일
#import <Foundation/Foundation.h>
//    C: #include
// ObjC: #import (#include + include guard)
 
// Command + B: Build(Compile)
// Command + R: Build(Compile) + Run
// https://github.com/ourguide/iOS_0907

// 3. ObjC 의 모든 클래스에는 NS라는 접두가 있습니다.
//  NS: NextStep
//  => ObjC 언어는 패키지 또는 네임스페이스같은 심볼 충돌을 막기 위한 언어적 기능이 존재하지 않습니다.

int main() {
  // C의 문자열
  const char* s1 = "Hello, C";
  printf("%s\n", s1);
 
  // ObjC의 문자열 - NSString*
  //  - ObjC의 모든 객체는 '힙'에 생성됩니다.
  NSString* s2 = @"Hello, ObjC";
  NSLog(@"%@", s2);
  
}
