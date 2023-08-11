//
//  MemoListTableViewController.swift
//  ToDoList
//
//  Created by Hyunwoo Lee on 2023/08/04.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        var token: NSObjectProtocol?
        
        deinit {
            if let token = token{
                NotificationCenter.default.removeObserver(token)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            if let vc = segue.destination as? detailViewController{
                vc.memo = Memo.dummyMemoList[indexPath.row]
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = NotificationCenter.default.addObserver(forName: MemoListViewController.newMemoDisInsert, object: nil, queue: OperationQueue.main){
            [weak self] (noti) in self?.tableView.reloadData()
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)
        
        return cell
    }
    
    
    
}
