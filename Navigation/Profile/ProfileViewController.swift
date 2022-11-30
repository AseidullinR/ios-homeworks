//
//  ProfileController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController  {

    private let exampleName: ProfileHeaderView = {
        let exampleName = ProfileHeaderView()
        exampleName.translatesAutoresizingMaskIntoConstraints = false
        return exampleName
    }()

    private let newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Refresh page", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.systemPink, for: .highlighted)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        view.addSubview(exampleName)
        view.addSubview(newButton)
        setupBigConstraints()
        exampleName.backgroundColor = .green
        title = "Profile"
        setupBigConstraints()
    }

    private func setupBigConstraints() {
        NSLayoutConstraint.activate([
            exampleName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            exampleName.rightAnchor.constraint(equalTo: view.rightAnchor),
            exampleName.leftAnchor.constraint(equalTo: view.leftAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            newButton.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
