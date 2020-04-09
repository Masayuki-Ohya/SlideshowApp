//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 大矢政行 on 2020/04/05.
//  Copyright © 2020 masayuki.ohya. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImg: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = selectedImg
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
