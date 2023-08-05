//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Kader Oral on 31.07.2023.
//

import UIKit

class Anasayfa : UIViewController{
    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        //burdaki tableview ile aşağıdaki kodlar senkronize çalışması için
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Kader", kisi_tel: "0908")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Derya", kisi_tel: "34354")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Deniz", kisi_tel: "4567")
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidilecekVC = segue.destination as! KisiDetay
                    gidilecekVC.kisi = kisi
                
            }
        }
    }
    
    
}


//MARK: - Anasayfa

extension Anasayfa: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara: \(searchText)")
    }
}
//MARK: - Anasayfa

extension  Anasayfa: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]//sırayla kişi listesine erişiyoruz.
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]//sırayla kişi listesine erişiyoruz.
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)//seçileni kaldırma
    }
    
    //left - start -leading
    //right - end - trailing
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            let kisi = self.kisilerListesi[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            let iptalAction  = UIAlertAction(title: "iptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style:.destructive){
                action in
                print("Kişi sil : \(kisi.kisi_id!)")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
