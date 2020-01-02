import UIKit

class LineDrawingViewController: UIViewController {
    @IBOutlet var lineView: LineView! {
        didSet {
            let handler = #selector(LineView.changeControlPoint(byReactingTo:))
            let tapRecognizer = UITapGestureRecognizer(target: lineView, action: handler)
            tapRecognizer.numberOfTapsRequired = 1
            lineView.addGestureRecognizer(tapRecognizer)
        }
    }
}
