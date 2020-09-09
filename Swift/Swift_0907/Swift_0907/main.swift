import Foundation

// protocol TableViewDelegate: AnyObject {
@objc protocol TableViewDelegate {
  @objc func tableView(_ tableView: TableView, willSelectRowAt: Int)
  @objc func tableView(_ tableView: TableView, didSelectRowAt: Int)

  @objc optional func tableView(_ tableView: TableView, willDeselectRowAt: Int)
  @objc optional func tableView(_ tableView: TableView, didDeselectRowAt: Int)
}

class TableView: NSObject {
  // @property(weak, nonatomic) id<TableViewDelegate> delegate;
  weak var delegate: TableViewDelegate?
  // 'weak' must not be applied to non-class-bound

  func select(at: Int) {
    delegate?.tableView(self, willSelectRowAt: at)
    print("select - \(at)")
    delegate?.tableView(self, didSelectRowAt: at)
  }

  func deselect(at: Int) {
    delegate?.tableView?(self, willDeselectRowAt: at)
    print("select - \(at)")
    delegate?.tableView?(self, didDeselectRowAt: at)
  }
}

// Non-class type 'ViewController' cannot conform to class protocol 'TableViewDelegate'
class ViewController: TableViewDelegate {
  func tableView(_ tableView: TableView, willSelectRowAt: Int) {
    print("ViewController - willSelectRowAt")
  }

  func tableView(_ tableView: TableView, didSelectRowAt: Int) {
    print("ViewController - didSelectRowAt")
  }

  func tableView(_ tableView: TableView, willDeselectRowAt: Int) {
    print("ViewController - willDeselectRowAt")
  }

  func tableView(_ tableView: TableView, didDeselectRowAt: Int) {
    print("ViewController - didDeselectRowAt")
  }
}

let tableView = TableView()
let viewController = ViewController()

tableView.delegate = viewController

tableView.select(at: 0)
tableView.deselect(at: 0)



#if false
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

// Xcode가 Swift Formatting을 제대로 지원해주고 있지 않습니다.
//  => SwiftFormat

// Homebrew(brew.sh)
//  : macOS Package Manager
#endif
