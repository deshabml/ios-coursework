////
////  HabitCollectionViewCell.swift
////  MyHabits
////
////  Created by Лаборатория on 10.01.2023.
////
//
import UIKit

class HabitCollectionViewCell: UICollectionViewCell {

    static let id = "HabitCollectionViewCell"

    private var habit: Habit!
    private var onImageStatusAction: (() -> Void)!

    private lazy var labelName: UILabel = {
        let labelName = UILabel()
        labelName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        labelName.numberOfLines = 3
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
        return labelTime
    }()

    lazy var imageStatus: UIImageView = {
        var imageStatus = UIImageView()
        imageStatus.isUserInteractionEnabled = true
        imageStatus.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageStatusAction)))
        return imageStatus
    }()

    private lazy var labelСounter: UILabel = {
        let labelСounter = UILabel()
        labelСounter.textColor = UIColor(
            red: 142/255,
            green: 142/255,
            blue: 147/255,
            alpha: 1.0)
        labelСounter.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return labelСounter
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        addSubviews([
            labelName,
            labelTime,
            imageStatus,
            labelСounter
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
            imageStatus.widthAnchor.constraint(equalToConstant: 38),
            labelСounter.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            labelСounter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }

    func setupCell(_ habit: Habit, onImageStatusAction: @escaping () -> Void) {
        self.habit = habit
        self.onImageStatusAction = onImageStatusAction
        labelTime.text = habit.dateString
        labelName.text = habit.name
        labelName.textColor = habit.color
        labelСounter.text = "Счетчик: \(habit.trackDates.count)"
        if habit.isAlreadyTakenToday {
            imageStatus.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            imageStatus.image = UIImage(systemName: "circle")
        }
        imageStatus.tintColor = habit.color
    }
    
    @objc func imageStatusAction() {
        guard !habit.isAlreadyTakenToday else {return}
        imageStatus.image = UIImage(systemName: "checkmark.circle.fill")
        HabitsStore.shared.track(habit)
        onImageStatusAction()
    }

}
