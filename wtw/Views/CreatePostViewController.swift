//
//  CreatePostViewController.swift
//  wtw
//
//  Created by lordpoo on 11/11/23.
//
import UIKit

class CreatePostViewController: UIViewController {
    
    // MARK: - UI Elements
    let locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "My Location"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let fromDateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("November 12, 2:30 PM", for: .normal)
        return button
    }()
    
    let toDateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("November 12, 4:30 PM", for: .normal)
        return button
    }()
    
    lazy var categoryButtons: [UIButton] = ["Hiking", "Movies", "Food", "Outdoors", "Tech", "Shows", "Sport", "Indoors"].map { category in
        let button = UIButton(type: .system)
        button.setTitle(category, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.systemGreen
        return button
    }
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
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
        let stackView = UIStackView(arrangedSubviews: [locationTextField, fromDateButton, toDateButton, createCategoriesStack(), saveButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        locationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        fromDateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        toDateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func setupButtonActions() {
        fromDateButton.addTarget(self, action: #selector(selectFromDate), for: .touchUpInside)
        toDateButton.addTarget(self, action: #selector(selectToDate), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(savePost), for: .touchUpInside)
        categoryButtons.forEach { button in
            button.addTarget(self, action: #selector(categorySelected(_:)), for: .touchUpInside)
        }
    }
    
    private func createCategoriesStack() -> UIStackView {
        let categoriesStackView = UIStackView()
        categoriesStackView.axis = .vertical
        categoriesStackView.spacing = 10
        
        let firstRowStackView = UIStackView(arrangedSubviews: Array(categoryButtons[0...3]))
        let secondRowStackView = UIStackView(arrangedSubviews: Array(categoryButtons[4...7]))
        
        firstRowStackView.distribution = .fillEqually
        secondRowStackView.distribution = .fillEqually
        firstRowStackView.spacing = 10
        secondRowStackView.spacing = 10
        
        categoriesStackView.addArrangedSubview(firstRowStackView)
        categoriesStackView.addArrangedSubview(secondRowStackView)
        
        return categoriesStackView
    }
    
    // MARK: - Actions
    @objc func selectFromDate() {
        presentDatePicker { [weak self] date in
            self?.fromDateButton.setTitle(self?.dateFormatter.string(from: date), for: .normal)
        }
    }
    
    @objc func selectToDate() {
        presentDatePicker { [weak self] date in
            self?.toDateButton.setTitle(self?.dateFormatter.string(from: date), for: .normal)
        }
    }
    
    @objc func categorySelected(_ sender: UIButton) {
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? .darkGray : .systemGreen
    }
    
    @objc func savePost() {
        let location = locationTextField.text ?? ""
        let fromDate = fromDateButton.title(for: .normal) ?? ""
        let toDate = toDateButton.title(for: .normal) ?? ""
        let selectedCategories = categoryButtons.filter { $0.isSelected }.map { $0.title(for: .normal) ?? "" }
        
        let postDetails = [
            "location": location,
            "fromDate": fromDate,
            "toDate": toDate,
            "categories": selectedCategories
        ] as [String : Any]
        
        // Here you would send the `postDetails` dictionary to your server.
        // For demonstration, we'll just print it.
        print("Post Details:", postDetails)
        
        // Simulate a save and show an alert.
        savePostToServer(postDetails)
    }
    
    private func presentDatePicker(completion: @escaping (Date) -> Void) {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        
        let alert = UIAlertController(title: "Select Date", message: "\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        alert.view.addSubview(datePicker)
        
        datePicker.frame = CGRect(x: 5, y: 50, width: 250, height: 200)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { _ in
            completion(datePicker.date)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func savePostToServer(_ postDetails: [String: Any]) {
        // Simulate a network request delay
        DispatchQueue.global(qos: .background).async {
            sleep(2)  // Simulate network delay
            
            // In real app, you would make a network request here
            
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Success", message: "Your post has been saved.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

#Preview {
    CreatePostViewController()
}
