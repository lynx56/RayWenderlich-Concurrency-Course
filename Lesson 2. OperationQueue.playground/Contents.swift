import Foundation
import PlaygroundSupport
import UIKit
import Accelerate

//********************** PRINT OPERATIONS ****************************

let operationQueue = OperationQueue()
operationQueue.maxConcurrentOperationCount = 20
operationQueue.addOperation { sleep(5); print("Hello"); }
operationQueue.addOperation { sleep(5); print("my"); }
operationQueue.addOperation { sleep(5); print("name"); }
operationQueue.addOperation { sleep(5); print("is"); }
operationQueue.addOperation { sleep(5); print("gulnaz"); }

startClock()
operationQueue.waitUntilAllOperationsAreFinished()
stopClock()


//********************** LOAD IMAGES ****************************

let imageNames = ["city", "dark_road", "train_day", "train_dusk", "train_night"]
var images = [UIImage]()
for imageName in imageNames{
    let path = Bundle.main.path(forResource: imageName, ofType: "jpg")!
    let image = UIImage(contentsOfFile: path)
    images.append(image!)
}

images

let imageQueue = OperationQueue()
var outputImages = [UIImage]()

for image in images{
    let op = TiltShiftOperation()
    op.inputImage = image
    op.completionBlock = {
        guard let outputImage = op.outputImage
            else { return }
        outputImages.append(outputImage)
    }
    
    imageQueue.addOperation(op)
}

startClock()
imageQueue.waitUntilAllOperationsAreFinished()
stopClock()

outputImages


