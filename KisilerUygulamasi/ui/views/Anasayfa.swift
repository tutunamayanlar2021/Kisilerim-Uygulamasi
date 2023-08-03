//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Kader Oral on 31.07.2023.
//

import UIKit

class Anasayfa : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonDetay(_ sender: Any) {
        let kisi = Kisiler(kisi_id: 90, kisi_ad: "Kader", kisi_tel: "03490385")
        performSegue(withIdentifier: "toDetay", sender: kisi)
        
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

