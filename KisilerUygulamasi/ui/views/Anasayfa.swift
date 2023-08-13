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
    var viewModel = AnasayfaViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        //burdaki tableview ile aşağıdaki kodlar senkronize çalışması için
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        _ = viewModel.kisilerListesi.subscribe(onNext: {
            liste in
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()
        })
    }
    override func viewWillAppear(_ animated: Bool) {//sayfa her göründüğünde çalışıyor
        viewModel.kisilerYukle()
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
        viewModel.ara(aramaKelimesi: searchText)
        
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
                self.viewModel.sil(kisi_id: kisi.kisi_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
