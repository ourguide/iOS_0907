#import <Foundation/Foundation.h>

// Obj C - NSString, NSArray, NSDictionary
//  => Immutable Object(불변 객체)
//   : 객체가 생성된 이후에 값이 변경되지 않는다.

//  => 불변 객체 장점
//   - 스레드 안전하다.
//   - 상태가 변경되지 않기 때문에, 부수효과로 인한 버그로부터 안전하다.
//   - 값이 변경되기 않게 때문에, 상태가 동일한 객체는 공유할 수 있다.

//  => 컬렉션의 경우 별도의 가변 클래스가 존재합니다.
//     NSMutableString / NSMutableArray / NSMutableDictionary

int main() {
  // 3. 사전
  NSMutableDictionary* dic = [@{ @"name": @"Tom", @"age" : @42 } mutableCopy];
  dic[@"name"] = @"Bob";
  //  NSLog(@"%@", dic);
  
  [dic removeObjectForKey:@"name"];
  NSLog(@"%@", dic);
  
  // 2. 배열
  // NSArray* arr1 = @[ @10, @20 ];
  // NSLog(@"%@", arr1[0]);
  // arr1[0] = @42;
  
  NSMutableArray* arr = [NSMutableArray arrayWithObjects:@10, @20, nil];
  arr[0] = @40;
  [arr addObject:@30];
  NSLog(@"%@", arr);
  
  // 1. 문자열
  
  
  
  // NSString* s1 = @"AAA";
  // NSMutableString* s2 = [@"AAA" mutableCopy];
  NSMutableString* s1 = [NSMutableString stringWithString: @"AAA"];
  
  NSRange range = NSMakeRange(1, 2);
  [s1 replaceCharactersInRange:range withString:@"BB"];
  NSLog(@"%@", s1);
}
