
#import <Foundation/Foundation.h>

@interface Node : NSObject
@property(strong) Node* next;
@end

@implementation Node
- (void)dealloc {
  printf("Node dealloc\n");
}
@end

void foo() {
  Node* p1 = [Node new];
  Node* p2 = [Node new];
}

int main() {
  foo();
}
