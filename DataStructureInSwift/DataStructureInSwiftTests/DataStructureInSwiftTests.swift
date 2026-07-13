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
        
        #expect(list.toArray() == [1, 3, 5, 7, 10])
        
        list.remove(at: 2)
        #expect(list.toArray() == [1, 3, 7, 10])
    }
}

