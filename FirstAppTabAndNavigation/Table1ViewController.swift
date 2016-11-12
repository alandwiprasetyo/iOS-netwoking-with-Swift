//
//  Table1ViewController.swift
//  FirstAppTabAndNavigation
//
//  Created by Alan Dwi Prasetyo on 11/6/16.
//  Copyright © 2016 Alan Dwi Prasetyo. All rights reserved.
//

import UIKit
import Alamofire

class Table1ViewController: UIViewController, UITableViewDataSource {

    let engineering = ["Informatic Engineering", "Industrial Engineering", "Mechanical Engineering"]
    let medical = ["Doctor Education", "Pharmacy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var name:String
        switch indexPath.section {
        case 0:
            name = engineering[indexPath.row]
        case 1:
            name = medical[indexPath.row]
        default:
            name = "Not found"
        }
        cell.textLabel?.text = name
        return cell
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Engineering"
        case 1:
            return "Medical"
        default:
            return "Not Found"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return engineering.count
        case 1:
            return medical.count
        default:
            return 0
        }
    }
    struct Student {
        var name = ""
        var id:Int = 0
    }
    func getJson() {
        Alamofire.request("https://httpbin.org/get").response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request ?? "")  // original URL request
//            print(response.response ?? "") // HTTP URL response
//            print(response.data ?? "Hello")     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel!.text = "This is row \(indexPath.row)"
//        return cell
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
