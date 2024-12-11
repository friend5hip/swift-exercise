//
//  ViewController.swift
//  ImageAndSwitch
//
//  Created by 전우정 on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    let imageOff: UIImage? = UIImage(named: "lamp_off.png")
    let imageOn: UIImage? = UIImage(named: "lamp_on.png")
    
    var zoom = false

    @IBOutlet weak var imageViewLamp: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewLamp.image = imageOff
    }
    
    
    @IBAction func buttonZoom(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var width = imageViewLamp.frame.width
        var height = imageViewLamp.frame.height
        if !zoom {
            width *= scale
            height *= scale
            sender.setTitle("축소", for: .normal)
        } else {
            width /= scale
            height /= scale
            sender.setTitle("확대", for: .normal)
        }
        imageViewLamp.frame.size = CGSize(width: width, height: height)
        zoom = !zoom
    }
    
    
    @IBAction func switchLamp(_ sender: UISwitch) {
        if sender.isOn {
            imageViewLamp.image = imageOn
        } else {
            imageViewLamp.image = imageOff
        }
    }
}

