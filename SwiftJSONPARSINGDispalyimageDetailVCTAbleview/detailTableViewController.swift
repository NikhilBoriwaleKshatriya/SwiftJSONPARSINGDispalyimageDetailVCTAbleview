//
//  detailTableViewController.swift
//  SwiftJSONPARSINGDispalyimageDetailVCTAbleview
//
//  Created by nikhil boriwale on 5/9/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class detailTableViewController: UITableViewController {
    @IBOutlet var artistName: UILabel!
    @IBOutlet var trackCensoredName: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var collectionPrice: UILabel!
    @IBOutlet var collectionExplicitness: UILabel!
    @IBOutlet var country: UILabel!
    @IBOutlet var currency: UILabel!
    @IBOutlet var imageview: UIImageView!
    
   var detailObject: JsonModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        //mera data jitna hey utna he  wo cell ka line dikha ye ga rest wala nahi show krega
  self.tableView.tableFooterView = UIView()
       
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if let data = detailObject{
            artistName.text = data.artistName

        }
        if let trackcensor = detailObject{
            trackCensoredName.text = trackcensor.trackCensoredName
          
        }
        if let releasedata = detailObject{
             releaseDate.text = releasedata.releaseDate
        }
        if let collectionprc = detailObject{
            collectionPrice.text = collectionprc.collectionPrice

        }
        if let collectionExplicitnessss = detailObject{
            collectionExplicitness.text = collectionExplicitnessss.collectionExplicitness
            
        }
        if let mycountry = detailObject{
            country.text = mycountry.country
        }

        if let mycurrency = detailObject{
            currency.text = mycurrency.currency
            
        }
        
        if let myimage = detailObject{
            imageview.kf.setImage(with: URL(string:myimage.artworkUrl100))
        }

        
        
    }
}
