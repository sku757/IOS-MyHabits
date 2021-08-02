//
//  ProgressViewCollectionCell.swift
//  MyHabitsMain
//
//  Created by Артем Сизов on 16.07.2021.
//

import UIKit

class ProgressViewCollectionCell: UICollectionViewCell{
    
    private let progLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.text = "Всё получится!"
        label.textColor = .systemGray
        label.toAutoLayout()
        return label
    }()
    
    private let progPercent: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .right
        label.toAutoLayout()
        return label
    }()
    
    private let progBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.trackTintColor = UIColor(named: "progresscolor")
        progressBar.progressTintColor = UIColor(named: "purpleColor")
        progressBar.layer.cornerRadius = 3.5
        progressBar.clipsToBounds = true
        progressBar.toAutoLayout()
        return progressBar
    }()
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateProg()
        setupViews()

    }
    
    func updateProg() {
        progBar.setProgress(HabitsStore.shared.todayProgress, animated: false)
        progPercent.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
    }
        
        func setupViews() {
            
        contentView.addSubviews(progLabel, progPercent, progBar)
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        
        let constraints = [
            
            progLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            progPercent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progPercent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            progBar.topAnchor.constraint(equalTo: progLabel.bottomAnchor, constant: 10),
            progBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progBar.heightAnchor.constraint(equalToConstant: 7),
            progBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
}


