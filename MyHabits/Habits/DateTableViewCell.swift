//
//  DateTableViewCell.swift
//  MyHabits
//
//  Created by Лаборатория on 13.01.2023.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    static let id = "DateTableViewCell"

    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        dateLabel.textColor = .black
        return dateLabel
    }()

    lazy var imageStatus: UIImageView = {
        var imageStatus = UIImageView()
        imageStatus.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        return imageStatus
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubviews([
            dateLabel,
            imageStatus
        ])
        installingСonstraints()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension DateTableViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 11),
            imageStatus.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            imageStatus.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 270)
        ])
    }
    
}
