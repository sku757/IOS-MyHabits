//
//  HabitsViewController.swift
//  MyHabitsMain
//
//  Created by Артем Сизов on 14.07.2021.
//

import UIKit

class HabitsViewController: UIViewController, UICollectionViewDelegate {
    let store = HabitsStore.shared
    let appearance = UINavigationBarAppearance()
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    private let deleteButton: UIButton = {
//       let button = UIButton()
//        button.setTitle("Delete habits", for: .normal)
//        button.addTarget(self, action: #selector(doButton), for: .touchUpInside)
//        button.layer.cornerRadius = 8
//        button.backgroundColor = .systemBlue
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.toAutoLayout()
//        return button
//    }()
//
//    @objc func doButton(){
//        let store = HabitsStore.shared
//        store.habits.removeAll()
//        print("fsafasf")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Navigation Bar Color")
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(named: "Navigation Bar Color")
        setupCollectionView()
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        HabitsStore.shared.habits.sort(by: { $0.date < $1.date })
        collectionView.reloadData()
        
    }
}

private extension HabitsViewController {
    func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.toAutoLayout()
//        view.addSubviews(deleteButton)
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
//            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)

        ]
        NSLayoutConstraint.activate(constraints)
//        layout.itemSize = CGSize(width: 343, height: 130)
//        layout.minimumLineSpacing = 12
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HabitViewCollectionCell.self, forCellWithReuseIdentifier: String(describing: HabitViewCollectionCell.self))
       collectionView.register(ProgressViewCollectionCell.self, forCellWithReuseIdentifier: String(describing: ProgressViewCollectionCell.self))
        collectionView.backgroundColor = UIColor(named: "BG color")
    }
}



extension HabitsViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return store.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section{

        case 0:
            let progressCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressViewCollectionCell.self), for: indexPath) as! ProgressViewCollectionCell
                progressCell.updateProg()
            
            return progressCell
        default:
            let habitCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitViewCollectionCell.self), for: indexPath) as! HabitViewCollectionCell
        
        habitCell.habit = store.habits[indexPath.item]
        habitCell.isChecked = { self.collectionView.reloadData() }
        
        return habitCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1: let vc = HabitDetailsViewController(habit: store.habits[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)

        default: break
            
        }
}
    
}

    extension HabitsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch indexPath.section {
        case 0:
            return CGSize(width: (collectionView.frame.width - 33), height: 60)
        default:
            return  CGSize(width: (collectionView.frame.width - 33), height: 130)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 22, left: .zero, bottom: .zero, right:.zero)
        default:
            return UIEdgeInsets(top: 18, left: .zero, bottom: .zero, right: .zero)
        }
    }
}

    
