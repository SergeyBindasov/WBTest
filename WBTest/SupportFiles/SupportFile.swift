//
//  SupportFile.swift
//  WBTest
//
//  Created by Sergey on 31.05.2022.
//

import Foundation
import UIKit

extension UIView {
    func addSubviewWithAutoLayout(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setHorizontalGradientColor(_ view: UIView) {
        let gradientLayer = CAGradientLayer()
        let colorOne =  UIColor(red: 203/255.0, green: 17/255.0, blue: 171/255.0, alpha: 1.0).cgColor
        let colorTwo = UIColor(red: 153/255.0, green: 0/255.0, blue: 153/255.0, alpha: 1.0).cgColor
        let colorThree = UIColor(red: 72/255.0, green: 17/255.0, blue: 115/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [colorOne, colorTwo, colorThree]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = 14
        view.layer.addSublayer(gradientLayer)
    }
    
    func applyShadow(_ view: UIView) {
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
    }
}
