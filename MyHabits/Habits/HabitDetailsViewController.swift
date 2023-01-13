//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 12.01.2023.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var habit: Habit?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0.5
        tableView.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 247/255,
            alpha: 1.0)
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.id)
        tableView.register(HabitDetailsHederCell.self, forHeaderFooterViewReuseIdentifier: HabitDetailsHederCell.id)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBarSetting()
        view.addSubview(tableView)
        installingСonstraints()
    }

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ru-RU")
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}

extension HabitDetailsViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func navigationBarSetting() {
        let novigationBarColor = UINavigationBarAppearance()
        title = habit?.name
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.scrollEdgeAppearance = novigationBarColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        navigationItem.leftBarButtonItem?.title = "Cегодня"
        navigationItem.leftBarButtonItem?.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
    }

    @objc func editAction() {

    }

    @objc func buttenBackAction() {
        dismiss(animated: true)
    }

}

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HabitDetailsHederCell.id)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        46
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.id, for: indexPath) as! DateTableViewCell
        cell.dateLabel.text = dateFormatter.string(from: HabitsStore.shared.dates[HabitsStore.shared.dates.count - indexPath.item - 1])
        return cell
    }

}
