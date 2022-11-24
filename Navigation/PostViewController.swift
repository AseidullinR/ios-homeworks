//
//  PostViewController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.11.2022.
//

import UIKit

final class PostViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "New post"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let post: Post

    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = post.title
        self.view.backgroundColor = .white
        setupBarButtonItem()
    }
    
    // Добавление Bar button item
    private func setupBarButtonItem() {
        let barItem = UIBarButtonItem(image: UIImage(systemName: "shareplay"), style: .plain, target: self, action: #selector(onClickBarItem))
        barItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = barItem
    }

    @objc
    private func onClickBarItem() {
        navigationController?.present(InfoViewController(), animated: true)
    }
}
