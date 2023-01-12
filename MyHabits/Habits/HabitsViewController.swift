//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Лаборатория on 27.12.2022.
//

import UIKit

class HabitsViewController: UIViewController {

    private var habitsStore = HabitsStore.shared

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

    private lazy var labelDay: UILabel = {
        let labelDay = UILabel()
        labelDay.textColor = .black
        labelDay.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        labelDay.text = "Cегодня"
        return labelDay
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 247/255,
            alpha: 1.0)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.id)
        collectionView.register(ProgressCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProgressCollectionViewCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([
            addingButton,
            labelDay,
            collectionView
        ])
        installingСonstraints()
        let longClick = UILongPressGestureRecognizer(target: self, action: #selector(onLongClick))
        collectionView.addGestureRecognizer(longClick)
        collectionView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        collectionView.reloadData()
    }

}

extension HabitsViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            addingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            addingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addingButton.widthAnchor.constraint(equalToConstant: 23),
            addingButton.heightAnchor.constraint(equalToConstant: 23),
            labelDay.topAnchor.constraint(equalTo: addingButton.bottomAnchor, constant: 4),
            labelDay.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            collectionView.topAnchor.constraint(equalTo: labelDay.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func buttonPlusAction() {
        let nc = UINavigationController(rootViewController: HabitViewController())
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true)
    }

    @objc func onLongClick(_ sender: UILongPressGestureRecognizer) {
        let gestureLocation = sender.location(in: collectionView)
        switch sender.state {
            case .began:
                if let item = collectionView.indexPathForItem(at: gestureLocation) {
                    self.collectionView.beginInteractiveMovementForItem(at: item)
                } else {
                    return
                }
            case .changed:
                self.collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
            case .ended:
                self.collectionView.endInteractiveMovement()
            case.cancelled:
                self.collectionView.cancelInteractiveMovement()
            default:
                return
        }
    }

}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitsStore.habits.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,  withReuseIdentifier: ProgressCollectionViewCell.id, for: indexPath) as! ProgressCollectionViewCell
        header.setupHeader(habitsStore)
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 32),height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.id, for: indexPath) as! HabitCollectionViewCell
        cell.setupCell(habitsStore.habits[indexPath.item]) {
            self.collectionView.reloadData()
        }
        cell.layer.cornerRadius = 8
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = HabitsStore.shared.habits.remove(at: sourceIndexPath.item)
        HabitsStore.shared.habits.insert(item, at: destinationIndexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("you")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 32),height: 130)
    }

}
