//
//  ViewController.swift
//  ExamPreparation
//
//  Created by Md Khaliful islam on 15/01/2024.
//

import UIKit

class InitialController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var gameCollectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commonParentView = UIView()
        commonParentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commonParentView)
        
        // Setting up constraints for commonParentView
        NSLayoutConstraint.activate([
            commonParentView.topAnchor.constraint(equalTo: view.topAnchor),
            commonParentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            commonParentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commonParentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Your existing code for bgImgView
        let bgImgView = UIImageView()
        bgImgView.translatesAutoresizingMaskIntoConstraints = false
        commonParentView.addSubview(bgImgView)
        
        // Constraints for bgImgView
        NSLayoutConstraint.activate([
            bgImgView.topAnchor.constraint(equalTo: commonParentView.topAnchor, constant: 0),
            bgImgView.bottomAnchor.constraint(equalTo: commonParentView.bottomAnchor, constant: 0),
            bgImgView.leadingAnchor.constraint(equalTo: commonParentView.leadingAnchor),
            bgImgView.trailingAnchor.constraint(equalTo: commonParentView.trailingAnchor)
        ])
        
        // Initialize bgImgView with an image
        bgImgView.image = UIImage(named: "background")
        
        
        
        
        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        layout.itemSize = CGSize(width: 400, height: 400)
        
        // Your existing code for gameCollectionView
        gameCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        gameCollectionView.translatesAutoresizingMaskIntoConstraints = false
        commonParentView.addSubview(gameCollectionView)
        gameCollectionView.isScrollEnabled = true
        gameCollectionView.isUserInteractionEnabled = true
        gameCollectionView.alwaysBounceVertical = false
        
        
        // Constraints for gameCollectionView
        NSLayoutConstraint.activate([
            gameCollectionView.centerXAnchor.constraint(equalTo: bgImgView.centerXAnchor),
            gameCollectionView.heightAnchor.constraint(equalTo: bgImgView.heightAnchor, multiplier: 0.8),
            gameCollectionView.topAnchor.constraint(equalTo: bgImgView.topAnchor, constant: 150),
            gameCollectionView.leadingAnchor.constraint(equalTo: bgImgView.leadingAnchor),
            gameCollectionView.trailingAnchor.constraint(equalTo: bgImgView.trailingAnchor)
        ])
        
        gameCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        gameCollectionView.backgroundColor = UIColor.clear
        gameCollectionView.dataSource = self
        gameCollectionView.delegate = self
        
        
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        bgImgView.addSubview(headerLabel)
        headerLabel.font = UIFont(name: "Trebuchet-BoldItalic", size: 90)
        headerLabel.topAnchor.constraint(equalTo: bgImgView.topAnchor, constant: 25).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: gameCollectionView.topAnchor, constant: 0).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: bgImgView.leadingAnchor, constant: 0).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: bgImgView.trailingAnchor, constant: 0).isActive = true
        headerLabel.text = "Identify Me"
        headerLabel.textAlignment = .center
        headerLabel.textColor = UIColor(red: 224.0/255.0, green: 129.0/255, blue: 47.0/255.0, alpha: 1.0)//224,129,47,255
        
        for fontFamilyNames in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyNames) {
                print("FONTNAME:\(fontName)")
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 // How many cells to display
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.white
        myCell.layer.shadowColor = UIColor.black.cgColor
        myCell.layer.shadowOpacity = 1
        myCell.layer.shadowOffset = .zero
        myCell.layer.shadowRadius = 30
        myCell.layer.cornerRadius = 30
        var imageName = ""
        var cellName = ""
        
        switch indexPath.row {
        case 0:
            imageName = "apple"
            cellName = "Fruits"
        case 1:
            imageName = "dog"
            cellName = "Animal"
        case 2:
            imageName = "fish"
            cellName = "Fish"
        case 3:
            imageName = "flower"
            cellName = "Flower"
        case 4:
            imageName = "vehicle"
            cellName = "Vehicle"
        case 5:
            imageName = "birds"
            cellName = "Birds"
        case 6:
            imageName = "numbers"
            cellName = "Numbers"
        default:
            imageName = "apple"
            cellName = "Fruits"
        }
        
        
        
        let bgImgView = UIImageView(image:  UIImage(named: imageName))
        bgImgView.translatesAutoresizingMaskIntoConstraints = false
        myCell.addSubview(bgImgView)
        bgImgView.contentMode = .scaleAspectFit
        // Constraints for bgImgView
        NSLayoutConstraint.activate([
            bgImgView.topAnchor.constraint(equalTo: myCell.topAnchor, constant: 0),
            bgImgView.bottomAnchor.constraint(equalTo: myCell.bottomAnchor, constant: -80),
            bgImgView.leadingAnchor.constraint(equalTo: myCell.leadingAnchor, constant: 5),
            bgImgView.trailingAnchor.constraint(equalTo: myCell.trailingAnchor, constant: -5)
        ])
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        myCell.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "TrebuchetMS-Bold", size: 30)
        titleLabel.text = cellName
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bgImgView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: myCell.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: myCell.trailingAnchor)
        ])
        titleLabel.sizeToFit()
        
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}
