//
//  ViewController.swift
//  KAppleCenter
//
//  Created by Siros Taib on 3/29/24.
//

import UIKit

class MainScreenVC: UIViewController {
    var chooseButtonConstraints: [NSLayoutConstraint] = []
    var buyButtonConstraints: [NSLayoutConstraint] = []
    
    
    private let productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.image = UIImage(resource: .allProducts)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        return productImageView
    }()

    private let productNameLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.text = "Apple Devices"
        productNameLabel.textAlignment = .center
        productNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        productNameLabel.textColor = .darkGray
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return productNameLabel
    }()
   
    let buyProductButton = UIButton()
    let chooseProductButton = UIButton()
    let removeProductButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    @objc func presentProductSelectionVC() {
            let modalVC = ProductSelectVC()
            modalVC.delegate = self

            modalVC.modalPresentationStyle = .pageSheet
            modalVC.sheetPresentationController?.detents = [.medium()]
            modalVC.sheetPresentationController?.prefersGrabberVisible = true
            present(modalVC, animated: true)
        }

    
    @objc fileprivate func buyProductNow() {

        let vc = CheckoutViewController()
        vc.selectedItem = productNameLabel.text
        vc.selectedItemImage = productImageView.image
        self.navigationController?.pushViewController(vc, animated: true)
     }
    
    
    
    @objc fileprivate func deleteProduct() {

        productNameLabel.text = "Apple Devices"
        chooseProductButton.configuration?.image = UIImage(systemName: "apple.logo")
        productImageView.image = UIImage(resource: .allProducts)
        chooseProductButton.configuration?.title = "Choose Device"
        buyProductButton.isHidden = true
        removeProductButton.isHidden = true
        switchButtonPlaces(initial: true)
     }

    

    func setupUI() {
           view.addSubview(productImageView)
           view.addSubview(productNameLabel)
            view.addSubview(buyProductButton)
           view.addSubview(chooseProductButton)
        view.addSubview(removeProductButton)
        
        buyProductButton.isHidden = true
        removeProductButton.isHidden = true

          
            buyProductButton.translatesAutoresizingMaskIntoConstraints = false
           chooseProductButton.translatesAutoresizingMaskIntoConstraints = false
        removeProductButton.translatesAutoresizingMaskIntoConstraints = false

           

         

           chooseProductButton.configuration = .tinted()
           chooseProductButton.configuration?.title = "Choose Device"
           chooseProductButton.configuration?.image = UIImage(systemName: "apple.logo")
           chooseProductButton.configuration?.imagePadding = 8
            chooseProductButton.addTarget(self, action: #selector(presentProductSelectionVC), for: .touchUpInside)
        
        buyProductButton.configuration = .tinted()
        buyProductButton.configuration?.baseForegroundColor = .systemCyan
        buyProductButton.configuration?.baseBackgroundColor = .systemCyan
        buyProductButton.configuration?.title = "Buy Now!"
        buyProductButton.configuration?.image = UIImage(systemName: "dollarsign.circle.fill")
        buyProductButton.configuration?.imagePadding = 8
        buyProductButton.addTarget(self, action: #selector(buyProductNow), for: .touchUpInside)
        
        removeProductButton.configuration = .tinted()
        removeProductButton.configuration?.baseForegroundColor = .systemRed
        removeProductButton.configuration?.baseBackgroundColor = .systemRed
        removeProductButton.configuration?.title = "Remove"
        removeProductButton.configuration?.image = UIImage(systemName: "trash.circle.fill")
        removeProductButton.configuration?.imagePadding = 8
        removeProductButton.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
          

           let padding: CGFloat = 20
        
        //activate chooose
        chooseButtonConstraints = [
            chooseProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            chooseProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
           chooseProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        NSLayoutConstraint.activate(chooseButtonConstraints)
        
        // activate buy
        buyButtonConstraints = [
            buyProductButton.bottomAnchor.constraint(equalTo: chooseProductButton.topAnchor, constant: -10),
            buyProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buyProductButton.heightAnchor.constraint(equalToConstant: 50),
            buyProductButton.widthAnchor.constraint(equalToConstant: 165),
        ]
        NSLayoutConstraint.activate(buyButtonConstraints)
      
           NSLayoutConstraint.activate([
               productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
               productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               productImageView.heightAnchor.constraint(equalToConstant: 225),
               productImageView.widthAnchor.constraint(equalToConstant: 330),

               productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: padding),
               productNameLabel.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor),
               productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
               productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
               
               removeProductButton.bottomAnchor.constraint(equalTo: chooseProductButton.topAnchor, constant: -10),
               removeProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
               removeProductButton.heightAnchor.constraint(equalToConstant: 50),
               removeProductButton.widthAnchor.constraint(equalToConstant: 165),
           ])
      
       }
    
    
    
    func switchButtonPlaces(initial: Bool){
        
    
        
        if(initial){
            print("hereeeee x")
            NSLayoutConstraint.deactivate(buyButtonConstraints)
            NSLayoutConstraint.deactivate(chooseButtonConstraints)
             chooseButtonConstraints = [
                chooseProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                chooseProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
               chooseProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
                chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
             ]
            
            NSLayoutConstraint.activate(chooseButtonConstraints)
            
        }else {
            print("didddd")
            NSLayoutConstraint.deactivate(buyButtonConstraints)
            NSLayoutConstraint.deactivate(chooseButtonConstraints)
          
            
            buyButtonConstraints = [
                buyProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                buyProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
                buyProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
                buyProductButton.heightAnchor.constraint(equalToConstant: 50),
                buyProductButton.widthAnchor.constraint(equalToConstant: 340),
            ]
            
            NSLayoutConstraint.activate([
                removeProductButton.bottomAnchor.constraint(equalTo: buyProductButton.topAnchor, constant: -10),
            ])
            
            NSLayoutConstraint.activate(buyButtonConstraints)
            
            chooseButtonConstraints = [
                chooseProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
                chooseProductButton.bottomAnchor.constraint(equalTo: buyProductButton.topAnchor, constant: -10),
                chooseProductButton.widthAnchor.constraint(equalToConstant: 165),
                chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
         
            ]
            
            NSLayoutConstraint.activate(chooseButtonConstraints)
            
          
        }
        
       
        
        
    
       
    }
}

extension MainScreenVC: ProductSelectDelegate {
    func shouldSelectPrice(value: Bool) {
        buyProductButton.isHidden = false
        removeProductButton.isHidden = false
        chooseProductButton.configuration?.title = "Change"
        self.view.setNeedsUpdateConstraints()
        self.view.layoutIfNeeded()
        switchButtonPlaces(initial: false)
        
    }
    
    func didSelectProduct(pName: String, pImageName: String) {
        productImageView.image = UIImage(named: pImageName)
        productNameLabel.text = pName
    }
}
