//
//  HotelreViewController.swift
//  FoodPin
//
//  Created by Apple on 2021/1/13.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import UIKit

class HotelreViewController: UIViewController {
    
    
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var rateButtons: [UIButton]!
    
    var hotel = Hotel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: hotel.image)
        
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Make the button invisible
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0
        )
        
        for rateButton in rateButtons {
            rateButton.transform = moveRightTransform
            rateButton.alpha = 0
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //with delay
        for index in 0...4 {
            UIView.animate(withDuration: 1.0, delay: 0.1+0.05*Double(index), options: [], animations:
                            {
                                self.rateButtons[index].alpha = 1.0
                                self.rateButtons[index].transform = .identity
                            }, completion: nil)
        }
    }
    
}
