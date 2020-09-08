#import <Foundation/Foundation.h>

// Collection을 열거하는 방법.
// 1. for
int main() {
  NSArray* arr = @[ @10, @20, @30 ];
  for (int i = 0 ; i < arr.count ; ++i) {
    NSLog(@"%@", arr[i]);
  }
  
  NSDictionary* dic = @{
    @"name": @"Tom",
    @"age": @42
  };
  NSArray* keys = [dic allKeys];
  for (int i = 0 ; i < keys.count; ++i) {
    id key = keys[i];
    NSLog(@"%@ -> %@", key, dic[key]);
  }
}
