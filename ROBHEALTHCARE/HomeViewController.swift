//
//  HomeViewController.swift
//  ROBHEALTHCARE
//
//  Created by bilal on 12/05/2025.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    

  
   
    
    
  
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    
    @IBOutlet weak var MedicalCenterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad started")
           
           configureSearchBar()
           
           
           if categoriesCollectionView != nil {
               
               categoriesCollectionView.dataSource = self
               categoriesCollectionView.delegate = self
               
               let nib = UINib(nibName: "CategoryCell", bundle: nil)
               categoriesCollectionView.register(nib, forCellWithReuseIdentifier: "CategoryCell")
           } else {
               print("ERROR: categoriesCollectionView is nil")
           }
        
        if MedicalCenterCollectionView != nil {
            MedicalCenterCollectionView.dataSource = self
            MedicalCenterCollectionView.delegate = self
            
            let medicalCenterNib = UINib(nibName: "MedicalCenterVC", bundle: nil)
            MedicalCenterCollectionView.register(medicalCenterNib, forCellWithReuseIdentifier: "MedicalCenterCell")
           
            if let layout = MedicalCenterCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
                layout.itemSize = CGSize(width: 140, height: 180)
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            }
        }
        
    }
    
    
    @IBAction func seeAllTapped(_ sender: Any) {
        
        
            let allCategoriesVC = AllCategoriesVC(nibName: "AllCategoriesVC", bundle: nil)
            navigationController?.pushViewController(allCategoriesVC, animated: true)
        
        
    }
    
    private func configureSearchBar() {
  
        SearchBar?.placeholder = "Search Doctor"
        
    
        if let textField = SearchBar?.subviews.first(where: { $0 is UITextField }) as? UITextField {
            textField.textColor = .gray
            textField.borderStyle = .roundedRect
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return 6 // Categories
        } else {
            return 2 // Nearby Medical Centers
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
            let categories = [
                ("tooth", "Dentistry"),
                ("carr", "Cardiology"),
                ("polmonologyy", "Pulmonology"),
                ("neourologyy", "Neurology"),
                ("vaxxination", "Vaccination"),
                ("labbyy", "Laboratory")
            ]
            
            let (icon, name) = categories[indexPath.row]
            cell.categoryImageView.image = UIImage(named: icon)
            cell.categorynameLabel.text = name
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MedicalCenterCell", for: indexPath) as! MedicalCenterVC
            
            let centers = [
                ("clinic", "Seattle Center"),
                ("clinicc", "Bellevue Clinic")
                
                
            ]
            let (image, name) = centers[indexPath.row]
            cell.CenterImage.image = UIImage(named: image)
            cell.LabelCenter.text = name
            
            
            return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 // default
    }
    
}
