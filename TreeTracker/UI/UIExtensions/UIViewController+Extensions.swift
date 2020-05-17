//
//  UIViewController+Extensions.swift
//  TreeTracker
//
//  Created by Alex Cornforth on 15/05/2020.
//  Copyright © 2020 Greenstand. All rights reserved.
//

import UIKit

protocol TextEditingViewController { }

extension TextEditingViewController where Self: UIViewController {

    func addEndEditingBackgroundTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(endEditingBackgroundTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
}

private extension UIViewController {

    @objc func endEditingBackgroundTapped() {
        view.endEditing(true)
    }
}
