//
//  InfoViewController.swift
//  MyHabitsMain
//
//  Created by Артем Сизов on 14.07.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.toAutoLayout()
        return container
    }()
    
    private let infotTitle: UILabel = {
       let label = UILabel()
        label.text = "Привычка за 21 день"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.toAutoLayout()
        return label
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelTwo: UILabel = {
       let label = UILabel()
        label.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelThree: UILabel = {
       let label = UILabel()
        label.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelFour: UILabel = {
       let label = UILabel()
        label.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,с чем еще предстоит серьезно бороться."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelFive: UILabel = {
       let label = UILabel()
        label.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelSix: UILabel = {
       let label = UILabel()
        label.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelSeven: UILabel = {
       let label = UILabel()
        label.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let infoLabelEight: UILabel = {
       let label = UILabel()
        label.text = "Источник: psychbook.ru"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        scrollView.toAutoLayout()
        view.addSubviews(scrollView)
        scrollView.addSubview(container)
        container.addSubviews(infoLabel, infotTitle, infoLabelTwo, infoLabelThree, infoLabelFour, infoLabelFive, infoLabelSix, infoLabelSeven, infoLabelEight)
        title = "Информация"
        let constrainsts = [
            infotTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 22),
            infotTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            infotTitle.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 144),
            
            infoLabel.topAnchor.constraint(equalTo: infotTitle.bottomAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
//            infoLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -24),
            infoLabelTwo.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            infoLabelTwo.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelTwo.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            
            infoLabelThree.topAnchor.constraint(equalTo: infoLabelTwo.bottomAnchor, constant: 12),
            infoLabelThree.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelThree.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            
            infoLabelFour.topAnchor.constraint(equalTo: infoLabelThree.bottomAnchor, constant: 12),
            infoLabelFour.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelFour.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            
            infoLabelFive.topAnchor.constraint(equalTo: infoLabelFour.bottomAnchor, constant: 12),
            infoLabelFive.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelFive.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            
            infoLabelSix.topAnchor.constraint(equalTo: infoLabelFive.bottomAnchor, constant: 12),
            infoLabelSix.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelSix.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            
            infoLabelSeven.topAnchor.constraint(equalTo: infoLabelSix.bottomAnchor, constant: 12),
            infoLabelSeven.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelSeven.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
           
            infoLabelEight.topAnchor.constraint(equalTo: infoLabelSeven.bottomAnchor, constant: 12),
            infoLabelEight.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoLabelEight.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            infoLabelEight.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ]
        NSLayoutConstraint.activate(constrainsts)
    }
}

extension UIView{
    func toAutoLayout(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0)}
    }
}

