//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 25.11.2022.
//
// MARK: Creating ProfileHeaderView

import UIKit

final class ProfileHeaderView: UIView {
    
    //    var mode = Mode.edit
    
    // MARK: - Section of UI elements
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile"))
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Myayer"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "  Watch news..."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.backgroundColor = .gray
        label.layer.cornerRadius = 12
        label.layer.borderColor = UIColor.gray.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: TextFieldWithPadding = {
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
    
    private var statusText = ""
    
    private let setStatusButton: UIButton = {
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
    
    // MARK: -  Override initialization. Section of functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addAllSubviews()
        setupConstraints()
        setupButton()
        editText()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -68),
            statusLabel.leftAnchor.constraint(equalTo: fullNameLabel.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
    private func addAllSubviews() {
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(avatarImageView)
        addSubview(statusTextField)
    }
    
    private func setupButton() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc
    private func buttonPressed() {
        //        mode.toggle()
        //        _ = mode == .preview ? "Edit" : "Preview"
        //        let toValue: CGFloat = mode == .preview ? 0 : 1
        //        textView.animateBorderWidth(toValue: toValue, duration: 0.5)
        // textStatus.isHidden = mode == .preview
        
        statusLabel.text = statusText
        
        let text = statusLabel.text ?? ""
        if text.isEmpty {
            print("Статус не введен")
        } else {
            print(text)
        }
    }
    
    private func editText() {
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    @objc
    private func statusTextChanged(_ textField: UITextField) {
        statusText = "  " + statusTextField.text!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension UIView {
//    func animateBorderWidth(toValue: CGFloat, duration: Double) {
//        let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
//        animation.fromValue = layer.borderWidth
//        animation.toValue = toValue
//        animation.duration = duration
//        layer.add(animation, forKey: "Width")
//        layer.borderWidth = toValue
//    }
//}

//enum Mode {
//    case preview
//    case edit
//
//    mutating func toggle() {
//        switch self {
//        case .preview: self = .edit
//        case .edit: self = .preview
//        }
//    }
//}
