//
//  CreateAccountViewController.swift
//  wtw
//
//  Created by lordpoo on 11/11/23.
//

import SwiftUI
import UIKit

class CreateAccountViewController: UIViewController {
    
    // MARK: - UI Components
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.crop.circle.fill") // Using SF Symbols for the profile icon
        imageView.tintColor = .systemGreen
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already have an account? Sign In", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupActions()        
        setupButtonAction()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(signInButton)

        let stackView = UIStackView(arrangedSubviews: [
            profileImageView,
            titleLabel,
            nameTextField,
            emailTextField,
            passwordTextField,
            confirmPasswordTextField,
            signUpButton,
            signInButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            
            nameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            emailTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            confirmPasswordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            signUpButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
    private func setupActions() {
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
    }
    private func setupButtonAction() {
           // Add target-action for the signInButton
           signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
       }
    @objc private func signInButtonTapped() {
            // Instantiate the LoginViewController and present it
            let loginVC = LoginViewController()
            if let navigator = navigationController {
                // If inside a navigation controller, push the view controller
                navigator.pushViewController(loginVC, animated: true)
            } else {
                // If not, present it modally
                loginVC.modalPresentationStyle = .fullScreen // or .automatic based on your preference
                present(loginVC, animated: true, completion: nil)
            }
        }
    
    // MARK: - Actions
    @objc private func signUpTapped() {
        // Handle sign up action
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        
        // Implement your sign up logic here, including validation and network request to your server
        // ...
    }
    
    @objc private func signInTapped() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

}

#Preview {
    CreateAccountViewController()
}
