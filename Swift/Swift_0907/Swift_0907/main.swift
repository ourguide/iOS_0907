import Foundation

// Cocoa Design Pattern - Event를 처리하는 기술
// 1. Target-Action
// 2. Delegate
// 3. Closure

// Obj C       Swift
//  id     ->    Any, AnyObject(ObjectC) - performSelector
//  SEL    ->    Selector

// Swift -> ObjC
// ObjC  -> Swift
class Button {
  var target: AnyObject?
  var action: Selector?
  
  func add(target: AnyObject, action: Selector) {
    self.target = target
    self.action = action
  }
  
  func click() {
    _ = target?.perform(action, with: self)
  }
}

class Dialog {
  // @objc - Objective C의 메소드
  @objc func close() {
    print("Dialog close")
  }
}

let button = Button()
let dialog = Dialog()

// selector - ObjC method
button.add(target: dialog, action: #selector(Dialog.close))
button.click()
