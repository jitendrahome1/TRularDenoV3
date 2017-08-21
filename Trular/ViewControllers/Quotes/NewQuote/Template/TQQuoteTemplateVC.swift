//
//  TQQuoteTemplateVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 03/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteTemplateVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,KDDragAndDropCollectionViewDataSource,IndicatorInfoProvider {

    var datasource:[String]!
    @IBOutlet var collectionView: UICollectionView!
    
    var dragAndDropManager : KDDragAndDropManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource = ["1","2","3","4","5","6","7"]
        
        self.dragAndDropManager = KDDragAndDropManager(canvas: self.collectionView, collectionViews: [self.collectionView])
        self.collectionView.collectionViewLayout = TQTemplateFlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:-UICollectionView Delegate & Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let templateCell:TQTemplateCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:TQTemplateCell.self), for: indexPath) as! TQTemplateCell
        templateCell.textLbl.text = datasource[indexPath.item]
        templateCell.backgroundColor = .colorWithHexString("#EC4030")
        templateCell.isHidden = false

        if let kdCollectionView = collectionView as? KDDragAndDropCollectionView {
            
            if let draggingPathOfCellBeingDragged = kdCollectionView.draggingPathOfCellBeingDragged {
                
                if draggingPathOfCellBeingDragged.item == indexPath.item {
                    
                    templateCell.isHidden = true
                }
            }
        }
        
        return templateCell
    }
    
    //MARK:- KDDragDropCollectionView Delegate & Datasource
    func collectionView(_ collectionView: UICollectionView, dataItemForIndexPath indexPath: IndexPath) -> AnyObject {
        
        return datasource[indexPath.item] as AnyObject
    }
    
    func collectionView(_ collectionView: UICollectionView, insertDataItem dataItem : AnyObject, atIndexPath indexPath: IndexPath) -> Void {
        
        if let str = dataItem as? String {
            datasource.insert(str, at: indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, deleteDataItemAtIndexPath indexPath : IndexPath) -> Void {
        
        datasource.remove(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, moveDataItemFromIndexPath from: IndexPath, toIndexPath to : IndexPath) -> Void {
        
        let fromItem : String = datasource[from.item]
        datasource.remove(at: from.item)
        datasource.insert(fromItem, at: to.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, indexPathForDataItem dataItem: AnyObject) -> IndexPath? {
        
        if let candidate = dataItem as? String {
            
            for str in datasource {
                if candidate == str {
                    let position = datasource.index(of: str)!
                    let indexPath = IndexPath(item: position, section: 0)
                    return indexPath
                }
            }
        }
        
        return nil
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "TEMPLATE")
    }
    
}

//MARK:- Extension for UICollectionViewDelegateFlowLayout
extension TQQuoteTemplateVC: UICollectionViewDelegateFlowLayout {
    
    fileprivate var sectionInsets: UIEdgeInsets {
        return UIEdgeInsetsMake(15.0, 15.0, 15.0, 15.0)
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 3.0
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left + sectionInsets.right// * CGFloat((itemsPerRow + 1))
        let interitemPadding = max(0.0, CGFloat(itemsPerRow - 1)) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        let heightPerItem = (widthPerItem * 3) / 2
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
}
