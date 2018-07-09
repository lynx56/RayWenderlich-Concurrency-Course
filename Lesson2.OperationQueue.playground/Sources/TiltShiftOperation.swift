import PlaygroundSupport
import UIKit
import Accelerate

public class TiltShiftOperation: Operation{
    public var inputImage: UIImage?
    public var outputImage: UIImage?
    
    override public func main(){
        guard let inputImage = inputImage
            else { return }
        let mask = topAndBottomGradient(size: inputImage.size)
        outputImage = inputImage.applyBlurWithRadius(blurRadius: 4, maskImage: mask)
    }
}
