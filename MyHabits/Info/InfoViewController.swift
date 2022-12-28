//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 27.12.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var labelHeading: UILabel = {
        let labelHeading = UILabel()
        labelHeading.text = info[0]
        labelHeading.font = UIFont.boldSystemFont(ofSize: 20)
        labelHeading.tintColor = .black
        labelHeading.translatesAutoresizingMaskIntoConstraints = false
        return labelHeading
    }()

//    private lazy var labelInfoOne: UILabel = {
//        labelInfoSettings(number: 1)
//    }()
//
//    private lazy var labelInfoTwo: UILabel = {
//        labelInfoSettings(number: 2)
//    }()
//
//    private lazy var labelInfoThree: UILabel = {
//        labelInfoSettings(number: 3)
//    }()
//
//    private lazy var labelInfoFour: UILabel = {
//        labelInfoSettings(number: 4)
//    }()
//
//    private lazy var labelInfoFive: UILabel = {
//        labelInfoSettings(number: 5)
//    }()
//
//    private lazy var labelInfoSix: UILabel = {
//        labelInfoSettings(number: 6)
//    }()

    private lazy var infoStack: UIStackView = {
        let stackTextField = UIStackView()
        stackTextField.axis = .vertical
        stackTextField.distribution = .fillProportionally
        stackTextField.spacing = 10
        stackTextField.translatesAutoresizingMaskIntoConstraints = false
        stackTextField.addArrangedSubview(labelInfoSettings(number: 1))
        stackTextField.addArrangedSubview(labelInfoSettings(number: 2))
        stackTextField.addArrangedSubview(labelInfoSettings(number: 3))
        stackTextField.addArrangedSubview(labelInfoSettings(number: 4))
        stackTextField.addArrangedSubview(labelInfoSettings(number: 5))
        stackTextField.addArrangedSubview(labelInfoSettings(number: 6))
        stackTextField.addArrangedSubview(labelInfoSettings(number: 7))
        return stackTextField
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleSetting()
        view.addSubview(scrollView)
        scrollView.addSubviews([
            labelHeading,
            infoStack
        ])
        installingСonstraints()
    }

}

extension InfoViewController {

    private func titleSetting() {
        navigationController?.navigationBar.backgroundColor = UIColor(
            red: 247/255,
            green: 247/255,
            blue: 247/255,
            alpha: 0.8)
        title = "Информация"
    }

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            labelHeading.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 22),
            labelHeading.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            infoStack.topAnchor.constraint(equalTo: labelHeading.bottomAnchor, constant: 16),
            infoStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

    private func labelInfoSettings(number: Int) -> UILabel {
        let labelInfo = UILabel()
        labelInfo.text = info[number]
        labelInfo.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        labelInfo.tintColor = .black
        labelInfo.numberOfLines = 0
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        return labelInfo
    }

    private var info: [String] {[
        "Привычка за 21 день",
        """
        Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:
        """,
        """
        1. Провести 1 день без обращения
        к старым привычкам, стараться вести себя так, как будто цель, загаданная
        в перспективу, находится на расстоянии шага.
        """,
        """
        2. Выдержать 2 дня в прежнем состоянии самоконтроля.
        """,
        """
        3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,
        с чем еще предстоит серьезно бороться.
        """,
        """
        4. Поздравить себя с прохождением первого серьезного порога в 21 день.
        За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.
        """,
        """
        5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.
        """,
        """
        6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.
        """
    ]}
}
