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
        
        // 画像の名前の配列
        let imageNameArray = ["test1", "test2", "test3"]

        // 表示している画像の番号を元に画像を表示する
        func displayImage() {
            
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[displayImageNo]
            
            // 画像を読み込み
            let image = UIImage(named: name)
            
            // Image Viewに読み込んだ画像をセット
            imageView.image = image
            
        }
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
            // 表示している画像の番号を1減らす
            displayImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }  else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    
    var timer: Timer!
    
    
    @IBAction func switchButtonTap(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、
                if self.timer == nil {
                    // タイマーを設定
                    self.timer = Timer.scheduledTimer(timeInterval: 2.0,
                   target: self, selector:
                        #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                    nextButton.isEnabled = false
                    backButton.isEnabled = false

                } else if self.timer != nil {
                    // タイマーを停止
                    self.timer.invalidate()
                    // nil にして再び再生(nil の時にタイマー生成)
                    self.timer = nil
                    nextButton.isEnabled = true
                    backButton.isEnabled = true
                }
    }
    
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        }
    }
    
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerのインスタンスを取得する
            let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[displayImageNo]
            // 画像を読み込み
            let image = UIImage(named: name)
            
            zoomViewController.selectedImg = image
        }
    
    
}

