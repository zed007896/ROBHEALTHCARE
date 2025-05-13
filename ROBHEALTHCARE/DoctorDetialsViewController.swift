//
//  DoctorDetialsViewController.swift
//  ROBHEALTHCARE
//
//  Created by User on 5/12/25.
//

import UIKit

class DoctorDetialsViewController: UIViewController {


    
    @IBOutlet weak var heartbutton2: UIButton!{
        didSet{
            heartbutton2.setImage(UIImage(systemName: "heart"), for: .normal)
            heartbutton2.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


 

  
    //
//    @IBAction func bookappointmentPressed(_ sender: Any) {
//        //bs t5lys reem bhot el vc la a3mol push
//
//    }
    
    @IBAction func heartbutton2pressed(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    
}

