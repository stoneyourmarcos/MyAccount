import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bankTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    var stateController: StateController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveAccountSegue"else {
            return
        }
        let account = Account(name: nameTextField.text ?? "",
                              bank: bankTextField.text ?? "",
                              number: numberTextField.text ?? "",
                              transactions: [])
        stateController.add(account)
    }
}

