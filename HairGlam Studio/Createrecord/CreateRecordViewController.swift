//
//  CreateRecordViewController.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 07/10/2024.
//

import UIKit

class CreateRecordViewController: UIViewController {

    @IBOutlet weak var Namelb: UILabel!
    @IBOutlet weak var NametextF: UITextField!
    @IBOutlet weak var Datelb: UILabel!
    @IBOutlet weak var Datepicker: UIDatePicker!
    
    var profiles: [Profiles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
              // Load existing profiles
        // Do any additional setup after loading the view.
    }
    
    func SaveUserData(_ sender: Any) {
        guard let Name = NametextF.text, !Name.isEmpty
             
              else {
            showAlert(title: "Alert", message: "Please fill in all fields")
            return
        }
        
        // Get the Date from the UIDatePicker
        let date = Datepicker.date
        
        // Now create the UserData with the Date
        let UserData = Profiles(
            name: Name,
            date: date // Use the Date from UIDatePicker
           
        )
        
        saveMedication(UserData)
    }
    
    func saveMedication(_ medication: Profiles) {
        var medications = UserDefaults.standard.object(forKey: "profile") as? [Data] ?? []
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(medication)
            medications.append(data)
            UserDefaults.standard.set(medications, forKey: "profile")
        
        } catch {
            print("Error encoding medication: \(error.localizedDescription)")
        }
        showAlert(title: "Done", message: "Profile Create successfully.")
    }
    @IBAction func Backbtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func Savebtn(_ sender: UIButton) {
        SaveUserData(sender)
    }
}
