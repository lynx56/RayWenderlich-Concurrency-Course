import Foundation
import PlaygroundSupport
import UIKit
import Accelerate

var result = 0

//******************* SUM *******************
var operationSum = BlockOperation(){
    result = 2 + 3
    sleep(5)
}

startClock()
operationSum.start()
stopClock()

result

//******************* MASS PRINT *******************

var printOperations = BlockOperation()

printOperations.addExecutionBlock {
    print("Hello!")
    sleep(5)
}

printOperations.addExecutionBlock {
    print("My name")
    sleep(5)
}

printOperations.addExecutionBlock {
    print("is")
    sleep(5)
}

printOperations.addExecutionBlock {
    print("Gulnaz")
    sleep(5)
}

startClock()
printOperations.start()
stopClock()


//******************* SUBCLASSING *******************
class TiltShiftOperation: Operation{
    var inputImage: UIImage?
    var outputImage: UIImage?
    
    override func main() {
        guard let inputImage = inputImage
            else { return }
        let mask = topAndBottomGradient(size: inputImage.size)
        outputImage = inputImage.applyBlurWithRadius(blurRadius: 4, maskImage: mask)
    }
}

let tsOp = TiltShiftOperation()
let path = Bundle.main.path(forResource: "dark_road_small", ofType: "jpg")!
let image = UIImage(contentsOfFile: path)
//let image = UIImage(named: "dark_road_small")!
tsOp.inputImage = image

startClock()
tsOp.start()
stopClock()



tsOp.outputImage






