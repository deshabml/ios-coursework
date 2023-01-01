//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 01.01.2023.
//

import UIKit

class HabitViewController: UIViewController {

    private lazy var labelName: UILabel = {
        let labelName = UILabel()
        labelName.text = "НАЗВАНИЕ"
        labelName.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        labelName.tintColor = .black
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([
            labelName
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
            labelName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21)
        ])
    }

    @objc func buttonAction() {
        print("ap op")
    }

    @objc func buttenBackAction() {
        dismiss(animated: true)
    }

    private func navigationBarSetting() {
        title = "Cоздать"
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
