//
//  CategoriesViewController.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 30/09/2024.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 

    @IBOutlet weak var Titlelbl: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
   
    
    var isFrom = String()
   var names = [String]()
    var imagelist = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        Titlelbl.text = isFrom
        
        if isFrom == "HairCut"
        {
            imagelist = hairimages
        }
        
       
        // Do any additional setup after loading the view.
    }
    @IBAction func Backbtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCollectionViewCell
        cell.Namelbl.text = names[indexPath.row]
        cell.Image.image = UIImage(named: imagelist[indexPath.item] )
//        cell.Namelbl.text = isFromName
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.clipsToBounds = true
        roundCorneView(image: cell.Image)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let spacing: CGFloat = 10
        let availableWidth = collectionViewWidth - (spacing * 3)
        let width = availableWidth / 2
        return CGSize(width: width - 20, height: 130)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    
    
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            newViewController.record = names[indexPath.row]
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Adjust as needed
    }
}
