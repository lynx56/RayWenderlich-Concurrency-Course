import Foundation

class AsyncOperation: Operation{
    enum State: String{
        case ready
        case executing
        case finished
        
        fileprivate var keyPath: String{
            return "is" + rawValue.capitalized
        }
    }
    
    var state: State = .ready{
        willSet{
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        didSet{
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }
}

extension AsyncOperation{
    override var isReady: Bool{
        return self.state == .ready && super.isReady
    }
    
    override var isExecuting: Bool{
        return self.state == .executing
    }
    
    override var isFinished: Bool{
        return self.isFinished
    }
    
    override func start() {
        if isCancelled{
            state = .finished
            return
        }
        
        main()
        self.state = .executing
    }
}
