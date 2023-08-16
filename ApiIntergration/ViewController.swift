//
//  ViewController.swift
//  ApiIntergration
//
//  Created by Ananth Nair on 08/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var json : [Root]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        
        let url = URL(string: "https://api.github.com/users/hadley/orgs")
        let task = URLSession.shared.dataTask(with: url!)  {
            
            (data,respone,error) in
            do {
                let content = try?JSONDecoder().decode([Root].self, from:data!)
                self.json = content
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return json?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vc = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //vc.lab?.text = json![indexPath.row].login
        var vlue : Root = json![indexPath.row]
        
        vc.lab?.text = vlue.node_id
        
        var stringId = "\(vlue.id!)"
        
        vc.lab1!.text = stringId
        return vc
    }
    
    
}

