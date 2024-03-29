//
//  ProductSelectVC.swift
//  KAppleCenter
//
//  Created by Siros Taib on 3/29/24.
//

import UIKit

protocol ProductSelectDelegate {
    func didSelectProduct(pName: String, pImageName: String)
    func shouldSelectPrice(value: Bool)
}

class ProductSelectVC: UIViewController {
    
    let iPhoneButton = UIButton()
    let iPadButton = UIButton()
    let macBookButton = UIButton()
    
    var delegate: ProductSelectDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func iPhoneButtonTapped() {
        delegate?.didSelectProduct(pName: "iPhone 14 Pro", pImageName: "iphone")
        delegate?.shouldSelectPrice(value: true)
        dismiss(animated: true)
    }


    @objc func iPadButtonTapped() {
        delegate?.didSelectProduct(pName: "iPad Pro", pImageName: "ipad")
        delegate?.shouldSelectPrice(value: true)
        dismiss(animated: true)
    }


    @objc func macBookButtonTapped() {
        delegate?.didSelectProduct(pName: "Macbook Pro", pImageName: "mac")
        delegate?.shouldSelectPrice(value: true)
        dismiss(animated: true)
    }
    
    func setupUI() {
        view.addSubview(iPhoneButton)
        view.addSubview(iPadButton)
        view.addSubview(macBookButton)
        
        
        view.backgroundColor = .systemBackground

        iPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        iPadButton.translatesAutoresizingMaskIntoConstraints = false
        macBookButton.translatesAutoresizingMaskIntoConstraints = false
        
        configureDeviceButton(buttonType: iPhoneButton, title: "iPhone", image: "iphone", color: .systemBlue, onTap: #selector(iPhoneButtonTapped))
        configureDeviceButton(buttonType: iPadButton ,title: "iPad", image: "ipad", color: .systemTeal, onTap: #selector(iPadButtonTapped))
        configureDeviceButton(buttonType: macBookButton,title: "MacBook Pro", image: "laptopcomputer", color: .systemIndigo, onTap: #selector(macBookButtonTapped))
      

     

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            iPadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iPadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPadButton.heightAnchor.constraint(equalToConstant: 50),
            iPadButton.widthAnchor.constraint(equalToConstant: 280),

            iPhoneButton.bottomAnchor.constraint(equalTo: iPadButton.topAnchor, constant: -padding),
            iPhoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPhoneButton.heightAnchor.constraint(equalToConstant: 50),
            iPhoneButton.widthAnchor.constraint(equalToConstant: 280),

            macBookButton.topAnchor.constraint(equalTo: iPadButton.bottomAnchor, constant: padding),
            macBookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            macBookButton.heightAnchor.constraint(equalToConstant: 50),
            macBookButton.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
    
    private func configureDeviceButton(buttonType: UIButton, title: String, image: String, color: UIColor, onTap: Selector){
        buttonType.configuration = .tinted()
        buttonType.configuration?.title = title
        buttonType.configuration?.image = UIImage(systemName: image)
        buttonType.configuration?.imagePadding = 8
        buttonType.configuration?.baseForegroundColor = color
        buttonType.configuration?.baseBackgroundColor = color
        buttonType.addTarget(self, action: onTap, for: .touchUpInside)
    }
    
    
    

}


