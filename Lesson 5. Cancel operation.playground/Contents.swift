import Foundation
import PlaygroundSupport

class SumOperation:  Operation{
    var input: [(Int, Int)]
    var output: [Int] = []
    
    init(_ input:[(Int, Int)]){
        self.input = input
        super.init()
    }
    
    override func main() {
        for pair in input{
            if isCancelled {
                return
            }
            output.append(slowSum(lhs: pair.0, rhs: pair.1))
        }
    }
}

func slowSum(lhs: Int, rhs: Int)->Int{
    sleep(1)
    return lhs + rhs
}


var pairs: [(Int, Int)] = [(1,2), (4, 10), (250, 11), (30, 6), (110, 21)]
let queue = OperationQueue()

let op = SumOperation(pairs)
op.completionBlock = {
    stopClock()
}

queue.addOperation(op)
sleep(2)
op.cancel()

startClock()
queue.waitUntilAllOperationsAreFinished()
stopClock()


PlaygroundPage.current.needsIndefiniteExecution = true
