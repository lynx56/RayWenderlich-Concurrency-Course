import Foundation

open class AsyncOperation: Operation{
    public enum State: String{
        case ready
        case executing
        case finished
        
        fileprivate var keyPath: String{
            return "is" + rawValue.capitalized
        }
    }
    
    open var state: State = .ready{
        willSet{
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        didSet{
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }
    
    override open var isReady: Bool{
        return self.state == .ready && super.isReady
    }
    
    override open var isExecuting: Bool{
        return self.state == .executing
    }
    
    override open var isFinished: Bool{
        return self.state == .finished
    }
    
    override open func start() {
        if isCancelled{
            state = .finished
            return
        }
        
        main()
        self.state = .executing
    }
    
    override open func cancel() {
        self.state = .finished
    }
}
