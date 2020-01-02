import UIKit

class LineView: UIView {
    
    // MARK: - Internal Methods
    
    @objc func changeControlPoint(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        let tappedPoint = tapRecognizer.location(in: self)
        controlPoint = tappedPoint
    }
    
    // MARK: - Private Variables
    
    private var controlPoint = CGPoint(x: 0, y: 0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private lazy var lineStartPoint: CGPoint = {
        CGPoint(x: self.bounds.minX, y: self.bounds.midY)
    }()
    
    private lazy var lineEndPoint: CGPoint = {
        CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
    }()
        
    // MARK: - UIView Overrides
    
    override func draw(_ rect: CGRect) {
        drawQuadCurve()
        drawLineToControlPoint()
        drawLineFromControlPoint()
    }
    
    // MARK: - Private Methods
    
    private func drawQuadCurve() {
        UIColor.black.set()
        let path = UIBezierPath()
        path.move(to: lineStartPoint)
        path.addQuadCurve(to: lineEndPoint, controlPoint: controlPoint)
        path.stroke()
    }
    
    private func drawLineToControlPoint() {
        UIColor.orange.set()
        let pathToFirstCP = UIBezierPath()
        pathToFirstCP.move(to: lineStartPoint)
        pathToFirstCP.addLine(to: controlPoint)
        pathToFirstCP.stroke()
    }
    
    private func drawLineFromControlPoint() {
        UIColor.blue.set()
        let pathFromCP = UIBezierPath()
        pathFromCP.move(to: controlPoint)
        pathFromCP.addLine(to: lineEndPoint)
        pathFromCP.stroke()
    }
}
