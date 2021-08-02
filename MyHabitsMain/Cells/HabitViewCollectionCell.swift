//
//  HabitViewCollectionCell.swift
//  MyHabitsMain
//
//  Created by Артем Сизов on 16.07.2021.
//

import UIKit

class HabitViewCollectionCell: UICollectionViewCell {
    
    var isChecked: (() -> Void)?
    
    var habit: Habit? {
        didSet {
            habitNameLabel.text = habit?.name
            habitNameLabel.textColor = habit?.color
            habitDateLabel.text = habit?.dateString
            habitButton.layer.borderColor = habit?.color.cgColor
            countValueLabel.text = "\(habit?.trackDates.count ?? 0)"
            
            if self.habit?.isAlreadyTakenToday == true {
                habitButton.backgroundColor = habit?.color
                checkmark()
            } else {
                habitButton.backgroundColor = .white
            }
        }
    }
    
    private let habitNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 2
        label.toAutoLayout()
       return label
    }()
    
    private let habitDateLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray2
        label.toAutoLayout()
        return label
    }()
    
    private let countLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray2
        label.text = "Счетчик:"
        label.toAutoLayout()
       return label
    }()
    
    private lazy var countValueLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray2
        label.toAutoLayout()
        return label
    }()
    
    private lazy var habitButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 3
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(tapHabit), for: UIControl.Event.touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    @objc func tapHabit() {
        guard let habit = habit else { return }
        
        if habit.isAlreadyTakenToday == false {
            HabitsStore.shared.track(habit)
            habitButton.backgroundColor = self.habit?.color
            checkmark()
            countValueLabel.text = "\(habit.trackDates.count)"
            if let trackHabit = isChecked {
                trackHabit()
            }
        } 
    }
    
    func checkmark() {
         let size = UIFont.systemFont(ofSize: 17, weight: .semibold)
         let conf = UIImage.SymbolConfiguration(font: size)
         let image = UIImage(systemName: "checkmark", withConfiguration: conf)
         habitButton.setImage(image, for: UIControl.State.normal)
         habitButton.tintColor = .white
     }
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubviews(habitNameLabel,habitDateLabel,countLabel,countValueLabel,habitButton
        )
        checkmark()
        
        let constraints = [
            habitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -103),
            
            habitDateLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 4),
            habitDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -trailingInset),
            
            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countLabel.trailingAnchor.constraint(equalTo: countValueLabel.leadingAnchor, constant: -1),
            countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            countValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            habitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            habitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            habitButton.widthAnchor.constraint(equalToConstant: 38),
            habitButton.heightAnchor.constraint(equalTo: habitButton.widthAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private var trailingInset: CGFloat { return 16 }
