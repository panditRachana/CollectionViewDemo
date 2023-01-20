//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Rachana Pandit on 02/11/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var CollOfImages:UICollectionView!
    @IBOutlet weak var pageView:UIPageControl!

    var timer = Timer()
    var counter = 0
    
// Array Declaration
    
    var arrFlowerImages = ["Flower1.jpeg","Flower2.jpeg","Flower3.jpeg","flower-4.jpeg","flower-5.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollOfImages.dataSource = self
        CollOfImages.delegate = self
        
        pageView.numberOfPages = arrFlowerImages.count
        pageView.currentPage = 0
        
        DispatchQueue.main.async
        {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.slideImages), userInfo: nil, repeats: true)
        }
    }
 
    @objc func slideImages()
    {
        if counter<arrFlowerImages.count
        {
            CollOfImages.scrollToItem(at: IndexPath(item:counter , section: 0), at: .right, animated: true)
            pageView.currentPage = counter
            counter = counter+1
        }
        else
        {
          counter = 0
          CollOfImages.scrollToItem(at: IndexPath(item:counter , section: 0), at: .right, animated: false)
          pageView.currentPage = counter
        }
    }
    
    
//MARK: CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrFlowerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = self.CollOfImages.dequeueReusableCell(withReuseIdentifier: "CellImages", for: indexPath) as! CollectionImages
        cell.imgFlowers.image = UIImage(named: arrFlowerImages[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.CollOfImages.frame.width, height: 200)
    }
}

