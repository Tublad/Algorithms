// Работу выполнил Шварцкопф Евгений

import Foundation

//1. *Количество маршрутов с препятствиями. Реализовать чтение массива с препятствием и нахождение количество маршрутов.

// Это сейчас без препятсвий


func printSearch(one: Int, two: Int, array: [[Int]]) {
    for i in 0..<one {
        for j in 0..<two {
            print("Узнаем что тут происходит \(array[i][j])")
        }
        print("\n")
    }
}

func getMainSearch(countOne N: Int, countTwo M: Int) {
    
    var A = Array(repeating: Array(repeating: 0, count: N), count: M)
    print(A)
    print("вот я сейчас начну делать")
    for j in 0..<M {
        A[0][j] = 1
        print(A[0][j])
    }
    print("Походу я вылетаю на первом цикле)) А теперь не вылетает и работает")
    for i in 1..<N {
        A[i][0] = 1
        print("Тут я кое что сделал и цикл прошел дальше, корректно с работая ")
        print(A[i][0])
        for j in 1..<M {
            A[i][j] = A[i][j - 1] + A[i - 1][j]
        }
        printSearch(one: N, two: M, array: A)
    }
}

getMainSearch(countOne: 3, countTwo: 3)

// Вроде бы получилось сделать с препятсвием
// единтсвенное у меня карта с препятсвиями статична
var map: Array = [[0,0,0],[0,1,0],[0,1,0]]

func getWithSearch(countOne N: Int, countTwo M: Int) {
    
    var A = Array(repeating: Array(repeating: 0, count: N), count: M)
    print(A)
    print("вот я сейчас начну делать")
    for j in 0..<M {
        if map[0][j] != 1 {
            A[0][j] = 1
            print(A[0][j])
        }
        print("Походу я вылетаю на первом цикле)) А теперь не вылетает и работает")
        for i in 1..<N {
            if map[i][0] != 1 {
                A[i][0] = 1
                print("Тут я кое что сделал и цикл прошел дальше, корректно с работая ")
                print(A[i][0])
            }
            for j in 1..<M {
                if map[i][j] != 1 {
                    A[i][j] = A[i][j - 1] + A[i - 1][j]
                }
            }
            printSearch(one: N, two: M, array: A)
        }
    }
}

getWithSearch(countOne: 3, countTwo: 3)


//2. Решить задачу о нахождении длины максимальной последовательности с помощью матрицы.

