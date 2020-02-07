//
//  HomeTableViewCell.swift
//  Travel
//
//  Created by Tan Yong Lun on 7/2/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            collectionView.delegate = self
            collectionView.dataSource = self
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }

    extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: 80, height: 80)
        }
        
    }
