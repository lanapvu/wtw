//
//  LoginViewController.swift
//  wtw
//
//  Created by lordpoo on 11/11/23.
//

import SwiftUI
import UIKit

class LoginViewController: UIViewController {
    
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
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please sign in to continue"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign Up", for: .normal)
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
        view.addSubview(signUpButton)
        let stackView = UIStackView(arrangedSubviews: [
            profileImageView,
            titleLabel,
            subtitleLabel,
            emailTextField,
            passwordTextField,
            signInButton,
            forgotPasswordButton,
            signUpButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            
            emailTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            signInButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40),
            
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                        // Set other constraints as needed
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupActions() {
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    private func setupButtonAction() {
            // Add target-action for the signUpButton
            signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        }
    @objc private func signUpButtonTapped() {
            // Instantiate the CreateAccountViewController and present it
            let createAccountVC = CreateAccountViewController()
            if let navigator = navigationController {
                // If inside a navigation controller, push the view controller
                navigator.pushViewController(createAccountVC, animated: true)
            } else {
                // If not, present it modally
                createAccountVC.modalPresentationStyle = .fullScreen // or .automatic based on your preference
                present(createAccountVC, animated: true, completion: nil)
            }
        }
    // MARK: - Actions
    @objc private func signInTapped() {
        // Handle sign in action
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // Perform login logic, potentially involving a network request
        // ...
    }
    
    @objc private func forgotPasswordTapped() {
        // Handle forgot password action
        // ...
    }
    
    @objc private func signUpTapped() {
        // Handle sign up action
        // ...
    }
}

#Preview {
    LoginViewController()
}
