// Выполнил домашнюю работу Шварцкопф Евгений
// Урок 5. Динамические структуры данных.

import Foundation

// 1. Реализовать перевод из десятичной в двоичную систему счисления с использованием стека.

struct StackDouble {
    var newDouble: [String] = []
    var maxSize = 10
    
    mutating func push(writeNumber num: Int) {
        
        var value: String = ""
        if newDouble.count > maxSize {
            print("Stack В данный момент полный. Я не могу добавить новый элемент")
            return
        }
        translationNumber(write: num, value: &value)
        newDouble.append(value)
        print("Добавлено значение в stack \(newDouble)")
    }
    
    mutating func pop() {
        if newDouble.count == 0 {
            print("Stack пустой, я не могу удалить элемент")
            return
        }
        let value = newDouble.removeLast()
        print("Из stack удаленно значание \(value)")
    }
    
    mutating func translationNumber(write num: Int, value: inout String) {
        var number: Int
        if num % 2 == 0 && num != 0 {
            value = value + "0"
            number = num / 2
            translationNumber(write: number, value: &value)
        } else if num % 2 != 0 && num != 0 {
            value = value + "1"
            number = num / 2
            translationNumber(write: number, value: &value)
        }
    }
}

// Раскомментировать для показа
//var firstValue = StackDouble()
//firstValue.push(writeNumber: 25)
//firstValue.push(writeNumber: 125)
//firstValue.push(writeNumber: 87)
//firstValue.push(writeNumber: 512)
//firstValue.push(writeNumber: 145)
//firstValue.push(writeNumber: 223)
//firstValue.push(writeNumber: 123)
//firstValue.push(writeNumber: 321)
//firstValue.push(writeNumber: 75)
//firstValue.push(writeNumber: 55)
//firstValue.push(writeNumber: 325)
//firstValue.push(writeNumber: 225)
//
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//firstValue.pop()
//
//print(firstValue.newDouble)


// 2. Добавить в программу «реализация стека на основе односвязного списка» проверку на выделение памяти. Если память не выделяется, то выводится соответствующее сообщение. Постарайтесь создать ситуацию, когда память не будет выделяться (добавлением большого количества данных).

final class Node<T> {
    let payload: T
    var nextNode: Node?
    
    init(payload: T, nextNode: Node? = nil) {
        self.payload = payload
        self.nextNode = nextNode
    }
}

final class SinglyLinkedList<T> {
    
    var firstNode: Node<T>?
    
    init(firstNode: Node<T>? = nil) {
        self.firstNode = firstNode
    }
}

let node = Node(payload: 0)
let list = SinglyLinkedList(firstNode: node)

var currentNode = node
var nextNode: Node<Int>
for id in 1..<100{
    nextNode = Node(payload: id)
    currentNode.nextNode = nextNode
    currentNode = nextNode
}

extension Node: CustomStringConvertible where T == Int {
    
    var description: String {
        let firstPart = """
        Node \(Unmanaged.passUnretained(self).toOpaque()) имеет id \(payload) и
        """
        if let nextNode = nextNode {
            return firstPart + " следующая Node \(nextNode.payload)."
        } else {
            return firstPart + " нет следующей Node."
        }
    }
    
}

extension SinglyLinkedList: CustomStringConvertible where T == Int {
    
    var description: String {
        var description = """
        List \(Unmanaged.passUnretained(self).toOpaque())
        """
        if firstNode != nil {
            description += " имеет Node:\n"
            
            var node = firstNode
            while node != nil {
                description += (node!.description + "\n")
                node = node!.nextNode
            }
            
            return description
        } else {
            return description + " нет Node"
        }
    }
    
}
// Раскомментировать для показа
//print(String(describing: list))
