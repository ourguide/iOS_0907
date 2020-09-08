#import <Foundation/Foundation.h>

// Collection / 리터럴 문법(2.0)
int main() {
  // 1. 문자열
  NSString* s = @"Hello, ObjC";
  NSLog(@"%@", s);
  
  // 2. 배열
  // NSArray* arr = [NSArray arrayWithObjects:@"A",
  //                  [NSNumber numberWithInt:10],
  //                  [NSNumber numberWithDouble:3.14],
  //                  nil];
  
  // NSArray* arr = [NSArray arrayWithObjects:@"A", @10, @3.14, nil];
  NSArray* arr = @[ @"A", @10, @3.14 ];
  NSLog(@"%@", arr);
  
  // 3. 사전
  // NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Tom", @"name", @42, @"age", nil];
  NSDictionary* dic = @{
    @"name": @"Tom",
    @"age" : @42
  };
  
  NSLog(@"%@", dic);
  
  // NSLog(@"%@", [dic objectForKey:@"name"]);
  NSLog(@"%@", dic[@"name"]);
}
