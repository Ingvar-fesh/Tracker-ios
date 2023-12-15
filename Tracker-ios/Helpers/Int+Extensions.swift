import Foundation

extension Int {
    func days() -> String {
        var ending: String!
        if "1".contains("\(self % 10)")      { ending = NSLocalizedString("day", comment: "Text displayed on empty state")  }
        if "234".contains("\(self % 10)")    { ending = NSLocalizedString("days", comment: "Text displayed on empty state")  }
        if "567890".contains("\(self % 10)") { ending = NSLocalizedString("days", comment: "Text displayed on empty state") }
        if 11...14 ~= self % 100             { ending = NSLocalizedString("days", comment: "Text displayed on empty state") }
        return "\(self) " + ending
    }
}
