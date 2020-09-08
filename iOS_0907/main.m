#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;

- (instancetype)initWithName:(NSString*)name age:(int)age;

@end

@interface Company : NSObject
@property(strong, nonatomic) Person* person;

- (instancetype)initWithPerson:(Person*)person;
@end

@implementation Person

- (NSString *)description {
  return [@{
    @"name": _name,
    @"age": [NSNumber numberWithInt:_age]
  } description];
}

- (instancetype)initWithName:(NSString*)name age:(int)age {
  self = [super init];
  if (self) {
    _name = name;
    _age = age;
  }
  return self;
}

@end

@implementation Company
- (instancetype)initWithPerson:(Person*)person {
  self = [super init];
  if (self) {
    _person = person;
  }
  return self;
}

- (NSString *)description {
  return [@{
    @"person": _person
  } description];
}

@end


int main() {
  Person *person = [[Person alloc] initWithName:@"Tom" age:42];
  NSLog(@"%@", person);
  
  Company *company = [[Company alloc] initWithPerson:person];
  NSLog(@"%@", company);
}
