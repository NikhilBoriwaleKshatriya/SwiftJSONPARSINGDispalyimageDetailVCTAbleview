//
//  ViewController.swift
//  SwiftJSONPARSINGDispalyimageDetailVCTAbleview
//
//  Created by nikhil boriwale on 5/9/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrData = [JsonModel]()
@IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     jsonParsing()
        
    }
    func jsonParsing(){
        let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                for arr in results.arrayValue{
                    self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblArtist.text = arrData[indexPath.row].artistName
        cell.lblTrack.text = arrData[indexPath.row].trackCensoredName
        cell.img.kf.setImage(with: URL(string: arrData[indexPath.row].artworkUrl100))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let passdata : detailTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailTableViewController") as! detailTableViewController
        passdata.detailObject = arrData[indexPath.row]
        self.navigationController?.pushViewController(passdata, animated: true)
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
}
