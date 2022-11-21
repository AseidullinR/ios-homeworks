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
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 14
        return button
    }()
    
    override func viewDidLoad() {
        view.addSubview(button)
        button.frame = CGRect(x: 150, y: 700, width: 100, height: 30)
        setupButton()
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
    }
    @objc
    private func tapOnButton() {
        navigationController?.pushViewController(PostViewController(post: newPost) , animated: true)
    }
}
