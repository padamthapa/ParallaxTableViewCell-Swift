//
//  ViewController.swift
//  ParallexCellSwift
//
//  Created by Paddy on 27/09/14.
//  Copyright (c) 2014 zabingo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var mTableView: UITableView!
    
    var tableSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableSource = ["sample1.jpg",
        "sample2.jpg",
        "sample3.jpg",
        "sample1.jpg",
        "sample2.jpg",
        "sample3.jpg",
        "sample1.jpg",
        "sample2.jpg",
        "sample3.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 121
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableSource.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: ZBParallaxCell? = tableView.dequeueReusableCellWithIdentifier("parallexCell") as? ZBParallaxCell;
        
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "parallexCell") as? ZBParallaxCell
        }
        
        cell?.mImageView.image = UIImage(named: tableSource[indexPath.row])
        
        return cell!;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var visibleCells = self.mTableView.visibleCells()
        
        for item in visibleCells
        {
            var cell = item as ZBParallaxCell
            cell.didScroll(self.mTableView, superView: self.view)
        }
    }

}

