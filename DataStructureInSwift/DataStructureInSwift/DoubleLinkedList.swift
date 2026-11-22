import Foundation

class DoubleNode<T> {
    var value: T
    var next: DoubleNode<T>?
    var prev: DoubleNode<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
        self.prev = nil
    }
}

class DoubleLinkedList<T> {
    private var head: DoubleNode<T>?
    private var tail: DoubleNode<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        return count
    }
    
    func append(_ value: T) {
        let newNode = DoubleNode(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
        count += 1
    }
    
    func prepend(_ value: T) {
        let newNode = DoubleNode(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head?.prev = newNode
            head = newNode
        }
        count += 1
    }
    
    func insert(_ value: T, at index: Int) {
        guard index >= 0 && index <= count else {
            return
        }
        
        if index == 0 {
            prepend(value)
            return
        }
        
        if index == count {
            append(value)
            return
        }
        
        let newNode = DoubleNode(value: value)
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        newNode.next = currentNode
        newNode.prev = currentNode?.prev
        currentNode?.prev?.next = newNode
        currentNode?.prev = newNode
        count += 1
    }
    
    func remove(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        guard let node = currentNode else {
            return nil
        }
        
        let value = node.value
        
        if node === head {
            head = node.next
            head?.prev = nil
        } else if node === tail {
            tail = node.prev
            tail?.next = nil
        } else {
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
        
        count -= 1
        return value
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func getNode(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        var currentNode: DoubleNode<T>?
        var currentIndex: Int
        
        if index < count / 2 {
            currentNode = head
            currentIndex = 0
            
            while currentNode != nil && currentIndex < index {
                currentNode = currentNode?.next
                currentIndex += 1
            }
        } else {
            currentNode = tail
            currentIndex = count - 1
            
            while currentNode != nil && currentIndex > index {
                currentNode = currentNode?.prev
                currentIndex -= 1
            }
        }
        
        return currentNode?.value
    }
    
    subscript(index: Int) -> T? {
        return getNode(at: index)
    }
    
    func contains(where predicate: (T) -> Bool) -> Bool {
        var currentNode = head
        
        while currentNode != nil {
            if predicate(currentNode!.value) {
                return true
            }
            currentNode = currentNode?.next
        }
        
        return false
    }
    
    func forEach(_ body: (T) -> Void) {
        var currentNode = head
        
        while currentNode != nil {
            body(currentNode!.value)
            currentNode = currentNode?.next
        }
    }
    
    func forEachReverse(_ body: (T) -> Void) {
        var currentNode = tail
        
        while currentNode != nil {
            body(currentNode!.value)
            currentNode = currentNode?.prev
        }
    }
    
    func toArray() -> [T] {
        var array: [T] = []
        forEach { array.append($0) }
        return array
    }
    
    func toArrayReverse() -> [T] {
        var array: [T] = []
        forEachReverse { array.append($0) }
        return array
    }
    
    func reverse() {
        guard count > 1 else { return }
        
        var currentNode = head
        
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = currentNode?.prev
            currentNode?.prev = nextNode
            currentNode = nextNode
        }
        
        let temp = head
        head = tail
        tail = temp
    }
}

extension DoubleLinkedList: CustomStringConvertible {
    var description: String {
        let items = toArray().map { String(describing: $0) }
        return "[" + items.joined(separator: ", ") + "]"
    }
}
