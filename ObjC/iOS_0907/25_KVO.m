#import <Foundation/Foundation.h>

// KVO
// - Key-Value Observing
// : 특정 프로퍼티의 값이 실행 시간에 변경되는 것을 감지하는 기술

@interface Person : NSObject
@property(nonatomic, strong) NSString* name;
@end

@interface Label : NSObject
@end

@implementation Person
@end

@implementation Label
// 변화가 감지되었을 때 호출되는 메소드
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
  NSLog(@"%@ -> %@", change[NSKeyValueChangeOldKey], change[NSKeyValueChangeNewKey]);
}

@end

// Subject(Person) -> Observer(Label)

int main() {
  Person* person = [Person new];
  Label* label = [Label new];
  
  person.name = @"Tom";
  
  // observer 등록
  [person addObserver:label
           forKeyPath:@"name"
              options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew
              context:nil];
  
  person.name = @"Bob";
  
  // 이전 버전에서는 관찰자를 제거하지 않은 상태에서 프로그램 종료시 예외가 발생하였습니다.
  [person removeObserver:label forKeyPath:@"name"];
}
