
import UIKit
// Выполнил Работу Шварцкопф Евгений

// 1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.

var list = [3,11,22,0,-1,-2,98,8,100,6,-3,5]
var counter: Int = 0

// 1. Не оптимизированный

func bubbleSort<T: Comparable>(list: inout [T]) -> [T] {
    // создаем переменную обозначающую о максимальном индекса массива
    let size = list.count
    // после чего создаем новую переменную собственно с помощью которой будет пробегать
    for n in 0..<size {
        var pass = (size - 1) - n
        // начинаем выполнять итерацию
        for j in 0..<pass {
            var key = list[j]
            counter += 1
            // после чего проверяем число больше или меньше оно
            if key > list[j + 1] {
                // создаем переменную для обмена значениями
                let temp = list[j + 1]
                list[j + 1] = key
                list[j] = temp
            }
        }
        counter += 1
    }
    // возвращаем сам массив отсортированный
    return list
}
// O(n^3)
// Расскоментировать для показа ответа
//var sortList = bubbleSort(list: &list)
//print(sortList)
//print(counter)

// Следующий вариант оптимизации сортировки

var secondList = [3,11,22,0,98,8,100,6,5]
var secondCounter: Int = 0

// n = (0 , k) k => 0(n)

func countingSort(list: [Int], maxValue: Int) -> [Int] {
    let size = list.count
    let m = maxValue + 1
    var conteiner = [Int](repeating: 0, count: m)
    
    for j in list {
        conteiner[j] += 1
    }
    var outer = [Int](repeating: 0, count: size)
    var i = 0
    
    for a in 0..<m {
        for _ in 0..<conteiner[a] {
            secondCounter += 1
            outer[i] = a
            i += 1
        }
    }
    secondCounter += 1
    return outer
}
// O(n)
// Расскомментировать для показа ответа
//var indexes = countingSort(list: secondList, maxValue: 100)
//print(indexes)
//print(secondCounter)



// 3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.

func sourceIndex(index: Int, array: [Int], max: Int) -> Int {
    // принимает массив и отсортировал его
    let sortArray = countingSort(list: array, maxValue: max)
    // после чего начинаем сравнивать есть ли такой индекс
    if sortArray.count > index {
        // если да, то пишем следующие
        print("По данному индексу \(index) находиться число \(sortArray[index])")
        return index
    } else {
        // если же нет, пишем следующие
        print("Данного индекса нет в отсортированном массиве")
        return -1
    }
}
//Расскоменнтировать для показа ответа
//var number = sourceIndex(index: 8, array: secondList, max: 100)
//print(number)
