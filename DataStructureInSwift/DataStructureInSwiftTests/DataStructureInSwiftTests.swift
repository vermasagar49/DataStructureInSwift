//
//  DataStructureInSwiftTests.swift
//  DataStructureInSwiftTests
//
//  Created by sagar verma on 20/01/26.
//

import Testing
@testable import DataStructureInSwift

struct LinkedListTests {
    
    // MARK: - Initialization Tests
    
    @Test func testEmptyListInitialization() {
        let list: LinkedList<Int> = LinkedList()
        
        #expect(list.isEmpty == true)
        #expect(list.size == 0)
        #expect(list.count == 0)
    }
    
    // MARK: - Append Tests
    
    @Test func testAppendSingleElement() {
        let list: LinkedList<Int> = LinkedList()
        list.append(5)
        
        #expect(list.isEmpty == false)
        #expect(list.size == 1)
        #expect(list[0] == 5)
    }
    
    @Test func testAppendMultipleElements() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list.size == 3)
        #expect(list[0] == 1)
        #expect(list[1] == 2)
        #expect(list[2] == 3)
    }
    
    @Test func testAppendToArray() {
        let list: LinkedList<String> = LinkedList()
        list.append("a")
        list.append("b")
        list.append("c")
        
        let array = list.toArray()
        #expect(array == ["a", "b", "c"])
    }
    
    // MARK: - Prepend Tests
    
    @Test func testPrependSingleElement() {
        let list: LinkedList<Int> = LinkedList()
        list.prepend(5)
        
        #expect(list.size == 1)
        #expect(list[0] == 5)
    }
    
    @Test func testPrependMultipleElements() {
        let list: LinkedList<Int> = LinkedList()
        list.prepend(1)
        list.prepend(2)
        list.prepend(3)
        
        #expect(list.size == 3)
        #expect(list[0] == 3)
        #expect(list[1] == 2)
        #expect(list[2] == 1)
    }
    
    @Test func testPrependAndAppendMixed() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.prepend(0)
        list.append(2)
        
        #expect(list.toArray() == [0, 1, 2])
    }
    
    // MARK: - Insert Tests
    
    @Test func testInsertAtBeginning() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.insert(0, at: 0)
        
        #expect(list.toArray() == [0, 1, 2])
        #expect(list.size == 3)
    }
    
    @Test func testInsertAtEnd() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.insert(3, at: 2)
        
        #expect(list.toArray() == [1, 2, 3])
        #expect(list.size == 3)
    }
    
    @Test func testInsertInMiddle() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(3)
        list.insert(2, at: 1)
        
        #expect(list.toArray() == [1, 2, 3])
    }
    
    @Test func testInsertAtInvalidIndex() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.insert(5, at: 10)
        
        #expect(list.size == 2)
        #expect(list.toArray() == [1, 2])
    }
    
    @Test func testInsertAtNegativeIndex() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.insert(0, at: -1)
        
        #expect(list.size == 1)
        #expect(list[0] == 1)
    }
    
    // MARK: - Remove Tests
    
    @Test func testRemoveAtBeginning() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let removed = list.remove(at: 0)
        
        #expect(removed == 1)
        #expect(list.size == 2)
        #expect(list.toArray() == [2, 3])
    }
    
    @Test func testRemoveAtEnd() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let removed = list.remove(at: 2)
        
        #expect(removed == 3)
        #expect(list.size == 2)
        #expect(list.toArray() == [1, 2])
    }
    
    @Test func testRemoveInMiddle() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let removed = list.remove(at: 1)
        
        #expect(removed == 2)
        #expect(list.size == 2)
        #expect(list.toArray() == [1, 3])
    }
    
    @Test func testRemoveAtInvalidIndex() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        
        let removed = list.remove(at: 5)
        
        #expect(removed == nil)
        #expect(list.size == 1)
    }
    
    @Test func testRemoveFromEmptyList() {
        let list: LinkedList<Int> = LinkedList()
        let removed = list.remove(at: 0)
        
        #expect(removed == nil)
        #expect(list.isEmpty == true)
    }
    
    @Test func testRemoveAllElements() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.removeAll()
        
        #expect(list.isEmpty == true)
        #expect(list.size == 0)
        #expect(list.toArray() == [])
    }
    
    // MARK: - Get Node Tests
    
    @Test func testGetNodeAtValidIndex() {
        let list: LinkedList<Int> = LinkedList()
        list.append(10)
        list.append(20)
        list.append(30)
        
        #expect(list.getNode(at: 0) == 10)
        #expect(list.getNode(at: 1) == 20)
        #expect(list.getNode(at: 2) == 30)
    }
    
    @Test func testGetNodeAtInvalidIndex() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        
        #expect(list.getNode(at: 5) == nil)
        #expect(list.getNode(at: -1) == nil)
    }
    
    @Test func testSubscriptOperator() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list[0] == 1)
        #expect(list[1] == 2)
        #expect(list[2] == 3)
        #expect(list[5] == nil)
    }
    
    // MARK: - Contains Tests
    
    @Test func testContainsExistingElement() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let contains = list.contains { $0 == 2 }
        #expect(contains == true)
    }
    
    @Test func testContainsNonExistingElement() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let contains = list.contains { $0 == 5 }
        #expect(contains == false)
    }
    
    @Test func testContainsWithComplexPredicate() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(4)
        
        let containsEven = list.contains { $0 % 2 == 0 }
        #expect(containsEven == true)
        
        let containsGreaterThan10 = list.contains { $0 > 10 }
        #expect(containsGreaterThan10 == false)
    }
    
    // MARK: - ForEach Tests
    
    @Test func testForEachExecution() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        var sum = 0
        list.forEach { sum += $0 }
        
        #expect(sum == 6)
    }
    
    @Test func testForEachOnEmptyList() {
        let list: LinkedList<Int> = LinkedList()
        var count = 0
        
        list.forEach { _ in count += 1 }
        
        #expect(count == 0)
    }
    
    // MARK: - Reverse Tests
    
    @Test func testReverseList() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.reverse()
        
        #expect(list.toArray() == [3, 2, 1])
    }
    
    @Test func testReverseSingleElement() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        
        list.reverse()
        
        #expect(list.toArray() == [1])
    }
    
    @Test func testReverseEmptyList() {
        let list: LinkedList<Int> = LinkedList()
        list.reverse()
        
        #expect(list.isEmpty == true)
    }
    
    @Test func testReverseMultipleTimes() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.reverse()
        #expect(list.toArray() == [3, 2, 1])
        
        list.reverse()
        #expect(list.toArray() == [1, 2, 3])
    }
    
    // MARK: - String Conversion Tests
    
    @Test func testToArrayConversion() {
        let list: LinkedList<String> = LinkedList()
        list.append("hello")
        list.append("world")
        
        #expect(list.toArray() == ["hello", "world"])
    }
    
    @Test func testToArrayEmpty() {
        let list: LinkedList<Int> = LinkedList()
        #expect(list.toArray() == [])
    }
    
    @Test func testCustomDescription() {
        let list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list.description == "[1, 2, 3]")
    }
    
    // MARK: - Generic Type Tests
    
    @Test func testLinkedListWithStrings() {
        let list: LinkedList<String> = LinkedList()
        list.append("apple")
        list.append("banana")
        list.append("cherry")
        
        #expect(list.size == 3)
        #expect(list[1] == "banana")
    }
    
    @Test func testLinkedListWithDoubles() {
        let list: LinkedList<Double> = LinkedList()
        list.append(1.5)
        list.append(2.5)
        list.append(3.5)
        
        #expect(list.size == 3)
        #expect(list[0] == 1.5)
    }
    
    @Test func testLinkedListWithCustomObjects() {
        struct Person {
            let name: String
            let age: Int
        }
        
        let list: LinkedList<Person> = LinkedList()
        let person1 = Person(name: "Alice", age: 30)
        let person2 = Person(name: "Bob", age: 25)
        
        list.append(person1)
        list.append(person2)
        
        #expect(list.size == 2)
        #expect(list[0]?.name == "Alice")
        #expect(list[1]?.age == 25)
    }
    
    // MARK: - Edge Cases
    
    @Test func testLargeListOperations() {
        let list: LinkedList<Int> = LinkedList()
        
        for i in 0..<1000 {
            list.append(i)
        }
        
        #expect(list.size == 1000)
        #expect(list[0] == 0)
        #expect(list[999] == 999)
    }
    
    @Test func testMixedOperations() {
        let list: LinkedList<Int> = LinkedList()
        
        list.append(5)
        list.prepend(1)
        list.append(10)
        list.insert(7, at: 1)
        list.insert(3, at: 1)
        
        #expect(list.toArray() == [1, 3, 7, 5, 10])
        
        list.remove(at: 2)
        #expect(list.toArray() == [1, 3, 5, 10])
    }
}

// MARK: - DoubleLinkedList Tests

struct DoubleLinkedListTests {
    
    // MARK: - Initialization Tests
    
    @Test func testDoubleEmptyListInitialization() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        
        #expect(list.isEmpty == true)
        #expect(list.size == 0)
        #expect(list.count == 0)
    }
    
    // MARK: - Append Tests
    
    @Test func testDoubleAppendSingleElement() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(5)
        
        #expect(list.isEmpty == false)
        #expect(list.size == 1)
        #expect(list[0] == 5)
    }
    
    @Test func testDoubleAppendMultipleElements() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list.size == 3)
        #expect(list[0] == 1)
        #expect(list[1] == 2)
        #expect(list[2] == 3)
    }
    
    @Test func testDoubleAppendToArray() {
        let list: DoubleLinkedList<String> = DoubleLinkedList()
        list.append("a")
        list.append("b")
        list.append("c")
        
        let array = list.toArray()
        #expect(array == ["a", "b", "c"])
    }
    
    // MARK: - Prepend Tests
    
    @Test func testDoublePrependSingleElement() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.prepend(5)
        
        #expect(list.size == 1)
        #expect(list[0] == 5)
    }
    
    @Test func testDoublePrependMultipleElements() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.prepend(1)
        list.prepend(2)
        list.prepend(3)
        
        #expect(list.size == 3)
        #expect(list[0] == 3)
        #expect(list[1] == 2)
        #expect(list[2] == 1)
    }
    
    @Test func testDoublePrependAndAppendMixed() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.prepend(0)
        list.append(2)
        
        #expect(list.toArray() == [0, 1, 2])
    }
    
    // MARK: - Insert Tests
    
    @Test func testDoubleInsertAtBeginning() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.insert(0, at: 0)
        
        #expect(list.toArray() == [0, 1, 2])
        #expect(list.size == 3)
    }
    
    @Test func testDoubleInsertAtEnd() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.insert(3, at: 2)
        
        #expect(list.toArray() == [1, 2, 3])
        #expect(list.size == 3)
    }
    
    @Test func testDoubleInsertInMiddle() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(3)
        list.insert(2, at: 1)
        
        #expect(list.toArray() == [1, 2, 3])
    }
    
    @Test func testDoubleInsertAtInvalidIndex() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.insert(5, at: 10)
        
        #expect(list.size == 2)
        #expect(list.toArray() == [1, 2])
    }
    
    // MARK: - Remove Tests
    
    @Test func testDoubleRemoveAtBeginning() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let removed = list.remove(at: 0)
        
        #expect(removed == 1)
        #expect(list.size == 2)
        #expect(list.toArray() == [2, 3])
    }
    
    @Test func testDoubleRemoveAtEnd() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let removed = list.remove(at: 2)
        
        #expect(removed == 3)
        #expect(list.size == 2)
        #expect(list.toArray() == [1, 2])
    }
    
    @Test func testDoubleRemoveInMiddle() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let removed = list.remove(at: 1)
        
        #expect(removed == 2)
        #expect(list.size == 2)
        #expect(list.toArray() == [1, 3])
    }
    
    @Test func testDoubleRemoveAtInvalidIndex() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        
        let removed = list.remove(at: 5)
        
        #expect(removed == nil)
        #expect(list.size == 1)
    }
    
    @Test func testDoubleRemoveFromEmptyList() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        let removed = list.remove(at: 0)
        
        #expect(removed == nil)
        #expect(list.isEmpty == true)
    }
    
    @Test func testDoubleRemoveAllElements() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.removeAll()
        
        #expect(list.isEmpty == true)
        #expect(list.size == 0)
        #expect(list.toArray() == [])
    }
    
    // MARK: - Get Node Tests
    
    @Test func testDoubleGetNodeAtValidIndex() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(10)
        list.append(20)
        list.append(30)
        
        #expect(list.getNode(at: 0) == 10)
        #expect(list.getNode(at: 1) == 20)
        #expect(list.getNode(at: 2) == 30)
    }
    
    @Test func testDoubleGetNodeAtInvalidIndex() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        
        #expect(list.getNode(at: 5) == nil)
        #expect(list.getNode(at: -1) == nil)
    }
    
    @Test func testDoubleSubscriptOperator() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list[0] == 1)
        #expect(list[1] == 2)
        #expect(list[2] == 3)
        #expect(list[5] == nil)
    }
    
    // MARK: - Contains Tests
    
    @Test func testDoubleContainsExistingElement() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let contains = list.contains { $0 == 2 }
        #expect(contains == true)
    }
    
    @Test func testDoubleContainsNonExistingElement() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        let contains = list.contains { $0 == 5 }
        #expect(contains == false)
    }
    
    // MARK: - ForEach Tests
    
    @Test func testDoubleForEachExecution() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        var sum = 0
        list.forEach { sum += $0 }
        
        #expect(sum == 6)
    }
    
    @Test func testDoubleForEachReverseExecution() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        var result: [Int] = []
        list.forEachReverse { result.append($0) }
        
        #expect(result == [3, 2, 1])
    }
    
    @Test func testDoubleForEachOnEmptyList() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        var count = 0
        
        list.forEach { _ in count += 1 }
        
        #expect(count == 0)
    }
    
    // MARK: - Reverse Tests
    
    @Test func testDoubleReverseList() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.reverse()
        
        #expect(list.toArray() == [3, 2, 1])
    }
    
    @Test func testDoubleReverseSingleElement() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        
        list.reverse()
        
        #expect(list.toArray() == [1])
    }
    
    @Test func testDoubleReverseEmptyList() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.reverse()
        
        #expect(list.isEmpty == true)
    }
    
    @Test func testDoubleReverseMultipleTimes() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.reverse()
        #expect(list.toArray() == [3, 2, 1])
        
        list.reverse()
        #expect(list.toArray() == [1, 2, 3])
    }
    
    // MARK: - Array Conversion Tests
    
    @Test func testDoubleToArrayConversion() {
        let list: DoubleLinkedList<String> = DoubleLinkedList()
        list.append("hello")
        list.append("world")
        
        #expect(list.toArray() == ["hello", "world"])
    }
    
    @Test func testDoubleToArrayReverseConversion() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list.toArrayReverse() == [3, 2, 1])
    }
    
    @Test func testDoubleToArrayEmpty() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        #expect(list.toArray() == [])
    }
    
    @Test func testDoubleCustomDescription() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        
        #expect(list.description == "[1, 2, 3]")
    }
    
    // MARK: - Generic Type Tests
    
    @Test func testDoubleLinkedListWithStrings() {
        let list: DoubleLinkedList<String> = DoubleLinkedList()
        list.append("apple")
        list.append("banana")
        list.append("cherry")
        
        #expect(list.size == 3)
        #expect(list[1] == "banana")
    }
    
    @Test func testDoubleLinkedListWithDoubles() {
        let list: DoubleLinkedList<Double> = DoubleLinkedList()
        list.append(1.5)
        list.append(2.5)
        list.append(3.5)
        
        #expect(list.size == 3)
        #expect(list[0] == 1.5)
    }
    
    // MARK: - Bidirectional Navigation Tests
    
    @Test func testBidirectionalNavigation() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(4)
        list.append(5)
        
        var forwardResult: [Int] = []
        list.forEach { forwardResult.append($0) }
        
        var backwardResult: [Int] = []
        list.forEachReverse { backwardResult.append($0) }
        
        #expect(forwardResult == [1, 2, 3, 4, 5])
        #expect(backwardResult == [5, 4, 3, 2, 1])
    }
    
    @Test func testBidirectionalAccessOptimization() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        for i in 0..<100 {
            list.append(i)
        }
        
        let nearBeginning = list[10]
        let nearEnd = list[90]
        
        #expect(nearBeginning == 10)
        #expect(nearEnd == 90)
    }
    
    // MARK: - Complex Operations
    
    @Test func testMixedDoubleLinkedListOperations() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        
        list.append(5)
        list.prepend(1)
        list.append(10)
        list.insert(7, at: 1)
        list.insert(3, at: 1)
        
        #expect(list.toArray() == [1, 3, 7, 5, 10])
        
        list.remove(at: 2)
        #expect(list.toArray() == [1, 3, 5, 10])
        
        list.reverse()
        #expect(list.toArray() == [10, 7, 3, 1])
    }
    
    @Test func testLargeDoubleLinkedListOperations() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        
        for i in 0..<1000 {
            list.append(i)
        }
        
        #expect(list.size == 1000)
        #expect(list[0] == 0)
        #expect(list[999] == 999)
        #expect(list[500] == 500)
    }
    
    @Test func testDoubleLinkedListRemovalSequence() {
        let list: DoubleLinkedList<Int> = DoubleLinkedList()
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(4)
        list.append(5)
        
        list.remove(at: 2)
        #expect(list.toArray() == [1, 2, 4, 5])
        #expect(list.toArrayReverse() == [5, 4, 2, 1])
        
        list.remove(at: 0)
        #expect(list.toArray() == [2, 4, 5])
        
        list.remove(at: 2)
        #expect(list.toArray() == [2, 4])
        #expect(list.toArrayReverse() == [4, 2])
    }
}

