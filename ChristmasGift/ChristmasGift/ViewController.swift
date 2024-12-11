import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var receiver: UITextField!
    @IBOutlet weak var textFieldMessage: UITextField!
    @IBOutlet weak var imageViewGift: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickLego(_ sender: UIButton) {
        imageViewGift.image = UIImage(named: "lego")
    }
    
    @IBAction func clickCar(_ sender: UIButton) {
        imageViewGift.image = UIImage(named: "elantra")
    }
    
    @IBAction func clickRandom(_ sender: UIButton) {
        imageViewGift.image = UIImage(named: "gift")
    }
    
    @IBAction func buttonOK(_ sender: UIButton) {
        let selectedDate = datePicker.date
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let formattedDate = formatter.string(from: selectedDate)
        
        let alertController = UIAlertController(title: "\(receiver.text!)", message: "\(textFieldMessage.text!)\n배송 날짜: \(formattedDate)", preferredStyle: .alert)
        
        // OK 버튼 추가
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        
        // Cancel 버튼 추가
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
