//
//  HomeViewModel.swift
//  Meet Gnomes
//
//  Created by CHERNANDER04 on 05/07/20.
//  Copyright © 2020 AMPM. All rights reserved.
//

import Foundation

class HomeViewModel {
    //CREAR MECANISMO PARA ENLAZAR LO QUE SERÍA LA VISTA CON ESTE MODELO DE LA VISTA
    var refreshData = { () -> () in }
    
    
    //FUENTE DE DATOS (ARRAY)
    var dataArray: HomeModel? {
        didSet {
            refreshData()
        }
    }
    
    
    /**
     ESTO NO DEBERÍA IR AQUI, HAY QUE CREAR UNA CAPA DE CONEXION PARA HACER ESTE TIPO DE COSAS
        E INSTANCIAR DESDE AQUI EL OBJETO DE CAPA DE CONEXION
     */
    
    //OBTENER LOS DATOS DE LA API QUE DESEAMOS CONSUMIR
    func retrieveDataList() {
        guard let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let json = data else { return }
            
            //SERIALIZAR LOS DATOS
            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode(HomeModel.self, from: json)
            } catch let error {
                print("Ocurrio un error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
