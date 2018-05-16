import UIKit
import DistanceGetter
class ViewController: UIViewController {
    
    private var req : DGDistanceRequest?
    @IBOutlet weak var firstDistance: UILabel!
    @IBOutlet weak var secondDistance: UILabel!
    @IBOutlet weak var thridDistance: UILabel!
    
    @IBOutlet weak var start: UITextField!
    @IBOutlet weak var firstCity: UITextField!
    @IBOutlet weak var secondCity: UITextField!
    @IBOutlet weak var thirdCity: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func theCallback(results : Optional<(Optional<Array<Any>>)>) {
        if let x = results, let y = x, let a = Double("\(y[0])"), let b = Double("\(y[1])"),
        let c = Double("\(y[2])"){
            
            if (a == -1.0){
                self.firstDistance.text = "Unkown Location"
            } else {
                self.firstDistance.text = "\(a) m"
            }
            if (b == -1.0){
                self.secondDistance.text = "Unkown Location"
            } else {
                self.secondDistance.text = "\(b) m"
            }
            if (c == -1.0){
                self.thridDistance.text = "Unkown Location"
            } else {
                self.thridDistance.text = "\(c) m"
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func getDistance(_ sender: Any) {
        req = DGDistanceRequest(locationDescriptions: [firstCity.text ?? "",  secondCity.text ?? "" , thirdCity.text ?? ""], sourceDescription: start.text)
        if let r = req {
            r.callback = theCallback
            r.start()
        }
    }
    
}














