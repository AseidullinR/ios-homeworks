//
//  LogInViewController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 07.12.2022.
//

import UIKit

final class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var allContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var imageLogo: UIImageView = {
        let imageLogo = UIImageView(image: UIImage(named: "logo"))
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillProportionally

        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tag = 0
        textField.placeholder = "Email of phone"
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .continue
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tag = 1
        textField.returnKeyType = .done
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.returnKeyType = .done
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        if let pixel = UIImage(named: "blue_pixel") {
            button.setBackgroundImage(pixel.image(alpha: 1), for: .normal)
            button.setBackgroundImage(pixel.image(alpha: 0.8), for: .selected)
            button.setBackgroundImage(pixel.image(alpha: 0.6), for: .highlighted)
            button.setBackgroundImage(pixel.image(alpha: 0.4), for: .disabled)
        }
        // button.backgroundColor = colorSet
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(nil, action: #selector(touchLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var login: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        self.setupGestures()
        setupViews()
        setupAllConstraints()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(allContentView)

        allContentView.addNewSubviews(imageLogo, stackView, loginButton)

        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)

        loginTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(hideKeyboard),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }


    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }

    @objc private func showKeyboard(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentOffset.y = (24 + keyboardFrame.height) - (scrollView.frame.height - loginButton.frame.minY)
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        }
    }

    @objc private func hideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    private func setupAllConstraints() {
        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            allContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            allContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            allContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            allContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            allContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            allContentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),

            imageLogo.topAnchor.constraint(equalTo: allContentView.topAnchor, constant: 120),
            imageLogo.centerXAnchor.constraint(equalTo: allContentView.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    
    @objc private func touchLoginButton() {
        let profile = ProfileViewController()
        navigationController?.setViewControllers([profile], animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.forcedHidingKeyboard()
        }

        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 0 {
            self.login = textField.text
        } else if textField.tag == 1 {
        }
    }
}

extension UIView {
    func addNewSubviews(_ subviews: UIView...) {
        for item in subviews {
            self.addSubview(item)
        }
    }
}

extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let imageNew = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageNew
    }
}
