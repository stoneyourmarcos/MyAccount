import Foundation

struct Account {
    let name: String
    let bank: String
    let number: String
    let transactions: [Transaction]
    var total: Float {
        return transactions.reduce(0.0, { $0 + $1.amount * ($1.category == .income ? 1 : -1)})
    }
}

extension Account {
    var plistRepresentation: [String: AnyObject] {
        return [
            "name": name as AnyObject,
            "bank": bank as AnyObject,
            "number": number as AnyObject,
            "transactions": transactions.map { $0.plistRepresentation } as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        name = plist["name"] as! String
        bank = plist["bank"] as! String
        number = plist["number"] as! String
        transactions = (plist["transacations"] as! [[String: AnyObject]]).map(Transaction.init(plist:))
    }
}
