//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 27.12.2022.
//

import UIKit

class HabitsViewController: UIViewController {

    private lazy var addingButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
//        configuration.title = "Log In"
//        configuration.baseForegroundColor = .red
        configuration.baseBackgroundColor = .white
        let imagePlus = UIImageView(image: UIImage(systemName: "plus")!.withRenderingMode(.alwaysTemplate))
        imagePlus.tintColor = .red

        configuration.background.customView = UIImageView(image: UIImage(systemName: "plus"))
//        UIImage(systemName: "plus").UIColor.red
        configuration.baseForegroundColor = .red
        let addingButton = UIButton(configuration: configuration, primaryAction: nil)
//        let imagePlus = UIImage(systemName: "plus")
//        imagePlus?.configuration.colo
//        imagePlus?.withTintColor(UIColor(
//            red: 161/255,
//            green: 22/255,
//            blue: 204/255,
//            alpha: 1.0))
//        addingButton.setBackgroundImage(imagePlus.red, for: .normal)
        addingButton.translatesAutoresizingMaskIntoConstraints = false
        return addingButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(addingButton)
        installingСonstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

}

extension HabitsViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            addingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            addingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addingButton.widthAnchor.constraint(equalToConstant: 23),
            addingButton.heightAnchor.constraint(equalToConstant: 23)
        ])
    }


}
