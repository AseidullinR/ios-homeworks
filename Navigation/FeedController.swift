//
//  FeedController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.11.2022.
//

import UIKit

final class FeedController: UIViewController {
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("Show post", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        setupUI()
        setupButton()
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)

    }
    @objc
    private func tapOnButton() {
        navigationController?.pushViewController(PostViewController(post: newPost) , animated: true)
    }

    func setupUI() {
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            button.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])

    }
}
