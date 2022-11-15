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
        if let nibView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            nibView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            view.addSubview(nibView)
        } else {
            print("Error")
        }
    }
}
