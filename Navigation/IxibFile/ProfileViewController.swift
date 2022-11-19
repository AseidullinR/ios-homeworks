//
//  ProfileViewController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 15.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileView()
    }

    func loadProfileView() {
        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            profileView.frame = view.bounds
            profileView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            view.addSubview(profileView)
        } else {
            print("Error")
        }
    }
}
