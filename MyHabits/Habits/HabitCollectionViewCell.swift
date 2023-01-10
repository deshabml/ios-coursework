//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Лаборатория on 10.01.2023.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {

    static let id = "HabitCollectionViewCell"

    lazy var textLabelName: String = ""


    private lazy var labelName: UILabel = {
        let labelName = UILabel()
        labelName.textColor = UIColor(
            red: 41/255,
            green: 109/255,
            blue: 255/255,
            alpha: 1.0)
        labelName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        labelName.text = textLabelName
        return labelName
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        addSubviews([
            labelName
        ])
        installingСonstraints()
    }

}

extension HabitCollectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }

}
