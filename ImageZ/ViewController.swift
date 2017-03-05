//
//  ViewController.swift
//  ImageZ
//
//  Created by Ethan on 2017-03-02.
//  Copyright © 2017 Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var filterdImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!

//    @IBOutlet weak var imageToggle: UIButton!
//    @IBAction func onImageToggle(_ sender: UIButton) {
//        if(!imageToggle.isSelected){
//            imageView.image = filterdImage
//            imageToggle.isSelected = true
//        }
//        else{
//            imageView.image = UIImage(named: "owl.jpg")
//            imageToggle.isSelected = false
//        }
//    }
    
    @IBOutlet var secondaryMenu: UIView!
    
    @IBOutlet weak var bottomMenu: UIView!
    
    @IBOutlet weak var newPhoto: UIButton!
    
    @IBOutlet weak var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        secondaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
//        imageToggle.setTitle("Show Original Photo", for: .selected)
//        
//        let myImage = UIImage(named: "owl.jpg")!
//        
//        let rgbaImage = RGBAImage(image: myImage)!
//        
////        let pixelCount = rgbaImage.width * rgbaImage.height
//        let avgRed = 125
////        let avgGreen = 118
////        let avgBlue = 86
////        let sum = avgRed + avgGreen + avgBlue
//        
//        for y in 0..<rgbaImage.height {
//            for x in 0..<rgbaImage.width {
//                let index = y * rgbaImage.width + x
//                
//                var pixel = rgbaImage.pixels[index]
//                
//                let redDelta = Int(pixel.red) - avgRed
////                let greenDelta = Int(pixel.green) - avgGreen
////                let blueDelta = Int(pixel.blue) - avgBlue
//                
//                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
//                if(Int(pixel.red) < avgRed) {
//                    modifier = 1
//                }
//                
//                pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) +
//                            modifier * Double(redDelta)))), 0))
//                rgbaImage.pixels[index] = pixel
//            }
//        }
//        filterdImage = rgbaImage.toUIImage()
//        
//        print("This code has executed.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNewPhoto(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {action in self.showCamera()}))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: {action in self.showAlbum()}))

        actionSheet.addAction(UIAlertAction(title: "Cancel ", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)

    }
    
    func showCamera() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum() {
        
    }
    
    @IBAction func onFilter(_ sender: UIButton) {
        if(sender.isSelected){
            hideSecondaryMenu()
            sender.isSelected = false
        }
        else {
            showSecondaryMenu()
            sender.isSelected = true
        }
        
        
    }
    
    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {self.secondaryMenu.alpha = 1.0})
    }
    
    func hideSecondaryMenu() {
        UIView.animate(withDuration: 0.4, animations: {self.secondaryMenu.alpha = 0}, completion: {
            completed in
            if(completed){
                self.secondaryMenu.removeFromSuperview()
            }
        })
    }
}

