//
//  DetailViewController.swift
//  StarWalletDemo
//
//  Created by mino on 9/12/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit
import AFNetworking

class DetailViewController: UIViewController {
    
    var TitleSent:String?
    var DescSent:String?
    var PathSent:String?
    
    
    @IBOutlet weak var Titl: UILabel!
    
    @IBOutlet weak var ImagePostr: UIImageView!

    @IBOutlet weak var DSC: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Titl.text = TitleSent
        DSC.text = DescSent
        
      if let imageurl = NSURL(string: PathSent!)
      {
         
         ImagePostr.setImageWith(imageurl as URL)
      }

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
