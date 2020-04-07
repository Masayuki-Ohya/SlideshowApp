//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 大矢政行 on 2020/04/01.
//  Copyright © 2020 masayuki.ohya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "test1")
        imageView.image = image
    }
        
        var displayImageNo = 0
        
        
        let imageNameArray = ["test1", "test2", "test3"]

        
        func displayImage() {
            
            
            let name = imageNameArray[displayImageNo]
            
            
            let image = UIImage(named: name)
            
            
            imageView.image = image
            
        }
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            
            displayImageNo += 1
            
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
          
            displayImageNo -= 1
            
            displayImage()
        }  else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    
    var timer: Timer!
    
    
    @IBAction func switchButtonTap(_ sender: Any) {
       
                if self.timer == nil {
                   
                    self.timer = Timer.scheduledTimer(timeInterval: 2.0,
                   target: self, selector:
                        #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                    nextButton.isEnabled = false
                    backButton.isEnabled = false
                    
                   
                    switchButton.setTitle("停止", for: .normal)
                    switchButton.titleLabel?.font =
                    UIFont.systemFont(ofSize: 16)
                    
                } else if self.timer != nil {
                  
                    self.timer.invalidate()
                   
                    self.timer = nil
                    nextButton.isEnabled = true
                    backButton.isEnabled = true
                    
                    
                    switchButton.setTitle("再生", for: .normal)
                    switchButton.titleLabel?.font =
                    UIFont.systemFont(ofSize: 16)
                }
    }
    
    
    @objc func updateTimer(_ timer: Timer) {
        
        if displayImageNo < imageNameArray.count - 1 {
           
            displayImageNo += 1
            
            displayImage()
            print(displayImageNo)
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo)
        }
    }
    
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
            
            let name = imageNameArray[displayImageNo]
            
            let image = UIImage(named: name)
            
        zoomViewController.selectedImg = image
        
        
        }
    
    
}

