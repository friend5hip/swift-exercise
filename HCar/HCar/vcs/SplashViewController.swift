//
//  SplashViewController.swift
//  HCar
//
//  Created by 전우정 on 12/17/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 2초 후에 메인 화면으로 전환
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showMainScreen()
        }
    }
    
    private func showMainScreen() {
        if let mainVC = storyboard?.instantiateViewController(withIdentifier: "main TabBarController") {
            mainVC.modalTransitionStyle = .crossDissolve // 부드러운 전환 효과
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true, completion: nil)
        }
    }

}
