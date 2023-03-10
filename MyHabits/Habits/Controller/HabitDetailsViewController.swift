//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 12.01.2023.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var habit: Habit?

    var index: Int?

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
        navigationItem.leftBarButtonItem?.title = "Сегодня"
        navigationItem.leftBarButtonItem?.style = .done
        navigationItem.leftBarButtonItem?.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
    }

    @objc func editAction() {
        let hvc = HabitViewController()
        hvc.habit = habit
        hvc.index = index
        navigationController?.show(hvc, sender: .none)
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
        guard let habit = habit else { return cell }
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[HabitsStore.shared.dates.count - indexPath.item - 1]) {
            cell.imageStatus.image = UIImage(systemName: "checkmark")
        }
        return cell
    }

}
