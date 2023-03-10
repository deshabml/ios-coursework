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

    private lazy var infoStack: UIStackView = {
        let stackTextField = UIStackView()
        stackTextField.axis = .vertical
        stackTextField.distribution = .fill
        stackTextField.spacing = 12
        stackTextField.translatesAutoresizingMaskIntoConstraints = false
        for i in 1..<info.count {
            stackTextField.addArrangedSubview(labelInfoSettings(number: i))
        }
        return stackTextField
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 247/255,
            green: 247/255,
            blue: 247/255,
            alpha: 1)
        title = "Информация"
        view.addSubview(scrollView)
        scrollView.addSubviews([
            labelHeading,
            infoStack
        ])
        installingСonstraints()
    }

}

extension InfoViewController {

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
            infoStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            infoStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
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
        """,
        "Источник: psychbook.ru"
    ]}
    
}
