//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 01.01.2023.
//

import UIKit

class HabitViewController: UIViewController {
    
    var habit: Habit?
    
    var index: Int?
    
    private lazy var labelName: UILabel = {
        let labelName = UILabel()
        labelName.text = "НАЗВАНИЕ"
        return labelSettings(labelName)
    }()
    
    private lazy var color: UIColor = {
        var color = UIColor()
        if let habit = habit {
            color = habit.color
        } else {
            color = .orange
        }
        return color
    }()
    
    private lazy var textFieldName: UITextField = {
        let textFieldName = UITextField()
        textFieldName.layer.borderWidth = 0
        textFieldName.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textFieldName.textColor = .black
        if let habit = habit {
            textFieldName.text = habit.name
        }
        textFieldName.tintColor = .black
        textFieldName.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return textFieldName
    }()
    
    private lazy var labelColor: UILabel = {
        let labelColor = UILabel()
        labelColor.text = "ЦВЕТ"
        return labelSettings(labelColor)
    }()
    
    lazy var imageViewColor: UIImageView = {
        let imageViewColor = UIImageView()
        imageViewColor.layer.cornerRadius = 15
        imageViewColor.backgroundColor = color
        imageViewColor.isUserInteractionEnabled = true
        imageViewColor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(colorSetAction)))
        return imageViewColor
    }()
    
    private lazy var labelTime: UILabel = {
        let labelTime = UILabel()
        labelTime.text = "ВРЕМЯ"
        return labelSettings(labelTime)
    }()
    
    private lazy var dataLabel: UILabel = {
        let dataLabel = UILabel()
        dataLabel.text = "Каждый день в "
        return dataLabel
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.textColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        timeLabel.text = dateFormatter.string(from: dataPicker.date)
        return timeLabel
    }()
    
    private lazy var dataPicker: UIDatePicker = {
        let dataPicker = UIDatePicker()
        dataPicker.datePickerMode = .time
        dataPicker.locale = .current
        if let habit = habit {
            dataPicker.date = habit.date
        } else {
            dataPicker.date = Date()
        }
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.addTarget(self, action: #selector(pickerAction), for: .allEvents)
        return dataPicker
    }()
    
    private lazy var deleteButton: UILabel = {
        let deleteButton = UILabel()
        deleteButton.text = "Удалить привычку"
        deleteButton.textColor = UIColor(
            red: 255/255,
            green: 59/255,
            blue: 48/255,
            alpha: 1.0)
        deleteButton.isUserInteractionEnabled = true
        deleteButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deleteButtonAction)))
        if let habit = habit {
            return deleteButton
        } else {
            deleteButton.isHidden = true
        }
        return deleteButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([
            labelName,
            textFieldName,
            labelColor,
            imageViewColor,
            labelTime,
            dataLabel,
            timeLabel,
            dataPicker,
            deleteButton
        ])
        installingСonstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarSetting()
    }
    
}

extension HabitViewController {
    
    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            labelName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 7),
            textFieldName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            textFieldName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 21),
            textFieldName.heightAnchor.constraint(equalToConstant: 22),
            labelColor.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 15),
            labelColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            imageViewColor.widthAnchor.constraint(equalToConstant: 30),
            imageViewColor.heightAnchor.constraint(equalTo: imageViewColor.widthAnchor),
            imageViewColor.topAnchor.constraint(equalTo: labelColor.bottomAnchor, constant: 7),
            imageViewColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            labelTime.topAnchor.constraint(equalTo: imageViewColor.bottomAnchor, constant: 15),
            labelTime.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            dataLabel.topAnchor.constraint(equalTo: labelTime.bottomAnchor, constant: 7),
            dataLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            timeLabel.topAnchor.constraint(equalTo: labelTime.bottomAnchor, constant: 7),
            timeLabel.leadingAnchor.constraint(equalTo: dataLabel.trailingAnchor),
            dataPicker.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 15),
            dataPicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            deleteButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func labelSettings(_ label: UILabel) -> UILabel {
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.tintColor = .black
        return label
    }
    
    @objc func pickerAction() {
        timeLabel.text = dateFormatter.string(from: dataPicker.date)
    }
    
    @objc func buttonAction() {
        guard let name = textFieldName.text else { return }
        guard name != "" else { return }
        if let _ = habit {
            guard let index = index else { return }
            HabitsStore.shared.habits[index] = Habit(name: textFieldName.text ?? "",
                                                     date: dataPicker.date,
                                                     color: imageViewColor.backgroundColor ?? color)
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            let newHabit = Habit(name: textFieldName.text ?? "",
                                 date: dataPicker.date,
                                 color: imageViewColor.backgroundColor ?? color)
            let store = HabitsStore.shared
            //        store.habits.removeFirst()
            store.habits.append(newHabit)
            dismiss(animated: true)
        }
    }
    
    @objc func buttenBackAction() {
        if let _ = habit {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @objc func colorSetAction() {
        let colorSet = UIColorPickerViewController()
        colorSet.selectedColor = imageViewColor.backgroundColor ?? color
        colorSet.delegate = self
        present(colorSet, animated: true)
    }
    
    @objc func deleteButtonAction() {
        let avc = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку \n \"" + (habit?.name ?? "Ваша привычка") + "\"?", preferredStyle: .alert)
        avc.addAction(UIAlertAction(title: "Отмена", style: .cancel){ _ in
            avc.dismiss(animated: true)
        })
        avc.addAction(UIAlertAction(title: "Удалить", style: .destructive){ _ in
            guard let index = self.index else { return }
            HabitsStore.shared.habits.remove(at: index)
            self.navigationController?.popToRootViewController(animated: true)
        })
        present(avc, animated: true)
    }
    
    private func navigationBarSetting() {
        if let _ = habit {
            title = "Править"
        } else {
            title = "Cоздать"
        }
        let novigationBarColor = UINavigationBarAppearance()
        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
        novigationBarColor.backgroundColor = UIColor(
            red: 249/255,
            green: 249/255,
            blue: 249/255,
            alpha: 0.94)
        navigationItem.scrollEdgeAppearance = novigationBarColor
        let buttenSave = UIBarButtonItem(title: "Cохранить", style: .done, target: self, action: #selector(buttonAction))
        let buttenBack = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(buttenBackAction))
        navigationItem.rightBarButtonItem = buttenSave
        navigationItem.leftBarButtonItem = buttenBack
        navigationItem.rightBarButtonItem?.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        navigationItem.leftBarButtonItem?.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
    }
    
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        imageViewColor.backgroundColor = color
    }
    
}



