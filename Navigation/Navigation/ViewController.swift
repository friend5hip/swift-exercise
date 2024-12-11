//
//  ViewController.swift
//  Navigation
//
//  Created by 전우정 on 12/10/24.
//

import UIKit

//class ViewController: UIViewController, ReplyDelgate {
class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var reply = "답장 내용"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = reply
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let replyViewController = segue.destination as! ReplyViewController
        if segue.identifier == "ReplyVC" {
            replyViewController.message = textField.text!
        }
        replyViewController.onReply = { replyMessage in
            self.reply = replyMessage
        }
//        replyViewController.delegate = self
    }
    
//    func reply(_controller: ReplyViewController, message: String) {
//        label.text = message
//    }
}

