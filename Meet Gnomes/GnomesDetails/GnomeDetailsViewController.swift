//
//  GnomeDetailsViewController.swift
//  Meet Gnomes
//
//  Created by CHERNANDER04 on 05/07/20.
//  Copyright © 2020 AMPM. All rights reserved.
//

import UIKit
import SDWebImage

class GnomeDetailsViewController: UIViewController {

    @IBOutlet weak var imgGnome: UIImageView!
    @IBOutlet weak var infoGnome: UILabel!
    
    @IBOutlet weak var lblProfessions: UILabel!
    @IBOutlet weak var lblFriends: UILabel!
    
    
    var gnomeDetail:Brastlewark!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgGnome.sd_setImage(with: URL(string: self.gnomeDetail.thumbnail!), placeholderImage: UIImage(named: "kavakLogo.png"), options: SDWebImageOptions.refreshCached, context: nil)
        
        let name = self.gnomeDetail.name
        let age = self.gnomeDetail.age
        let weight = self.gnomeDetail.weight
        let height = self.gnomeDetail.height
        let hair_color = self.gnomeDetail.hair_color
        
        
        self.infoGnome.text = "name: \(name!) \nage:\(age!) \nweight: \(weight!) \nheight: \(height!) \nhair color: \(hair_color!)"
        
        
        
        for proffesion in self.gnomeDetail.professions!
        {
            self.lblProfessions.text! += "\(proffesion)\n"
        }
        
        for friend in self.gnomeDetail.friends!
        {
            self.lblFriends.text! += "\(friend)\n"
        }
        
        self.lblFriends.adjustsFontSizeToFitWidth = true
        self.lblProfessions.adjustsFontSizeToFitWidth = true
        
    }
    

    

}
