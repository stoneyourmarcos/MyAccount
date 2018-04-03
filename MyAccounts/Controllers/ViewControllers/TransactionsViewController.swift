import UIKit

class TransactionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!

    var stateController: StateController!
    var account: Account!
    fileprivate var dataSource: TransactionDataSource!
    
    override func viewDidLoad() {
        self.viewDidLoad()
        numberLabel.text = account.number.accountNumberFormatting
        navigationItem.title = account.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        totalLabel.text = account.total.dollarsFormatting
        dataSource = TransactionDataSource(transactions: account.transactions)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

    @IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}
}

