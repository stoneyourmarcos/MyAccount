import Foundation
import UIKit

enum TransactionCategory: String {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

struct Transaction {
    let description: String
    let date: Date
    let amount: Float
    let category: TransactionCategory
}

extension Transaction {
    var plistRepresentation: [String: AnyObject] {
        return [
            "description": description as AnyObject,
            "date": date as AnyObject,
            "amount": amount as AnyObject,
            "category": category.rawValue as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        amount = plist["amount"] as! Float
        description = plist["description"] as! String
        date = plist["date"] as! Date
        category = TransactionCategory(rawValue: plist["category"] as! String)!
    }
}

extension TransactionCategory {
    struct Appearance {
        let color: UIColor
        let image: UIImage
    }
    
    var appearance: Appearance {
        switch self {
        case .income:
            return Appearance(color: .lightGrassGreen,
                                        image: UIImage(imageLiteralResourceName: "income"))
        case .groceries:
            return Appearance(color: .seafoamBlue,
                                           image: UIImage(imageLiteralResourceName: "groceries"))
        case .utilities:
            return Appearance(color: .liliac,
                                           image: UIImage(imageLiteralResourceName: "utilities"))
        case .home:
            return Appearance(color: .sunflowerYellow,
                                      image: UIImage(imageLiteralResourceName: "home"))
        case .transport:
            return Appearance(color: .peach,
                                           image: UIImage(imageLiteralResourceName: "transport"))
        case .fun:
            return Appearance(color: .carnation,
                                     image: UIImage(imageLiteralResourceName: "fun"))
        }
    }
}
