import Foundation

infix operator **
func **(lhs: Int, rhs: Int) -> Int {
    return Int(pow(Double(lhs), Double(rhs)))
}

func karatsubaMul(x: Int, y: Int) -> Int {
    guard String(x).count > 1 && String(y).count > 1 else {
        return(x * y)
    }
    
    let n = max(String(x).count, String(y).count)
    let halfN = n / 2
    
    let a = x / (10**halfN)
    let b = x % (10**halfN)
    let c = y / (10**halfN)
    let d = y % (10**halfN)
    
    let p = a + b
    let q = c + d
    
    let ac = karatsubaMul(x: a, y: c)
    let bd = karatsubaMul(x: b, y: d)
    let pq = karatsubaMul(x: p, y: q)
    
    let adbc = pq - ac - bd
    
    let res = ac * (10**(2 * halfN)) + adbc * (10**halfN) + bd
    return res
}


let x, y: Int
x = 4321
y = 2354

print(karatsubaMul(x: x, y: y))
