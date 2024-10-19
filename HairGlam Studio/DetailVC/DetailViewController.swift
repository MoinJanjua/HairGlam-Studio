//
//  DetailViewController.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 01/10/2024.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
   
    

    @IBOutlet weak var CollectionView: UICollectionView!
    
    var titlestr = String()
    var record = String()
    var hairstname = [String]()
    @IBOutlet weak var Titlelbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        Titlelbl.text = record
        
        if record == "Classic Hair Styles"
        {
            hairstname = classichaircut
        }
        else if record == "Modern Hair Styles"
        {
            hairstname = modernhaircut
        }
        else if record == "Curly Hair Styles"
        {
            hairstname = curlyhairstyle
        }
        else if record == "Straight Hair Styles"
        {
            hairstname = straighthairstyle
        }
        else if record == "Short Hair Styles"
        {
            hairstname = shorthairstyle
        }
        else if record == "Medium-Length Styles"
        {
            hairstname = mediumlengthhairstyle
        }
        else if record == "Braided Hairs tyles"
        {
            hairstname = braidedhairstyle
        }
        else if record == "Updos and Buns"
        {
            hairstname = updowshairstyle
        }
        else if record == "Baby Hair Style"
        {
            hairstname = babieshairstyle
        }
        else if record == "Buzz Hair Style"
        {
            hairstname = buzzhairstyle
        }
        else if record == "Beard Cut"
        {
            hairstname = fullbeardtyle
        }
        else if record == "Mustache Style"
        {
            hairstname = mustachetyle
        }
        else if record == "Historical Hair  Style"
        {
            hairstname = historicalstyle
        }
        else if record == "Trending Hair Style"
        {
            hairstname = trendingstyle
        }
        else if record == "Fade Hair Style"
        {
            hairstname = fadehairstyle
        }
       
        
        
    }
    @IBAction func Backbtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hairstname.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCollectionViewCell
        cell.image.image = UIImage(named: hairstname[indexPath.row] )
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.clipsToBounds = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let image =  UIImage(named: hairstname[indexPath.row])
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "DownloadViewController") as! DownloadViewController
            newViewController.selectedimage = image!
            newViewController.titlestr = record
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let spacing: CGFloat = 10
        let availableWidth = collectionViewWidth - (spacing * 3)
        let width = availableWidth / 2
        return CGSize(width: width - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Adjust as needed
    }

}
