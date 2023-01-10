//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Лаборатория on 10.01.2023.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {

    static let id = "ProgressCollectionViewCell"

    private lazy var labelMotivation: UILabel = {
        let labelMotivation = UILabel()
        labelMotivation.textColor = UIColor(
            red: 142/255,
            green: 142/255,
            blue: 147/255,
            alpha: 1.0)
        labelMotivation.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        labelMotivation.numberOfLines = 1
        labelMotivation.text = "Всё получится!"
        return labelMotivation
    }()

    private lazy var labelPercent: UILabel = {
        let labelPercent = UILabel()
        labelPercent.textColor = UIColor(
            red: 142/255,
            green: 142/255,
            blue: 147/255,
            alpha: 1.0)
        labelPercent.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        labelPercent.numberOfLines = 1
        labelPercent.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        return labelPercent
    }()

    private lazy var progress: UIProgressView = {
        let progress = UIProgressView()
        progress.progress = HabitsStore.shared.todayProgress
        return progress
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        addSubviews([
            labelMotivation,
            progress,
            labelPercent
        ])
        installingСonstraints()
    }
    
}

extension ProgressCollectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            labelMotivation.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelMotivation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progress.topAnchor.constraint(equalTo: labelMotivation.bottomAnchor, constant: 10),
            progress.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progress.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32 - 24),
            labelPercent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelPercent.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIScreen.main.bounds.width - 32 - 24)
        ])
    }

}
