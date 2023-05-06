//
//  Toast.swift
//  ChatAI
//
//  Created by Jordyn Fulbright on 4/27/23.
//

import UIKit

class Toast {

    static func show(message: String, view: UIView) {
        let toastLabel = UILabel()
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.clipsToBounds = true
        toastLabel.layer.cornerRadius = 10
        view.addSubview(toastLabel)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: toastLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -30)
        let widthConstraint = NSLayoutConstraint(item: toastLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint])
        
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
