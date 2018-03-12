import UIKit

class Cell_Test: UICollectionViewCell {

    @IBOutlet weak var txt_text: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txt_text.text = ""
        self.txt_text.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @IBAction func btn_add_text(_ sender: Any) {
        if let controller = self.parentViewController as? ViewController
        {
            controller.add_text(text: self.txt_text.text)
        }
    }
    
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
