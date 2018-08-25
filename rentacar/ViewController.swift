import UIKit
import AVFoundation


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    var kola = [Kola]()
    var filteredKola = [Kola]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.done
        collection.showsVerticalScrollIndicator = false
        
        
        
        
        
        
        parseKolaCSV()
        
    }
    
    
    
    
    func parseKolaCSV() {
        let path = Bundle.main.path(forResource: "kola", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let id = Int(row["id"]!)!
                let model = row["model"]!
                let gorivo = row["gorivo"]!
                let brojvrata = Int(row["brojvrata"]!)!
                let cena = Int(row["cena"]!)!
                
                let auto = Kola(id: id, model: model, gorivo: gorivo, brojvrata: brojvrata, cena: cena)
                kola.append(auto)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KolaCell", for: indexPath) as? KolaCell {
            
            let auto: Kola!
            
            if inSearchMode {
                auto = filteredKola[indexPath.row]
            } else {
                auto = kola[indexPath.row]
            }
            
            
            
            cell.configureCell(kola: auto)
            return cell
            
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let auto: Kola!
        
        if inSearchMode {
            auto = filteredKola[indexPath.row]
        } else {
            auto = kola[indexPath.row]
        }
        
        
        performSegue(withIdentifier: "KolaDetailVC", sender: auto)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredKola.count
        }
        
        return kola.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 99)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchbar.text == nil || searchbar.text == "" {
            inSearchMode = false
            self.view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchbar.text!.lowercased()
            filteredKola = kola.filter({$0.model.range(of: lower) != nil})
            collection.reloadData()
        }
    }
        
    @IBAction func ugasitastaturu(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func ugasitastaturu1(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func ugasitastaturu2(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "KolaDetailVC" {
            if let detailsVC = segue.destination as? KolaDetailVC {
                if let auto = sender as? Kola {
                    detailsVC.kola = auto
                }
            }
        }
    }
}
