//
//  MainViewController.swift
//  NIS-IOS-LocalizedApp
//
//  Created by Ярослав Карпунькин on 14.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Variables
    private lazy var localeLabel: UILabel  = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var firstLeftLabel = LocalizedLabel(key: "LABEL_ONE", comment: "The number 1", alignment: .left)
    private lazy var secondLeftLabel = LocalizedLabel(key: "LABEL_TWO", comment: "The number 2", alignment: .left)
    private lazy var thirdLeftLabel = LocalizedLabel(key: "LABEL_THREE", comment: "The number 3", alignment: .left)
    private lazy var fourthLeftLabel = LocalizedLabel(key: "LABEL_FOUR", comment: "The number 4", alignment: .left)
    private lazy var fifthLeftLabel = LocalizedLabel(key: "LABEL_FIVE", comment: "The number 5", alignment: .left)
    
    private lazy var flagImageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    public enum Language: String {
//        case en = "ru-RU"
//        case ru
//    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let locale = NSLocale.current
        
        let currentLangId = Locale.preferredLanguages.first
        let displayLang = (locale as NSLocale).displayName(forKey: NSLocale.Key.languageCode, value: currentLangId)
        print(displayLang)
        let capitalized = displayLang?.capitalized(with: NSLocale(localeIdentifier: currentLangId!) as Locale)
//        let capitalized = locale.localizedString(for: <#T##Calendar.Identifier#>)
        localeLabel.text = capitalized
        
        let flagFile = NSLocalizedString("FLAG_FILE", comment: "Name of the flag")
        flagImageView.image = UIImage(named: flagFile)
        
        setupConstraints()
        
    }
}

//MARK: - Constraints
extension MainViewController {
    private func setupConstraints() {
        let leftStackView = UIStackView(arrangedSubviews: [firstLeftLabel, secondLeftLabel, thirdLeftLabel, fourthLeftLabel, fifthLeftLabel],  axis: .vertical, spacing: 15)
        view.addSubview(leftStackView)
        view.addSubview(flagImageView)
        view.addSubview(localeLabel)
        
        NSLayoutConstraint.activate([
            flagImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            flagImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, multiplier: 0.7),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            localeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            localeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            leftStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            leftStackView.topAnchor.constraint(equalTo: localeLabel.bottomAnchor, constant: 15),
            leftStackView.bottomAnchor.constraint(lessThanOrEqualTo: flagImageView.topAnchor, constant: 20)
        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainViewController()
        
        func makeUIViewController(context: Context) -> some MainViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
