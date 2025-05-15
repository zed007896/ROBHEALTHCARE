//
//  AllCategoriesCell.swift
//  ROBHEALTHCARE
//
//  Created by bilal on 14/05/2025.
//

import UIKit

class AllCategoriesCell: UICollectionViewCell {

    @IBOutlet weak var CategoryLabel: UILabel!
    
    override var isSelected: Bool {
           didSet {
               backgroundColor = isSelected ? .systemBlue : .systemGray6
               CategoryLabel.textColor = isSelected ? .white : .black
           }
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
                clipsToBounds = true
    }

}
