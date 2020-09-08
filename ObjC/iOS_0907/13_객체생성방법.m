
#import <Foundation/Foundation.h>

// 1. ARC 원리 - 정적(컴파일러) 코드 분석
//  : 컴파일러가 컴파일 시간에 코드를 분석해서, 참조 계수 관련 코드를 삽입

// 2. 객체 생성 방법
//  1) alloc + initXXX: 컴파일러가 release를 삽입한다.
//  2) arrayXXX, stringXXX: 컴파일러가 autorelease를 삽입한다.
//                         => Auto Release Pool이 파괴되는 시점에 파괴되는 객체

// 3. ARC vs MRC
//  : ARC가 더 빠르게 동작합니다.
//  => MRC에서는 method를 통해 참조 계수를 조작합니다.
//     'ARC에서는 참조 계수를 조작하는 모든 코드가 C로 되어 있습니다.'

@interface Person : NSObject
@end
@implementation Person

// AutoReleasePool
- (Person*)personNamed:(NSString*)name {
  //                     initWithName: name];
  return [[Person alloc] init];
}

// Override
- (NSString *)description {
  return @"Person - Tom";
}

- (void)dealloc {
  printf("Person dealloc\n");
}

@end

void foo(Person* p1, Person* p2) {
  
}


int main() {
  @autoreleasepool {
    
    foo([[Person alloc] init], [Person personNamed:@"Tom"]);
    //  [[Person alloc] init]: foo 함수가 끝나는 시점에 파괴
    //  [Person personNamed:@"Tom"]: AutoReleasePool이 파괴되는 시점에 파괴
    
    // 문자열을 생성하는 3가지 방법
    NSString* s1 = @"Hello";     // Literal
    // NSString* s2 = [[NSString alloc] initWithString:@"Hello"];  // alloc + initXXX
    // NSString* s3 = [NSString stringWithString:@"Hello"];        // 편의 생성자 - @autoreleasepool
    NSLog(@"%@", s1);
    
    NSArray* arr1 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", nil];
    // [arr1 release];
    
    NSArray* arr2 = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
    // [arr2 autorelease];
    
    NSLog(@"%@", arr2);
    
    Person* person = [Person new];
    NSLog(@"%@", person);
    
  }
}
