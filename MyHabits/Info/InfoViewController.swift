//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 27.12.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(
            red: 247/255,
            green: 247/255,
            blue: 247/255,
            alpha: 0.8)
        title = "Информация"
    }

}
