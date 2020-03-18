import Foundation

//Выполнил работу Шварцкопф Евгений
//Надеюсь верно понял домашнее задание и решение к нему.

//1. Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах

func getIndexBody(heightInCent c: Double, weightInKilo m: Double) -> String {
    // сделал проверку на рост и вес, записал максимальный допустимый вес и рост человека
    guard c > 0 && c < 285, m > 0 && m < 727 else { return "Введите корректные данные" }
    // переводим сантиметры в метры
    let h = c / 100
    // высчитываем индекс массы тела
    let i = m/(h*h)
    // убираем лишние числа после запятой и оставляем одно после запятой
    let indexBody = NSString(format: "%.1f", i)
    // выводим ответ
    print("Ваш индекс массы тела = \(indexBody)")
    return indexBody as String
}

// можно будет раскомментировать и посмотреть результат
//let indexBody = getIndexBody(heightInCent: 68.5, weightInKilo: 178)
//print(indexBody)

//2. Найти максимальное из четырех чисел. массивы не использовать.

func maxNumber(one: Int, two: Int, three: Int, four: Int) -> Int {
    // проверяем первое число
    if one > two && one > three && one > four {
        // если первое число и правда больше всех, выводим ответ
        print("Наибольшее число из 4 является: \(one)")
        return one
    } else if two > three && two > one && two > four {
        // если второе число и правда больше всех, выводим ответ
        print("Наибольшее число из 4 является: \(two)")
        return two
    } else if three > four && three > one && three > two {
        print("Наибольшее число из 4 является: \(three)")
        return three
    } else if four > one && four > two && four > three {
         print("Наибольшее число из 4 является: \(four)")
        return four
    } else {
        // если же все числа одинаковы или не корректно введины, выводим ответ
        print("Из этих чисел нет наибольшего, так как они все одного значения")
        return two
    }
}

// можно будет раскомментировать и посмотреть результат
//var value = maxNumber(one: 1, two: 1, three: 1, four: 1)
//print(value)
//var valueTwo = maxNumber(one: 4, two: 10, three: 1, four: 20)
//print(value)
//var valueThree = maxNumber(one: 1, two: 1, three: 10, four: 1)
//print(valueThree)


//3. Написать программу обмена значениями двух целочисленных переменных:
//a. с использованием третьей переменной;
//b. *без использования третьей переменной.

// a)
func exchange(_ firstValue: inout Int,_ secondValue: inout Int) {
    // создаем временную переменную, чтоб передать значиние
    var betweenValue: Int
    // показываем чему равно первое значение и второе значение
    print("В данный момент первое значение = \(firstValue), а второе значиние = \(secondValue)")
    // начинаем обменивать значения
    betweenValue = firstValue
    firstValue = secondValue
    secondValue = betweenValue
    // выводим результат
    print("Теперь первое значение = \(firstValue), а второе значине = \(secondValue)")
}

// b) Пока еще не понял =))


// можно будет раскомментировать и посмотреть результат
//var firstValue = 25
//var secondValue = 35

//exchange(&firstValue, &secondValue)
//print(firstValue, secondValue)

//4. Написать программу нахождения корней заданного квадратного уравнения.

func searchRoot(a: Double, b: Double, c: Double) {
    // Вычисляем дискриминант по формуле D = b2 - 4ac
    let discr = b * b - 4 * a * c
    print("Дискриминант = \(NSString(format: "%.1f", discr))")
    // Начинаем проверять чему равен дискриминант
    if discr > 0 {
        let firstRoot = (-b + sqrt(discr)) / (2 * a)
        let secondRoot = (-b - sqrt(discr)) / (2 * a)
        print("Имеет 2 корня = (\(NSString(format: "%.1f", firstRoot)),\(NSString(format: "%.1f", secondRoot)))")
    } else if discr == 0 {
        let x = -b / (2 * a)
        print("Имеет 1 корень = \(NSString(format: "%.1f", x))")
    } else {
        print("Корней нет")
    }
}

// можно будет раскомментировать и посмотреть результат
//searchRoot(a: 5, b: -15, c: 3)
//searchRoot(a: 1, b: -5, c: 2)
//searchRoot(a: 3, b: 4, c: 1)


//5. С клавиатуры вводится номер месяца. Требуется определить, к какому времени года он относится.

func season(write number: Int) {
    // Делаем проверку, вдруг ввидут отрицательные числа или же большое
    guard number > 0 && number <= 12 else { return }
    // Начинаем осуществлять проверку по числам для определение времени года
    if number == 12 || number == 1 || number == 2 {
        print("Сейчас Зима")
    } else if number == 3 || number == 4 || number == 5 {
        print("Сейчас Весна")
    } else if number == 6 || number == 7 || number == 8 {
        print("Сейчас Лето")
    } else {
        print("Сейчас Осень")
    }
}
// можно будет раскомментировать и посмотреть результат
//season(write: 5)
//season(write: 10)
//season(write: 1)

//6. Ввести возраст человека (от 1 до 150 лет) и вывести его вместе с последующим словом «год», «года» или «лет»

func getAge() {
    // Начинаем выполнять цикл по возрасту
    for i in 1...150 {
        // выполняем условия для того чтоб понять какой возраст
        if i % 10 == 1 {
            // дополнительная проверка д
            if i == 11 {
                print("\(i) лет")
                continue
            }
            print("\(i) год")
            continue
        } else if i % 10 == 2 || i % 10 == 3 || i % 10 == 4 {
            if i == 12 || i == 13 || i == 14 {
                print("\(i) лет")
                continue
            }
            print("\(i) года")
            continue
        } else {
            print("\(i) лет")
            continue
        }
    }
}

// можно будет раскомментировать и посмотреть результат
//getAge()

//8. Ввести a и b и вывести квадраты и кубы чисел от a до b.

func squarCubeNumber(write a:Int , writw b: Int) {
    guard a < b else { return print("Нужно чтоб первое значение было меньше второго")}
        print("Сейчас будут представлены квадраты и кубы чисел от \(a) до \(b)")
        for sum in a...b {
            let squar = sum * sum
            let cube = sum * sum * sum
            print("Квадрат от \(sum) = \(squar)")
            print("Куб от \(sum) = \(cube)")
    }
}

// можно будет раскомментировать и посмотреть результат
//squarCubeNumber(write: 4, writw: 8)
//squarCubeNumber(write: 5, writw: 1)

// С остальными пока не успел из за работы. Буду очень ждать обратно связи интересно как можно было бы решить по-другому =)
