//
//  Table2ViewController.swift
//  FirstAppTabAndNavigation
//
//  Created by Alan Dwi Prasetyo on 11/12/16.
//  Copyright © 2016 Alan Dwi Prasetyo. All rights reserved.
//

import UIKit

class Table2ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = NSURL(string: "https://www.vancouvertrails.com/images/comments/photos/20160825_21_36_08_18917309_dscn5996.jpg")!
        let task = URLSession.shared.dataTask(with: imageUrl as URL) { (data, response, error) in
            if error == nil {
                let downloadImage = UIImage(data : data!)
                self.imageView.image = downloadImage
            }
        }
        task.resume();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
