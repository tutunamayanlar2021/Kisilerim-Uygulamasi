//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Kader Oral on 31.07.2023.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    
    @IBOutlet weak var tfKisiTel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text ,let kt = tfKisiTel.text{
            kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
  
    func kaydet(kisi_ad:String,kisi_tel:String){
        print("Kişi kaydet: \(kisi_ad) - \(kisi_tel)")
    }

}
