//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 25.11.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    var mode = Mode.edit

    private let profileTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Memer"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageAvatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile"))
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let textView: UITextView = {
        let text = UITextView()
        text.textColor = .gray
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 12
        text.backgroundColor = .lightGray
        text.font = .systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        text.text = "Watch news..."
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()

    private let textStatus: TextFieldWithPadding = {
        let text = TextFieldWithPadding()
        text.textColor = .black
        text.backgroundColor = .white
        text.font = .systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.placeholder = " Add a new status..."
        text.layer.cornerRadius = 12
        text.translatesAutoresizingMaskIntoConstraints = false
        text.allowsEditingTextAttributes = true
        return text
    }()

    var statusText = ""

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.systemPink, for: .highlighted)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            profileTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            profileTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageAvatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            imageAvatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            imageAvatar.heightAnchor.constraint(equalToConstant: 150),
            imageAvatar.widthAnchor.constraint(equalToConstant: 150),
            button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: imageAvatar.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            textView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -68),
            textView.leftAnchor.constraint(equalTo: profileTitleLabel.leftAnchor),
            textView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textView.heightAnchor.constraint(equalToConstant: 30),
            textStatus.heightAnchor.constraint(equalToConstant: 40),
            textStatus.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            textStatus.leftAnchor.constraint(equalTo: textView.leftAnchor),
            textStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(button)
        addSubview(profileTitleLabel)
        addSubview(textView)
        addSubview(imageAvatar)
        addSubview(textStatus)
        setupConstraints()
        setupButton()
        editText()
    }

    private func setupButton() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc
    private func buttonPressed() {
        mode.toggle()
        _ = mode == .preview ? "Edit" : "Preview"
        let toValue: CGFloat = mode == .preview ? 0 : 1
        textView.animateBorderWidth(toValue: toValue, duration: 0.5)
        textStatus.isHidden = mode == .preview
        textView.text = statusText

        let text = textView.text ?? ""
        if text.isEmpty {
            print("Статус не введен")
        } else {
            print(text)
        }
    }



    private func editText() {
        textStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }

    @objc
    private func statusTextChanged(_ textField: UITextField) {
        statusText = textStatus.text!
    }



    override func layoutSubviews() {
        super.layoutSubviews()
        imageAvatar.layer.cornerRadius = imageAvatar.frame.size.width / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    func animateBorderWidth(toValue: CGFloat, duration: Double) {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = toValue
        animation.duration = duration
        layer.add(animation, forKey: "Width")
        layer.borderWidth = toValue
    }
}

enum Mode {
    case preview
    case edit

    mutating func toggle() {
        switch self {
        case .preview: self = .edit
        case .edit: self = .preview
        }
    }
}
