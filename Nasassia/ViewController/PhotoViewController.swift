//
//  ImageViewController.swift
//  Nasassia
//
//  Created by ONUR BOSTAN on 27.01.2024.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = RoverPhotoCellFlowLayout(colmnsNumber: 2, minColmnsNumber: 1, minCell: 1)

    }
    
    @IBAction func filterButton(_ sender: Any) {
        let alert = UIAlertController(title: "Select Camera", message: "Select the camera whose photos you want to see", preferredStyle: .actionSheet)
        
        for item in availableCameras ?? []
        {
            let action = UIAlertAction(title: item.description, style: .default) { action in
                
            }
        }
    }
}
extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
