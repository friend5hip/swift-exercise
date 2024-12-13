//
//  ViewController.swift
//  BMIRecoder
//
//  Created by 전우정 on 12/11/24.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func didUpdateBMI(receivedData: (String, String, String, String, String))
}

class AddViewController: UIViewController {
    
    @IBOutlet weak var textFieldHeight: UITextField!
    @IBOutlet weak var textFieldWeight: UITextField!
    
    // (날짜, 키, 몸무게, BMI, 상태)
    var data: (String, String, String, String, String) = ("", "", "", "", "")
    
    weak var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonOK(_ sender: UIBarButtonItem) {
        guard let heightText = textFieldHeight.text, let height = Double(heightText), let weightText = textFieldWeight.text, let weight = Double(weightText) else {
            showAlert(message: "올바른 키와 몸무게를 입력해주세요.")
            return
        }
        
        // 날짜 형식 지정 및 현재 날짜와 시각 설정
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDateString = dateFormatter.string(from: Date())
        
        let bmi = calculateBMI(height: height, weight: weight)
        
        // 튜플에 넣어 전달
        data.0 = currentDateString
        data.1 = heightText
        data.2 = weightText
        data.3 = String(format: "%.2f", bmi)
        
        // BMI에 따른 상태 분류
        let status: String
        switch bmi {
        case ..<18.5: status = "저체중"
        case 18.5..<24.9: status = "정상"
        case 25..<29.9: status = "과체중"
        default: status = "비만"
        }
        
        data.4 = status
        
        // 델리게이트 패턴으로 첫 번째 뷰로 데이터 전달
        delegate?.didUpdateBMI(receivedData: data)
        
        // 뒤로 가기 (pop)
        navigationController?.popViewController(animated: true)
        
    }
    
    func calculateBMI(height: Double, weight: Double) -> Double {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}

