#import "ViewController.h"

@implementation ViewController

// Delegate Pattern
//  - Protocol

//  UIPickerView
//    - UIPickerViewDelegate
//    - UIPickerViewDataSource

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  _animals = @[ @"사자", @"코끼리", @"뱀", @"곰", @"늑대" ];
  _fruits = @[ @"사과", @"배", @"바나나" ];

  // 명시적으로 지정
  _pickerView.delegate = self;
  _pickerView.dataSource = self;
}

#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  if (component == 0)
    return 2;
  
  NSInteger selectedIndex = [_pickerView selectedRowInComponent:0];
  if (selectedIndex == 0)
    return _animals.count;
  
  return _fruits.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  if (component == 0) {
    if (row == 0)
      return @"동물";

    return @"과일";
  }
  
  NSInteger selectedIndex = [_pickerView selectedRowInComponent:0];
  if (selectedIndex == 0)
    return _animals[row];
  
  return _fruits[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
  
  if (component == 0)
    [_pickerView reloadComponent:1]; // !!
  
  NSInteger selectedIndex = [_pickerView selectedRowInComponent:0];
  NSInteger row2 = [_pickerView selectedRowInComponent:1];
  if (selectedIndex == 0)
    _nameLabel.text = _animals[row2];
  else
    _nameLabel.text = _fruits[row2];
}

@end
