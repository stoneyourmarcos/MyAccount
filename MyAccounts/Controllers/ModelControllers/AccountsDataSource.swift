import UIKit

class AccountsDataSource: NSObject {
    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsCell", for: indexPath) as! AccountCell
        let index = indexPath.row
        let account = accounts[index]
        cell.model = AccountCell.Model(account: account, index: index)
        return cell
    }
}
