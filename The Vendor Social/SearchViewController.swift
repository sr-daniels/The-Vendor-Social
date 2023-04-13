//
//  SearchViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 3/15/23.
//

import UIKit
import Parse

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var vendorList = [PFObject]()
    var filteredData: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        filteredData = vendorList
        
        // Initialize a new instance of the Parse class "Vendor"
        let query = PFQuery(className: "Vendor")

        // Execute the query to retrieve all objects in the "Vendor" class
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Handle any errors that occur
                print("Error: \(error.localizedDescription)")
            } else if let objects = objects {
                // If the query was successful, loop through each object
                for object in objects {
                    // Add each object to the vendorList array
                    self.vendorList.append(object)
                    self.filteredData = self.vendorList
                    self.tableView.reloadData()
                    //print("1")
                }
            }
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VendorCell", for: indexPath) as! VendorTableViewCell
        //print("2")

        cell.vendorName.text = filteredData[indexPath.row].object(forKey: "companyName") as? String
        
        return cell

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            filteredData = searchText.isEmpty ? vendorList : vendorList.filter({ (object: PFObject) -> Bool in
                guard let companyName = object.object(forKey: "companyName") as? String else {
                    return false
                }
                // If companyName matches the searchText, return true to include it
                return companyName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            })
        print("i ran")
            
            tableView.reloadData()
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
