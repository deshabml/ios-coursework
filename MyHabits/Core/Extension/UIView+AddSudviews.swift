//
//  AddSudviews.swift
//  MyHabits
//
//  Created by Лаборатория on 27.12.2022.
//
import UIKit

extension UIView {

    func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }

}
