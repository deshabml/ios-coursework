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
        return labelPercent
    }()

    private lazy var progress: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        return progress
    }()

    private lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 8
        backView.addSubviews([
            labelMotivation,
            progress,
            labelPercent
        ])
        return backView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews([
            backView
        ])
        installingСonstraints()
    }

    func setupHeader(_ store: HabitsStore) {
        labelPercent.text = "\(Int(store.todayProgress * 100))%"
        progress.setProgress(store.todayProgress, animated: true)
    }

}

extension ProgressCollectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backView.heightAnchor.constraint(equalToConstant: 60),
            labelMotivation.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            labelMotivation.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            progress.topAnchor.constraint(equalTo: labelMotivation.bottomAnchor, constant: 10),
            progress.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            progress.heightAnchor.constraint(equalToConstant: 7),
            progress.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32 - 24),
            labelPercent.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            labelPercent.trailingAnchor.constraint(equalTo: backView.leadingAnchor, constant: UIScreen.main.bounds.width - 32 - 24)
        ])
    }
    
}
