
//

import UIKit

class KolaDetailVC: UIViewController {
    
    var kola: Kola!

    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pozovi(_ sender: Any) {
        guard let number = URL(string: "telprompt://" + "381113552418") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    @IBAction func viber(_ sender: Any) {
        
        guard let number = URL(string: "viber://add?number=" + "381113552418") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var kolaimage: UIImageView!
    
    @IBOutlet weak var kolagorivo: UILabel!
    
    @IBOutlet weak var kolabrojvrata: UILabel!
    
    @IBOutlet weak var kolamodel: UILabel!
    
    @IBOutlet weak var kolacena: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "\(kola.id)")
        
        kolaimage.image = img
        kolagorivo.text = kola.gorivo.capitalized
        kolabrojvrata.text = String(kola.brojvrata)
        kolamodel.text = kola.model.capitalized
        kolacena.text = "\(String(kola.cena))e"
        
        
        
        
        
        
       }
}
