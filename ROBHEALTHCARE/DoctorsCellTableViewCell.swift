//
//  DoctorsCellTableViewCell.swift
//  ROBHEALTHCARE
//
//  Created by bilal on 14/05/2025.
//

import UIKit

class DoctorsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    

        
    
    func configure(with doctor: Doctor) {
            nameLabel.text = doctor.name
            specialityLabel.text = doctor.specialty
            locationLabel.text = doctor.clinic
            doctorImageView.image = UIImage(named: doctor.imageName)
            
        }
    
}
