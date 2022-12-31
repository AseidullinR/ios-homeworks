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

    override func viewDidLoad() {
        view.backgroundColor = .systemGray6
        view.addSubview(exampleName)
        exampleName.backgroundColor = .systemGray6
        setupBigConstraints()
    }

    private func setupBigConstraints() {
        NSLayoutConstraint.activate([
            exampleName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            exampleName.rightAnchor.constraint(equalTo: view.rightAnchor),
            exampleName.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
}
