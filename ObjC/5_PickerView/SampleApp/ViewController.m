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
  
  _pickerView.delegate = self;
  _pickerView.dataSource = self;
}

#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return _animals.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  return _animals[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  
  _nameLabel.text = _animals[row];
}

@end
