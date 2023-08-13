//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kader Oral on 10.08.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository{
    var kisilerListesi = BehaviorSubject<[Kisiler]> (value:[Kisiler]())
    
      func kaydet(kisi_ad:String,kisi_tel:String){
          print("Kişi kaydet: \(kisi_ad) - \(kisi_tel)")
      }
    
    func guncelle( kisi_id:Int,kisi_ad:String,kisi_tel:String){
        print("Kişi Güncelle: \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
    func sil(kisi_id:Int){
        print("Kişi sil: \(kisi_id)")
    }
    
    func ara(aramaKelimesi:String){
        print("Kisi ara: \(aramaKelimesi)")
    }
    
    func kisilerYukle(){
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Kader", kisi_tel: "0908")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Derya", kisi_tel: "34354")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Deniz", kisi_tel: "4567")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi.onNext(liste)//tetikleme
    }
}
