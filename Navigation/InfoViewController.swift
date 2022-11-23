//
//  InfoViewController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 21.11.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Repost", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 14
        button.frame = CGRect(x: 270, y: 50, width: 100, height: 50)
        return button
    }()
    
    private let alertController = UIAlertController(title: "Подтверждение", message: "Вы уверены?", preferredStyle: .alert)
    
    private func setupAlertConfiguration() {
        let action = UIAlertAction(title: "Репост", style: .default) {[weak self] _ in
            print ("Репост")
            self?.dismiss(animated: true)
        }
        let secondAction = UIAlertAction(title: "Отмена", style: .default) {[weak self] _ in
            print ("Отмена")
            self?.dismiss(animated: true)
        }

        alertController.addAction(action)
        alertController.addAction(secondAction)
        alertController.view.backgroundColor = .white
        alertController.view.tintColor = .darkGray
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
    }
    
    @objc
    private func tapOnButton() {
        self.present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        view.addSubview(button)
        setupButton()
        setupAlertConfiguration()
    }
}
