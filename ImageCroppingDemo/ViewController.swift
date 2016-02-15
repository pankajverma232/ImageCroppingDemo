//
//  ViewController.swift
//  ImageCroppingDemo
//
//  Created by Pankaj Verma on 15/02/16.
//  Copyright © 2016 Pankaj Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var recognizer: UIPanGestureRecognizer!
    @IBOutlet weak var cropArea: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animateWithDuration(0.3) { () -> Void in
             self.cropArea.frame = CGRectMake(20, 0, 200, 200)
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case UIGestureRecognizerState.Changed :
            let translations = recognizer.translationInView(self.view)
            
            // translation only vertically
            recognizer.view?.center = CGPointMake((recognizer.view?.center.x)!, (recognizer.view?.center.y)! + translations.y)
            recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
            
            // handle if crop area reaches to top or bottom
            let startY = CGRectGetMinY(cropArea.frame)
            let endY = CGRectGetMaxY(cropArea.frame)
            if startY <= 21 {
            cropArea.frame.origin.y = 21
            }
            if endY >= self.view.frame.size.height {
                cropArea.frame.origin.y = self.view.frame.size.height - cropArea.frame.height
            }
            break
            
            
        default : print("")
        }
        
    }
  
    @IBAction func cropImage(sender: UIButton) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.cropArea.frame = CGRectMake(20, 0, 200, 200)
        }

            self.cropNow()
        
    }
    
    func cropNow(){
        let newY = CGRectGetMinY(self.cropArea.frame)
        let cropedRect = CGRectMake(0, newY, self.cropArea.frame.width, 200)
        print("newY = ",newY)
        // to convert uiimage to cgimage first it need to be converted to ciimage
        let ciimg = CIImage(image: self.imageView.image!)
        let cgimg = CIContext(options: nil).createCGImage(ciimg!, fromRect: cropedRect) as CGImage
        
        let image = UIImage(CGImage: cgimg) as UIImage
        
        
        let croppedImageData = UIImageJPEGRepresentation(image, 0.7)
        let imageData = UIImageJPEGRepresentation(self.imageView.image!, 0.7)
        
        print("original image size ",imageData!.length)
        print("original image size ",croppedImageData!.length)
        
        let civc = CroppedImageViewController()
        civc.myImage = UIImage(data: croppedImageData!)
        
       self.navigationController?.pushViewController(civc, animated: true)

    }
    
}

