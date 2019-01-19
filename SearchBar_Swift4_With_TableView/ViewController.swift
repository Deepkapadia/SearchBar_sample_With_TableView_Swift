//
//  ViewController.swift
//  SearchBar_Swift4_With_TableView
//
//  Created by DeEp KapaDia on 07/07/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var MYListArray = [List]()
    var currentListArray = [List]() //Update Table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupList()
        
        AlterLayout()
        
    }

    private func SetupList() {
        
        //IY Fields
        MYListArray.append(List(name: "Deep Kapadia",work: .IT ,image: "DeepKapadia"))
        MYListArray.append(List(name: "Parth Bawa",work: .IT ,image: "ParthBawa"))
        
        //Others
        MYListArray.append(List(name: "Manan Jadia",work: .others ,image: "MananJadia"))
        MYListArray.append(List(name: "Parth Rashiwala",work: .others ,image: "ParthRashiwala"))
        MYListArray.append(List(name: "Vishnu Mama",work: .others ,image: "VishnuMama"))
       
        currentListArray = MYListArray
        
    }
    
    func AlterLayout(){
        
        TableView.tableHeaderView = UIView()
//        //searchbar in section Header
//    TableView.estimatedSectionHeaderHeight = 50
//        //searchbar in Navigation Bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: SearchBar)
        SearchBar.showsScopeBar = false
        
    }

   
    
    //SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        currentListArray = MYListArray.filter({ List -> Bool in
            
            switch searchBar.selectedScopeButtonIndex{
                
            case 0:
                if searchText.isEmpty {return true}
                return List.name.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty {return true}
                return List.name.lowercased().contains(searchText.lowercased()) && List.work == .IT
            case 2:
                if searchText.isEmpty {return true}
                return List.name.lowercased().contains(searchText.lowercased()) && List.work == .others
            default:
                return false
                
            }
        })
        TableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        case 0:
            currentListArray = MYListArray
        case 1:
            currentListArray = MYListArray.filter({ list -> Bool in
                
                list.work == WorkType.IT
                
            })

        case 2:
            currentListArray = MYListArray.filter({ list -> Bool in
                
                list.work == WorkType.others
                
            })
        default:
            break
        }
        TableView.reloadData()
    }
    
    //Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentListArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as? Gen_Info_Cell else { return UITableViewCell()
            
        }
        cell.nameLBL.text = currentListArray[indexPath.row].name
        cell.WorkLBL.text = currentListArray[indexPath.row].work.rawValue

        cell.img.image = UIImage(named: currentListArray[indexPath.row].image)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return SearchBar
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
}

class List {
    
    let name: String
    let work: WorkType
    let image: String
    
    init(name:String,work: WorkType, image: String) {
        self.name = name
        self.work = work
        self.image = image
    }
    
}

enum WorkType: String {
    
    case IT = "IT"
    case others = "Other"
    
}
