//
//  TQCalendarWeekViewVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCalendarWeekViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource {

    var isForUpcoming:Bool = false
    @IBOutlet var weekTableView: UITableView!
    
    let model: [[UIColor]] = [
                              [UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1")],
                              
                                  [UIColor.colorWithHexString("#91c569")],
                                  [],
                              [UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569")],
                                  [],
                              [UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569")],
                              [UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#91c569"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#9d76c1"),UIColor.colorWithHexString("#93c9ce"),UIColor.colorWithHexString("#91c569")]]
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //MARK:- UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weekCell:TQCalendarWeekCell = self.weekTableView.dequeueReusableCell(withIdentifier: String(describing:TQCalendarWeekCell.self)) as! TQCalendarWeekCell
        
        weekCell.dataSource = model[indexPath.row].count as AnyObject
        
        weekCell.isForUpcoming = isForUpcoming
        weekCell.setWeek = indexPath.row + 1
        return weekCell
    }
    
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TQCalendarWeekCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    //MARK:- UICollectionViewDatasource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return model[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell",
                                                      for: indexPath as IndexPath)
        
        cell.contentView.layer.cornerRadius = 7.5
        cell.contentView.layer.borderWidth = 2.5
        
        cell.contentView.layer.borderColor = model[collectionView.tag][indexPath.item].cgColor
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
}
