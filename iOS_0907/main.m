#import <Foundation/Foundation.h>

// Collection을 열거하는 방법.
// 1. for
// 2. NSEnumerator(= Iterator)
int main() {
  NSArray* arr = @[ @10, @20, @30 ];
  
#if 0
  for (int i = 0 ; i < arr.count ; ++i) {
    NSLog(@"%@", arr[i]);
  }
#endif
  
  NSEnumerator* enumerator = [arr objectEnumerator];
  id object;
  while ((object = [enumerator nextObject]) != nil) {
    NSLog(@"%@", object);
  }
  
  NSDictionary* dic = @{
    @"name": @"Tom",
    @"age": @42
  };
  
  enumerator = [dic keyEnumerator];
  while ((object = [enumerator nextObject]) != nil) {
    NSLog(@"%@ -> %@", object, dic[object]);
  }
  
#if 0
  NSArray* keys = [dic allKeys];
  for (int i = 0 ; i < keys.count; ++i) {
    id key = keys[i];
    NSLog(@"%@ -> %@", key, dic[key]);
  }
#endif
}
