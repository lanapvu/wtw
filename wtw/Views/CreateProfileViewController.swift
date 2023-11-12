//
//  CreateProfileViewController.swift
//  wtw
//
//  Created by lordpoo on 11/11/23.
//

import SwiftUI
import UIKit

class CreateProfileViewController: UIViewController {
    
    // MARK: - UI Components
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome, Lana!"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profileImage") // Replace with your image name
        return imageView
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone number"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        return textField
    }()
    
    let pronounsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pronouns"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let interestsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Interests"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupButtonActions()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [
            welcomeLabel,
            profileImageView,
            phoneNumberTextField,
            pronounsTextField,
            interestsTextField,
            saveButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Center profile image view
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupButtonActions() {
        saveButton.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func saveProfile() {
        // Validate and collect data from text fields
        let phoneNumber = phoneNumberTextField.text ?? ""
        let pronouns = pronounsTextField.text ?? ""
        let interests = interestsTextField.text ?? ""
        
        // Construct a profile object, assuming you have a Profile struct or class
        let profile = Profile(phoneNumber: phoneNumber, pronouns: pronouns, interests: interests)
        
        // Save the profile here (e.g., to a database or send to a server)
        print("Saving profile with data:", profile)
        
        // Provide user feedback (e.g., an alert to show success or error)
        // ... (feedback implementation)
    }
}

// Define your Profile model according to your needs
struct Profile {
    let phoneNumber: String
    let pronouns: String
    let interests: String
}


#Preview {
    CreateProfileViewController()
}
