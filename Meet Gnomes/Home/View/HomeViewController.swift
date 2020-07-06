//
//  ViewController.swift
//  Meet Gnomes
//
//  Created by CHERNANDER04 on 05/07/20.
//  Copyright © 2020 AMPM. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var homeViewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureView()
    }
    
    func configureView() {
        self.activity.startAnimating()
        homeViewModel.retrieveDataList()
        self.bind()
    }
    
    func bind() {
        homeViewModel.refreshData = { () in
            

            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activity.stopAnimating()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gnomeDetail : Brastlewark = (self.homeViewModel.dataArray?.Brastlewark?[indexPath.row])!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GnomeDetailsViewController") as! GnomeDetailsViewController
        
        vc.gnomeDetail = gnomeDetail
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.homeViewModel.dataArray != nil {
            return (self.homeViewModel.dataArray?.Brastlewark!.count)!
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellViewHome
        
        let dataCell: Brastlewark = (self.homeViewModel.dataArray?.Brastlewark?[indexPath.row])!
        cell.lblText.text = dataCell.name
        cell.imgCollection.sd_setImage(with: URL(string: dataCell.thumbnail!), placeholderImage: UIImage(named: "kavakLogo.png"), options: SDWebImageOptions.refreshCached, context: nil)
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}



