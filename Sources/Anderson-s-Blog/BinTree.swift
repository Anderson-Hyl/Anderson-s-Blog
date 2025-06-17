import Foundation

indirect enum BinTree<T: CustomStringConvertible>: CustomStringConvertible {
    case empty
    case node(value: T, left: BinTree<T>, right: BinTree<T>)
    
    var description: String {
        ""
    }
}

extension Array where Element: Comparable & CustomStringConvertible {
    func toTree() -> BinTree<Element> {
        guard !self.isEmpty else {
            return .empty
        }
        let head = self.first
        let tail = self.dropFirst()
        
    }
}
