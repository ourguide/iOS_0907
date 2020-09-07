// 셀렉터(Selector)
//  : 함수 포인터 / 메소드 참조

#import <Foundation/Foundation.h>

@interface Car : NSObject

- (void)go;
- (void)go:(int)a;
- (void)go:(int)a speed:(int)speed;

@end

@implementation Car

// go
- (void)go {
  printf("go\n");
  printf("%s\n", __func__);
}

// go:
- (void)go:(int)a {
  printf("go1\n");
  printf("%s\n", __func__);
}

// go:speed:
- (void)go:(int)a speed:(int)speed {
  printf("go2\n");
  printf("%s\n", __func__);
}

// go:speed:color:
- (void)go:(int)a speed:(int)speed color:(int)color {
  printf("%s\n", __func__);
}

@end

// ObjC에서는 Selector를 통해 메소드를 참조할 수 있다.
// => Selector를 통해 메소드를 호출할 수 있다.
int main() {
  Car* car = [Car new];
  
  // SEL: 메소드의 고유 번호
  SEL s1 = @selector(go);
  s1 = @selector(go:);
  // s1 = @selector(go:speed:color:);
  s1 = @selector(go:speed:);
  
  
  // - PerformSelector may cause a leak because its selector is unknown
  //  : ARC에서 문제가 발생할 수 있습니다.
  //  => Selector를 통해서 객체가 생성되지 않을 때만 사용해야 합니다.
  //  : SEL 변수에 담아서 호출할 경우, 컴파일 시간에 어떤 메소드가 호출될지 여부를 컴파일러는 알 수 없다.
  //    만약 메소드를 통해서 객체가 생성이 된다면, ARC는 적절한 참조 계수 관련 코드를 삽입하기 어렵다.

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  // 셀렉터를 통해 메소드를 호출할 수 있다.
  [car performSelector:s1
            withObject:[NSNumber numberWithInt:100]
            withObject:[NSNumber numberWithInt:200]];
#pragma clang diagnostic push
  
  // 셀렉터를 통해 메소드의 이름도 알 수 있습니다.
  printf("%s\n", sel_getName(s1));
  
  
//  [car go];
//  [car go:120];
//  [car go:120 speed:100];
//  [car go:120 speed:100 color:100];
  
}





// C언어에서 함수의 타입은 시그니처(인자, 반환타입)에 의해 결정된다.
// => 같은 시그니처를 가지는 함수는 동일한 타입이다.
/*
int add(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }
 
int main() {
  int (*fp1)(int a, int b) = &add;
  fp1 = &sub;
  
  printf("%d\n", fp1(10, 20));
}
*/




