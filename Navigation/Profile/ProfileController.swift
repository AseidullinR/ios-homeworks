//
//  ProfileController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.11.2022.
//

import UIKit


final class ProfileController: UIViewController  {

    private let exampleName: ProfileHeaderView = {
        let exampleName = ProfileHeaderView()
        return exampleName
    }()


    override func viewWillLayoutSubviews() {
        view.addSubview(exampleName)
        exampleName.frame = view.bounds.offsetBy(dx: 0, dy: 100)  // Указано для соблюдения параметров макета
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Profile"
    }
}
