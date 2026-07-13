import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        return count
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    func prepend(_ value: T) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
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
        
        let newNode = Node(value: value)
        var currentNode = head
        var previousNode: Node<T>?
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            previousNode = currentNode
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        newNode.next = currentNode
        previousNode?.next = newNode
        count += 1
    }
    
    func remove(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        if index == 0 {
            let value = head?.value
            head = head?.next
            if count == 1 {
                tail = nil
            }
            count -= 1
            return value
        }
        
        var currentNode = head
        var previousNode: Node<T>?
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            previousNode = currentNode
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        let value = currentNode?.value
        previousNode?.next = currentNode?.next
        
        if index == count - 1 {
            tail = previousNode
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
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
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
    
    func toArray() -> [T] {
        var array: [T] = []
        forEach { array.append($0) }
        return array
    }
    
    func reverse() {
        guard count > 1 else { return }
        
        var prev: Node<T>? = nil
        var current = head
        tail = head
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        let items = toArray().map { String(describing: $0) }
        return "[" + items.joined(separator: ", ") + "]"
    }
}
