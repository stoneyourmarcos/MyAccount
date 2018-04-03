import UIKit

class TransactionCell: UITableViewCell {
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            circleView.backgroundColor = model.categoryColor
            categoryImageView.image = model.categoryImage
            descriptionLabel.text = model.description
            dateLabel.text = model.date
            amountLabel.text = model.amount
            amountLabel.textColor = model.amountColor
        }
    }
}

extension TransactionCell {
    struct Model {
        let categoryColor: UIColor
        let categoryImage: UIImage
        let description: String
        let date: String
        let amount: String
        let amountColor: UIColor
        
        init (transaction: Transaction) {
            categoryColor = transaction.category.appearance.color
            categoryImage = transaction.category.appearance.image
            description = transaction.description
            date = transaction.date.transactionFormtting
            amount = transaction.amount.dollarsFormatting
            amountColor = transaction.category == .income ? .darkLimeGreen : .slate
        }
    }
}
