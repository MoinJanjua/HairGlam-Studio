import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var Tv: UITableView!
    
    var profiles: [Profiles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tv.delegate = self
        Tv.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let savedData = UserDefaults.standard.array(forKey: "profile") as? [Data] {
            let decoder = JSONDecoder()
            profiles = savedData.compactMap { data in
                do {
                    let profiles = try decoder.decode(Profiles.self, from: data)
                    return profiles
                } catch {
                    print("Error decoding profile: \(error.localizedDescription)")
                    return nil
                }
            }
        }
        Tv.reloadData()
    }

    @IBAction func Backbtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        let profile = profiles[indexPath.row]
        cell.Titlelbl.text = profile.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        cell.Datelbl.text = dateFormatter.string(from: profile.date)
        return cell
    }

    // MARK: - UITableViewDelegate Method for Swipe to Delete
    // This method enables the swipe-to-delete action
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    // This method gets called when the user taps the delete button
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the profile from the array
            profiles.remove(at: indexPath.row)
            
            // Save the updated profiles array to UserDefaults
            let encoder = JSONEncoder()
            let savedData = profiles.compactMap { try? encoder.encode($0) }
            UserDefaults.standard.set(savedData, forKey: "profile")
            
            // Reload the table view
            Tv.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
