import Foundation
import CommonCrypto

//Выполнил работу Евгений Шварцкопф

//1. Реализовать простейшую хеш-функцию. На вход функции подается строка, на выходе сумма кодов символов.

func hashData(name:String, data:Data) -> Data? {
    let algos = ["MD2":    (CC_MD2,    CC_MD2_DIGEST_LENGTH),
                 "MD4":    (CC_MD4,    CC_MD4_DIGEST_LENGTH),
                 "MD5":    (CC_MD5,    CC_MD5_DIGEST_LENGTH),
                 "SHA1":   (CC_SHA1,   CC_SHA1_DIGEST_LENGTH),
                 "SHA224": (CC_SHA224, CC_SHA224_DIGEST_LENGTH),
                 "SHA256": (CC_SHA256, CC_SHA256_DIGEST_LENGTH),
                 "SHA384": (CC_SHA384, CC_SHA384_DIGEST_LENGTH),
                 "SHA512": (CC_SHA512, CC_SHA512_DIGEST_LENGTH)]
    guard let (hashAlgorithm, length) = algos[name]  else { return nil }
    var hashData = Data(count: Int(length))

    _ = hashData.withUnsafeMutableBytes {digestBytes in
        data.withUnsafeBytes {messageBytes in
            hashAlgorithm(messageBytes, CC_LONG(data.count), digestBytes)
        }
    }
    return hashData
}


func hashString(name:String, string:String) -> Data? {
    let data = string.data(using:.utf8)!
    return hashData(name:name, data :data)
}

let valueString = "Hello, it s me"
let valueData = valueString.data(using: .utf8)!

print("clearString: \(valueString)")
print("clearData: \(valueData as NSData)")

let hashSHA256 = hashString(name:"SHA256", string: valueString)
print("hashSHA256: \(hashSHA256! as NSData)")

let hashMD5 = hashData(name:"MD5", data: valueData)
print("hashMD5: \(hashMD5! as NSData)")
