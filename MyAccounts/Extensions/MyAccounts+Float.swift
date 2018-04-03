import Foundation

extension Float {
    var dollarsFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: self))!
    }
}
