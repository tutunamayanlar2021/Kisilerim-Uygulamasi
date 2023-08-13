//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kader Oral on 10.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var krepo =  KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]> (value:[Kisiler]())

    init(){
        kisilerListesi = krepo.kisilerListesi
    }
    func sil(kisi_id:Int){
        krepo.sil(kisi_id: kisi_id)
        kisilerYukle()
    }
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func kisilerYukle(){
       
        krepo.kisilerYukle()
    }
}
