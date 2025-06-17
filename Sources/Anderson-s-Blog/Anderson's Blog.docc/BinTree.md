
## 结构

```swift
indirect enum BinTree<T: CustomStringConvertible>: CustomStringConvertible {
    case empty
    case node(value: T, left: BinTree<T>, right: BinTree<T>)
    
    var description: String {
        ""
    }
}
```

