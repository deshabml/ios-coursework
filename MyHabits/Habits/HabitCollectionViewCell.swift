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

    lazy var textLabelTime: String = ""

    private lazy var labelName: UILabel = {
        let labelName = UILabel()
        labelName.textColor = UIColor(
            red: 41/255,
            green: 109/255,
            blue: 255/255,
            alpha: 1.0)
        labelName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        labelName.numberOfLines = 3
        labelName.text = textLabelName
        return labelName
    }()

    private lazy var labelTime: UILabel = {
        let labelTime = UILabel()
        labelTime.textColor = UIColor(
            red: 174/255,
            green: 174/255,
            blue: 178/255,
            alpha: 1.0)
        labelTime.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        labelTime.text = textLabelTime
        return labelTime
    }()

    lazy var imageStatus: UIImageView = {
        let imageStatus = UIImageView()
        imageStatus.layer.cornerRadius = 19
        imageStatus.backgroundColor = .white
        imageStatus.layer.borderWidth = 1
        imageStatus.layer.borderColor = UIColor(
            red: 41/255,
            green: 109/255,
            blue: 255/255,
            alpha: 1.0).cgColor
//        imageStatus.isUserInteractionEnabled = true
//        imageStatus.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(colorSetAction)))
        return imageStatus
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        addSubviews([
            labelName,
            labelTime,
            imageStatus
        ])
        installingСonstraints()
    }

}

extension HabitCollectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelName.widthAnchor.constraint(equalToConstant: 220),
            labelTime.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageStatus.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 65),
            imageStatus.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIScreen.main.bounds.width - 32 - 25),
            imageStatus.heightAnchor.constraint(equalToConstant: 38),
            imageStatus.widthAnchor.constraint(equalToConstant: 38)
        ])
    }

}
