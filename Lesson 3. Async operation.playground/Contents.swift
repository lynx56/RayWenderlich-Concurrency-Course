import Foundation
import PlaygroundSupport

func sum(left: Int, rigth: Int, completion: (Int)->Void){
    completion (left + rigth)
}

class SumOperation: AsyncOperation{
    var left: Int
    var right: Int
    var output: Int = 0
    
    init(_ one: Int, _ two: Int) {
        left = one
        right = two
        super.init()
    }
    
    override func main(){
        sum(left: left, rigth: right) { (result) in
            self.output = result
            self.state = .finished
        }
    }
}

var pairs: [(Int, Int)] = [(1,2), (4, 10), (250, 11), (30, 6), (110, 21)]

let queue = OperationQueue()

for pair in pairs{
    let op = SumOperation(pair.0, pair.1)
    op.completionBlock = { print( "\(pair.0) + \(pair.1) = \(op.output)") }
    queue.addOperation(op)
}

startClock()
queue.waitUntilAllOperationsAreFinished()
stopClock()

PlaygroundPage.current.needsIndefiniteExecution = true
