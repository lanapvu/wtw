//
//  MyProfileView.swift
//  wtw
//
//  Created by lordpoo on 11/11/23.
//

import UIKit

class UserProfileViewController: UIViewController {

    // MARK: - Properties
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profileImage") // Replace with your image name
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lana"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

    let pronounsLabel: UILabel = {
        let label = UILabel()
        label.text = "she/her"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Amherst, MA"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    let interestsLabel: UILabel = {
        let label = UILabel()
        label.text = "Interests"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    // You will need to create a custom view that can hold multiple interest tags
    // For simplicity, here's a placeholder for where those would go
    let interestsContainerView: UIView = {
        let view = UIView()
        // Add custom views or buttons for each interest
        return view
    }()

    // Post views would be custom UIViews that you design, similar to the interestsContainerView
    // Here's a placeholder for where those would go
    let postsContainerView: UIView = {
        let view = UIView()
        // Add custom views for each post
        return view
    }()
    let interests: [String] = ["Hiking", "Movies", "Concerts", "Dinner"]
        let posts: [String] = ["Movie night out! Just watched Barbie, it was amazing!"]


    // MARK: - Lifecycle
    override func viewDidLoad() {
            super.viewDidLoad()
            setupLayout()
            setupInterests()
            setupPosts()
        }


    // MARK: - Setup
    private func setupLayout() {
        view.backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [profileImageView, nameLabel, pronounsLabel, locationLabel, interestsLabel, interestsContainerView, postsContainerView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        // Auto Layout constraints
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),

            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        setupInterests()
        setupPosts()
            }
            
            private func setupInterests() {
                // Layout each interest as a label within the interestsContainerView
                let interestLabels = interests.map { interest -> UILabel in
                    let label = UILabel()
                    label.text = interest
                    label.font = UIFont.systemFont(ofSize: 16)
                    label.backgroundColor = .lightGray // Use your app's color scheme
                    label.textAlignment = .center
                    label.layer.cornerRadius = 10
                    label.clipsToBounds = true
                    return label
                }
                
                let interestsStackView = UIStackView(arrangedSubviews: interestLabels)
                interestsStackView.axis = .horizontal
                interestsStackView.spacing = 8
                interestsStackView.alignment = .center
                interestsStackView.distribution = .fillEqually
                interestsStackView.translatesAutoresizingMaskIntoConstraints = false
                
                interestsContainerView.addSubview(interestsStackView)
                NSLayoutConstraint.activate([
                            interestsStackView.topAnchor.constraint(equalTo: interestsContainerView.topAnchor),
                            interestsStackView.bottomAnchor.constraint(equalTo: interestsContainerView.bottomAnchor),
                            interestsStackView.leadingAnchor.constraint(equalTo: interestsContainerView.leadingAnchor),
                            interestsStackView.trailingAnchor.constraint(equalTo: interestsContainerView.trailingAnchor)
                        ])
        // Further layout setup for interestsContainerView and postsContainerView would be needed
                
    }
    private func setupPosts() {
            // Layout each post as a label within the postsContainerView
            let postLabels = posts.map { post -> UILabel in
                let label = UILabel()
                label.text = post
                label.font = UIFont.systemFont(ofSize: 16)
                label.numberOfLines = 0  // Allows label to have multiple lines
                label.backgroundColor = .systemGreen // Use your app's color scheme
                label.textAlignment = .center
                label.layer.cornerRadius = 10
                label.clipsToBounds = true
                return label
            }
            
            let postsStackView = UIStackView(arrangedSubviews: postLabels)
            postsStackView.axis = .vertical
            postsStackView.spacing = 8
            postsStackView.alignment = .fill
            postsStackView.distribution = .equalSpacing
            postsStackView.translatesAutoresizingMaskIntoConstraints = false
            
            postsContainerView.addSubview(postsStackView)
            
            // Constraints for postsStackView
            NSLayoutConstraint.activate([
                postsStackView.topAnchor.constraint(equalTo: postsContainerView.topAnchor),
                postsStackView.bottomAnchor.constraint(equalTo: postsContainerView.bottomAnchor),
                postsStackView.leadingAnchor.constraint(equalTo: postsContainerView.leadingAnchor),
                postsStackView.trailingAnchor.constraint(equalTo: postsContainerView.trailingAnchor)
            ])
        }
}
#Preview {
    UserProfileViewController()
}


