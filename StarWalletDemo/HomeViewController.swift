//
//  HomeViewController.swift
//  StarWalletDemo
//
//  Created by mino on 9/12/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit
import AFNetworking

class HomeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
     var DataArr = [item]()
    var selectedTit : String?
    var selectedDes : String?
    var SelectedPath : String?
    
    var collectStringLines:String = ""
    @IBOutlet weak var TableViewList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewList.dataSource = self
        TableViewList.delegate = self
        
        // Path of file
        let path = Bundle.main.path(forResource: "MyData", ofType: "txt")
        
        readDataFromFile(path: path!)        
        TableViewList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataArr.count
    }
    
    // load data in cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ICell", for: indexPath) as! HomeCell
        let ItemRow = DataArr [indexPath.row]
        
         let title = ItemRow.title
         let desc = ItemRow.desc
         let poster = ItemRow.path
        
        if let ImageURL = NSURL(string:poster!)
        {
          //print(ImageURL)
          cell.photo.setImageWith(ImageURL as! URL)
        }
        
        cell.title.text = title
        cell.desc.text = desc
        
        return cell

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     // row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // selected cell in table view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Get selected cell data
        let indexPath = TableViewList.indexPathForSelectedRow!
        let currentCell = (DataArr[indexPath.row])
        
        selectedTit = currentCell.title
        selectedDes = currentCell.desc
        SelectedPath = currentCell.path
   
        performSegue(withIdentifier:"DetailsView", sender: self)
    }
    
    
    // Func read data from file
    func readDataFromFile(path:String) {
        
        let filemgr = FileManager.default
        if filemgr.fileExists(atPath: path)
        {
            do{
                let contents = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                // start get rows from file seprated by  \n
                let readings = contents.components(separatedBy: "\n") as [String]
                // start reading
                for i in 0..<readings.count-1
                {
                    // cells content of one row seprated by comma
                    var data = readings[i].components(separatedBy: ",")
                    // check if read data
                    if  !(data.count<0)
                    {
                        // check if cell 1 contain data
                        if data.count>=0
                        {
                            // check if there are extra lines in cell content and handel
                    
                              if data[0].hasPrefix("\"")
                              {
                    
                                 collectStringLines = collectStringLines + data[0]
                                      continue
                                if data[0].hasSuffix("\"")
                                 {
                                    data[0] = collectStringLines
                                     collectStringLines = ""
                        
                                  }
                
                               }
                        }
                        
                        // check if data no data in cell 2 continue
//                       if data.count>=1
//                        {
//                            
//                          
//                        }
//                       else {
//                        continue
//                        }
                        // check if there is data in cell 3
                        if data.count>=2
                        {
                            
                            // handle if photo not exist
//                            let PhotoExistace = self.CheckIFNoPhoto(str: data[2])
//                            data[2] = PhotoExistace!
                            
                            let result = self.CheckIFContainshttp(str: data[2])
                            if result != nil
                            {
                                data[2] = result!
                            }
                            
                            
                        }
                        else{
                            continue
                        }
                    
                        
                    //print(data[0])
                   // print(data[1])
                   // print(data[2])
                        
                  // init row and fill with data
                   let row =  item(tit: data[0] as String, des:data[1] as String , pa: data[2] as String)
                        
                    // insert row in array
                    DataArr.append(row)
                    //print(DataArr)
                }
        }
                
                
            }catch let error as Error{
                
                print ("Error: \(error)")
                
            }
            
        }
    }
    
    // function check if link of photo not https
    
    func CheckIFContainshttp(str:String)-> String?
    {
        if str.contains("http")
        {
            if str.contains("https")
            {
                
            }
            else{
                let oldstring = str
                let newstring = oldstring.replacingOccurrences(of: "http", with: "https")
               // print(newstring)
                return newstring
            }
        }
        return nil

        
    }
    
    // function check if photo exist or not
    
//    func CheckIFNoPhoto(str:String) ->String?
//    {
//        var newstr = str
//        if newstr == nil
//        {
//            newstr = " "
//        }
//        return newstr
//        
//    }
 


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //Pass the selected object to the new view controller.
        if (segue.identifier == "DetailsView") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! DetailViewController
            // your new view controller should have property that will store passed value
            viewController.DescSent = selectedDes
            viewController.TitleSent = selectedTit
            viewController.PathSent = SelectedPath
            
        
    }
 

  }
}
