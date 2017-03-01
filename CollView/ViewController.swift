//
//  ViewController.swift
//  CollView
//
//  Created by Terje Lønøy on 28/02/2017.
//  Copyright © 2017 Terje Lønøy. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collView : UICollectionView?
    let data : [String] = ["pdf1", "pdf2", "pdf3", "pdf4", "pdf5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Components
    func addCollectionView () {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        
        collView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collView?.register(RedCell.self, forCellWithReuseIdentifier: "Test")
        collView?.delegate = self
        collView?.dataSource = self
        
        view.addSubview(collView!)
        collView?.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func getData () {
        collView?.reloadData()
    }
    
    // MARK: Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collView?.dequeueReusableCell(withReuseIdentifier: "Test", for: indexPath) as! RedCell
        
        cell.setLabelText(string: data[indexPath.row])
        
        return cell
    }
}

