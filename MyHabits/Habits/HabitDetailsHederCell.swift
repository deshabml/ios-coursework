//
//  HabitDetailsHederCell.swift
//  MyHabits
//
//  Created by Лаборатория on 13.01.2023.
//

import UIKit

class HabitDetailsHederCell: UITableViewHeaderFooterView {
    
    static let id = "HabitDetailsHederCell"
    
    private lazy var labelText: UILabel = {
        let labelText = UILabel()
        labelText.text = "Активность"
        labelText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        labelText.textColor = UIColor(
            red: 60/255,
            green: 60/255,
            blue: 67/255,
            alpha: 0.6)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        return labelText
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(labelText)
        installingСonstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HabitDetailsHederCell {
    
    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
}
