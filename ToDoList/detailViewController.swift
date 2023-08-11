//
//  detailViewController.swift
//  ToDoList
//
//  Created by Hyunwoo Lee on 2023/08/09.
//

import UIKit

class detailViewController: UIViewController {
    
    
    @IBOutlet weak var memoTableView: UITableView!
    
    var memo: Memo?
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? MemoListViewController{
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        token = NotificationCenter.default.addObserver(forName: MemoListViewController.newMemoDisInsert, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.memoTableView.reloadData()
        })

    }
    

}

extension detailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,  numberOfRowsInSection: Int ) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memocell", for: indexPath)
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath)
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell
        default:
            fatalError()
        }
    }
}
