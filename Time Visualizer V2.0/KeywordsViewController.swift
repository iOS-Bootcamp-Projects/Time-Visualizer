//
//  KeywordsViewController.swift
//  Time Visualizer V2.0
//
//  Created by Aamer Essa on 03/12/2022.
//

import UIKit

class KeywordsViewController: UIViewController {

    @IBOutlet weak var kewordsCollection: UICollectionView!
    var keywords = [KeyWords]()
    override func viewDidLoad() {
        super.viewDidLoad()
          
        kewordsCollection.dataSource = self
        kewordsCollection.delegate = self
        // Do any additional setup after loading the view.
        
        let liftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        liftSwipe.direction = .left
       

        view.addGestureRecognizer(liftSwipe)
    }
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .left
        {
           dismiss(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension KeywordsViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = kewordsCollection.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
        cell.keyword.text = keywords[indexPath.row].keyWord
       // cell.line.backgroundColor = UIColor(named: keywords[indexPath.row].color!)
        
        let color = keywords[indexPath.row].color!.components(separatedBy: " ")
        cell.line.backgroundColor = UIColor(cgColor: CGColor(red: Double(color[1])!, green: Double(color[2])!, blue:Double(color[3])!, alpha: 1))
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
            return CGSize(width: ((self.view.frame.size.width/2) - 10), height: 255)
        }
}
