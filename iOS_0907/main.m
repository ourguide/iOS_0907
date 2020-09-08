#import <Foundation/Foundation.h>

// Collection을 열거하는 방법.
// 1. for
// 2. NSEnumerator(= Iterator) - '이론'
// 3. Fast Enumerator
// 4. Block Programming
int main() {
  NSArray* arr = @[ @10, @20, @30 ];
  
  // Swift
  //  - Null을 안전하게 다루기위한 Optional 라는 개념이 있습니다.
  // : _Nonnull, _Nullable
  
  [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
      NSLog(@"%lu - %@", idx, obj);
  }];
  
#if 0
  for (id object in arr) {
    NSLog(@"%@", object);
  }
  
  for (int i = 0 ; i < arr.count ; ++i) {
    NSLog(@"%@", arr[i]);
  }
  
  NSEnumerator* enumerator = [arr objectEnumerator];
  id object;
  while ((object = [enumerator nextObject]) != nil) {
    NSLog(@"%@", object);
  }
#endif
  

  NSDictionary* dic = @{
    @"name": @"Tom",
    @"age": @42
  };

#if 0
  for (id object in dic) {
    NSLog(@"%@ -> %@", object, dic[object]);
  }
  
  enumerator = [dic keyEnumerator];
  while ((object = [enumerator nextObject]) != nil) {
    NSLog(@"%@ -> %@", object, dic[object]);
  }
  
  NSArray* keys = [dic allKeys];
  for (int i = 0 ; i < keys.count; ++i) {
    id key = keys[i];
    NSLog(@"%@ -> %@", key, dic[key]);
  }
#endif
}
