import Foundation

// Работу выполнил Шварцкопф Евгений

// 1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.

var newDouble: String = ""

func translationNumber(write num: Int) {
    var number: Int
    // сначала проверям делиться ли число без остатка и если да, то добавляем 0
    if num % 2 == 0 && num != 0 {
        newDouble = newDouble + "0"
        print("\(num) деленное 2 без остатка и соответсвенно добавляем 0")
        // после чего изменяем число
        number = num / 2
        // вызываем нашу функцию опять, но уже с новым числом для продолжения
        translationNumber(write: number)
    } else if num % 2 != 0 && num != 0{
        newDouble = newDouble + "1"
        print("\(num) деленное 2 дает остаток и соответсвенно добавляем 1")
        number = num / 2
        translationNumber(write: number)
    } else if num == 0 {
        print("В двоичной системе данное число будет = " + newDouble)
    }
}

//translationNumber(write: 199)

//2. Реализовать функцию возведения числа a в степень b:
//
//a. без рекурсии;
//b. рекурсивно;
//c. *рекурсивно, используя свойство четности степени.

// a) без рекурсии
func example(a: Int, b: Int) {
    var c: Int = 0
    for _ in 1...b {
        if c == 0 {
            c = a * a
            print(c)
        } else {
            c = c * a
            print(c)
        }
    }
}

//example(a: 4, b: 3)

// b) рекурсивно

// создаю переменные чтоб хранить в них данные после вызова функции
var count: Int = 1
var c: Int = 0

// сама фукнция которая возводит в степень через рекурсию
func exampleReq(a: Int, b: Int) {
    // проверяю первое условие, чтоб начать возвадить в степень
    if count == 1 {
        c = a * a
        // прибавляю +1 для увелечение числа в count, понадобиться для 2 сравнения
        count += 1
        exampleReq(a: a, b: b)
        // проверям 2 условия, и в нем уже возводим до того, как count станет меньше степени указанной, чтоб можно было остановить в нужный момент рекурсию
    } else if count < b {
        c = c * a
        count += 1
        exampleReq(a: a, b: b)
    } else {
        // после чего уже выводим ответ
        print("Число \(a) в степени \(b) = \(c)")
    }
}

//exampleReq(a: 2, b: 3)
