//
//  CheckoutViewController.swift
//  KAppleCenter
//
//  Created by Siros Taib on 3/29/24.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var selectedItem: String?
    var selectedItemImage: UIImage?
    let closeAppButton = UIButton()
    
    private let productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.image = UIImage(resource: .allProducts)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        return productImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        
    }
    
    private func setupLayout(){
        
        view.addSubview(productImageView)
        productImageView.image = selectedItemImage
        // Label to display the message
               let messageLabel = UILabel()
               messageLabel.text = "You have successfully purchased \(selectedItem!)"
               messageLabel.textAlignment = .center
               messageLabel.numberOfLines = 0
        messageLabel.textColor = .label
               messageLabel.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(messageLabel)
        
        closeAppButton.configuration = .tinted()
        closeAppButton.configuration?.baseForegroundColor = .systemRed
        closeAppButton.configuration?.baseBackgroundColor = .systemRed
        closeAppButton.configuration?.title = "Exit App"
        closeAppButton.configuration?.image = UIImage(systemName: "xmark.circle.fill")
        closeAppButton.configuration?.imagePadding = 8
        closeAppButton.addTarget(self, action: #selector(closeApp), for: .touchUpInside)
        closeAppButton.translatesAutoresizingMaskIntoConstraints = false
          
               view.addSubview(closeAppButton)
        
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 225),
            productImageView.widthAnchor.constraint(equalToConstant: 330), ])
               
               // Constraints for message label
               NSLayoutConstraint.activate([
                   messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
               ])
               
               // Constraints for close button
               NSLayoutConstraint.activate([
                   closeAppButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   closeAppButton.heightAnchor.constraint(equalToConstant: 50),
                   closeAppButton.widthAnchor.constraint(equalToConstant: 300),
                   closeAppButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
               ])
    }
    
    @objc func closeApp() {
            exit(0) // This method is not usually recommended for closing apps, but for demonstration purposes, it's used here.
        }
    

    

}
