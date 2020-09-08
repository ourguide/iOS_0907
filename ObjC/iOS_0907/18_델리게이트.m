#import <Foundation/Foundation.h>

// Cocoa Design Pattern
// 1. Target-Action Pattern
//    : 이벤트 핸들러를 정의한다.

// 2. Delegate Pattern
//    : 다른 객체의 변화에 대응하거나, 다른 객체에 행동에 변화를 줄 수 있는 패턴
//    - interface

 
// Obj-C Protocol(Interface)
@protocol CLLocationManagerDelegate<NSObject>
@required
- (void)updateLocation;
@optional
- (void)failToLocation;
@end

@interface CLLocationManager : NSObject

// strong(강한 참조)를 사용하면, delegate 객체가 더 이상 사용되지 않음에도 불구하고, 파괴되지 않는다.
// => 약한 참조를 사용해야 합니다.
@property(weak, nonatomic) id<CLLocationManagerDelegate> delegate;

@end

@interface Car : NSObject<CLLocationManagerDelegate>
@end

@implementation CLLocationManager
- (void)startUpdateLocation {
  // 위치가 업데이트 되었다.
  [_delegate updateLocation];
  
  // 위치 업데이트에 실패하였다.
  // id obj = _delegate;
  if ([_delegate respondsToSelector:@selector(failToLocation)]) {
    [_delegate failToLocation];
  }
}
@end

@implementation Car
//- (void)failToLocation {
//  printf("fail to location\n");
//}

- (void)updateLocation {
  printf("update location\n");
}

@end

int main() {
  Car* car = [Car new];
  CLLocationManager* locationManager = [CLLocationManager new];
  
  locationManager.delegate = car;
  
  [locationManager startUpdateLocation];
}
