import UIKit

class TransactionDataSource: NSObject {
    let transactions: [Transaction]
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
}

extension TransactionDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        let transaction = transactions[indexPath.row]
        cell.model = TransactionCell.Model(transaction: transaction)
        return cell
    }
    
    
}
