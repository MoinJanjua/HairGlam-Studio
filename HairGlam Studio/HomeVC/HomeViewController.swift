//
//  HomeViewController.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 30/09/2024.
//

import UIKit
import FSPagerView
class HomeViewController: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource, UITableViewDelegate, UITableViewDataSource   {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var Beardbtn: UIButton!
    
    @IBOutlet weak var HairCuttingbtn: UIButton!
    
    @IBOutlet weak var Addrecordbtn: UIButton!
    
    var itemname = ["Hair Cut","Beard Cut","Mustache Style","Historical Hair Style","Trending Hair Style","Fade Hair Style"]
    var isFromHome = String()
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(CustomPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        roundCorner(button: Addrecordbtn)
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
        pagerView.dataSource = self
        pagerView.delegate = self
        
        pagerView.transformer = FSPagerViewTransformer(type: .invertedFerrisWheel)
        
        pagerView.itemSize = CGSize(width: 200, height: 200)
        
        pagerView.automaticSlidingInterval = 1.0
        // Do any additional setup after loading the view.
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        
        return pagination1.count
    }
    
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index) as! CustomPagerViewCell

        
        cell.imageView?.image = UIImage(named: pagination1[index])
        cell.textLabel?.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        let nam = itemname[indexPath.row]
        cell.label.text = nam
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
            newViewController.isFrom = "Hair Cut"
            newViewController.names = HaircutCategory
            newViewController.imagelist = hairimages
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        
        else if indexPath.row == 1
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            newViewController.record = "Beard Cut"
            
                newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
        }
        
        else if indexPath.row == 2
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            newViewController.record = "Mustache Style"
            
                newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
        }
        else if indexPath.row == 3
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            newViewController.record = "Historical Hair  Style"
            //newViewController.hairstname = historicalstyle

                newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
        }
        else if indexPath.row == 4
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            newViewController.record = "Trending Hair Style"
            
                newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
        }
        else if indexPath.row == 5
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            newViewController.record = "Fade Hair Style"
            
                newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

   // @IBAction func HairCuttingbtn(_ sender: UIButton) {
      //  let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       // let newViewController = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
       // newViewController.names = HaircutCategory
       // newViewController.isFrom = "Hair Cut"
       // newViewController.imagelist = hairimages
      //  newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
       // newViewController.modalTransitionStyle = .crossDissolve
        //self.present(newViewController, animated: true, completion: nil)
   // }
    
    @IBAction func Settingbtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func Addrecord(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CreateRecordViewController") as! CreateRecordViewController
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func Historybtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }
    
}
