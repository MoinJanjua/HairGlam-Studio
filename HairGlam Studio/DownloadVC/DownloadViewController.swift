//
//  DownloadViewController.swift
//  HairGlam Studio
//
//  Created by Farrukh UCF on 03/10/2024.
//

import UIKit
import Photos
class DownloadViewController: UIViewController {

    @IBOutlet weak var Downloadimg: UIImageView!
    @IBOutlet weak var titlelb: UILabel!
    @IBOutlet weak var Shareimagebtn: UIButton!
    
    var titlestr = String()
    var selectedimage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        titlelb.text = titlestr
        DispatchQueue.main.async {
            self.Downloadimg.image = self.selectedimage
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func Downloadbtn(_ sender: UIButton) {
        // Check for permission to access photo library
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                self.saveImageToPhotoLibrary()
            } else {
                // Handle denied access (e.g., show alert to user)
                DispatchQueue.main.async {
                    self.showAccessDeniedAlert()
                }
            }
        }
    }

    private func saveImageToPhotoLibrary() {
        // Access the image on the main thread
        DispatchQueue.main.async {
            guard let imageToSave = self.Downloadimg.image else { return }
            
            UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(self.imageSavedToPhotosAlbum(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    @objc func imageSavedToPhotosAlbum(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // We got back an error!
            print("Error saving image: \(error.localizedDescription)")
        } else {
            // Image saved successfully
            print("Image saved successfully to Photo Library")
            DispatchQueue.main.async {
                self.showSaveSuccessAlert()
            }
        }
    }
    
    private func showSaveSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "Image saved to Photo Library.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    private func showAccessDeniedAlert() {
        let alert = UIAlertController(title: "Access Denied", message: "Please allow access to Photos in Settings.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    @IBAction func Shareimagebtn(_ sender: UIButton) {
        guard let imageToShare = Downloadimg.image else { return }
            
            // Create an array with the image to be shared
            let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
            
            // Exclude certain activity types if needed (optional)
            activityViewController.excludedActivityTypes = [
                .assignToContact,
                .addToReadingList,
                .print
            ]
            
            // For iPads: Set the sourceView to avoid crashes on iPads
            activityViewController.popoverPresentationController?.sourceView = self.view

            // Present the activity view controller
            present(activityViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func Backbtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
