
import UIKit

class AllCategoriesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["All", "General", "Cardiologist", "Dentist", "Neurology", "Pediatrics"]
    var selectedCategory: String = "All"
    
   
    
    let allDoctors = [
            Doctor(name: "Dr. David Patel", specialty: "Cardiologist", clinic: "Heart Care Center", imageName: "doctor1"),
            Doctor(name: "Dr. Jessica Turner", specialty: "Gynecologist", clinic: "Women's Clinic", imageName: "doctor2"),
            Doctor(name: "Dr. Emily Walker", specialty: "Pediatrics", clinic: "Serenity Pediatrics Clinic", imageName: "doctor3"),
            Doctor(name: "Dr. Michael Johnson", specialty: "Orthopedic Surgery", clinic: "Maple Associates", imageName: "doctor4")
        ]
    var filteredDoctors = [Doctor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let nib = UINib(nibName: "AllCategoriesCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "AllCategoriesCell")
        
        // Set delegates
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Set layout (horizontal scroll)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 100, height: 44)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            flowLayout.minimumInteritemSpacing = 8
        }
        let nibb = UINib(nibName: "DoctorsCellTableViewCell", bundle: nil)
            tableView.register(nibb, forCellReuseIdentifier: "DoctorsCellTableViewCell")
            
            // Set delegates
            tableView.dataSource = self
            tableView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllCategoriesCell", for: indexPath) as! AllCategoriesCell
        let category = categories[indexPath.row]
        
        cell.CategoryLabel.text = category
        cell.isSelected = (category == selectedCategory)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        collectionView.reloadData()
        
        print("Selected category: $selectedCategory)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredDoctors.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorsCellTableViewCell", for: indexPath) as! DoctorsCellTableViewCell

            let doctor = filteredDoctors[indexPath.row]
            cell.configure(with: doctor)

            return cell
        }
    
    private func filterDoctors() {
           if selectedCategory == "All" {
               filteredDoctors = allDoctors
           } else {
               filteredDoctors = allDoctors.filter { $0.specialty == selectedCategory }
           }
        tableView.reloadData()
       }
   
}



