//
//  UIViewController+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/15.
//

import UIKit

extension UIViewController {
    
    /// 화면 터치시 작성 종료하는 메서드
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /// 화면 터치시 키보드 내리는 메서드
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        self.view.endEditing(true)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// 키보드 터치 시 텍스트필드 위로 올라가도록 하는 메서드
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        let intersection = keyboardFrame.intersection(view.frame)
        
        if intersection.height > 0 {
            if let textField = findFirstResponder() as? UITextField, let textFieldSuperview = textField.superview {
                let textFieldBottom = textFieldSuperview.convert(textField.frame, to: view).maxY
                let keyboardOverlap = keyboardHeight - (view.bounds.height - textFieldBottom)
                if keyboardOverlap > 0 && self.view.frame.origin.y == -304.0 {
                    print(self.view.frame.origin.y)
                    return
                }
            }
            UIView.animate(withDuration: 1) {
                self.view.frame.origin.y -= keyboardHeight - 32
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        print(self.view.frame.origin.y)
        UIView.animate(withDuration: 1) {
            self.view.frame.origin.y = 0
        }
    }
    
    func findFirstResponder() -> UIView? {
        return view.findFirstResponder()
    }
}
