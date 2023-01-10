//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 27.12.2022.
//

import UIKit

class HabitsViewController: UIViewController {

    private var dataSource = HabitsStore.shared.habits

    private lazy var addingButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .white
        let imagePlus = UIImageView(image: UIImage(systemName: "plus"))
        imagePlus.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        configuration.background.customView = imagePlus
        let addingButton = UIButton(configuration: configuration, primaryAction: nil)
        addingButton.addTarget(self, action: #selector(buttonPlusAction), for: .touchUpInside)
        return addingButton
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 12
//        layout.accessibilityPath?.addArc(withCenter: 1, radius: 10, startAngle: 1, endAngle: 1, clockwise: 1)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 247/255,
            alpha: 1.0)
        return collectionView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.id)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.id)
        view.addSubviews([
            addingButton,
            collectionView
        ])
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
            addingButton.heightAnchor.constraint(equalToConstant: 23),
            collectionView.topAnchor.constraint(equalTo: addingButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func buttonPlusAction() {
        let store = HabitsStore.shared
        print(store.habits)
        let nc = UINavigationController(rootViewController: HabitViewController())
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true)
    }

}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return dataSource.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.id, for: indexPath) as! ProgressCollectionViewCell
            cell.layer.cornerRadius = 8
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.id, for: indexPath) as! HabitCollectionViewCell
            cell.textLabelName = dataSource[indexPath.item].name
            cell.textLabelTime = dataSource[indexPath.item].dateString
            cell.layer.cornerRadius = 8
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: (UIScreen.main.bounds.width - 32),height: 60)
        } else {
            return CGSize(width: (UIScreen.main.bounds.width - 32),height: 130)
        }
    }


}
