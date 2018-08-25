

import UIKit

class KolaCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ime: UILabel!
  
    @IBOutlet weak var img: UIImageView!
    var kola: Kola!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         layer.cornerRadius = 7.0
    }
    
    func configureCell(kola: Kola) {
        self.kola = kola
        
        ime.text = self.kola.model.capitalized
        img.image = UIImage(named: "\(self.kola.id)")
        
    }
    
}
