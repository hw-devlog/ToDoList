//
//  MemoListViewController.swift
//  ToDoList
//
//  Created by Hyunwoo Lee on 2023/08/04.
//

import UIKit

class MemoListViewController: UIViewController {

        
    var editTarget: Memo?
   
    
    @IBAction func cancle(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    @IBAction func save(_ sender: Any) {
        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "내용을 입력해주세요.")
            return
        }
        if let target = editTarget {
            target.content = memo
            NotificationCenter.default.post(name: MemoListViewController.newMemoDisInsert, object: nil)
        } else {
            let newMemo = Memo(content: memo)
            Memo.dummyMemoList.append(newMemo)
            NotificationCenter.default.post(name: MemoListViewController.newMemoDisInsert, object: nil)
        }
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memo = editTarget {
            navigationItem.title = "Memo Editing"
            memoTextView.text = memo.content

        } else {
            navigationItem.title = "New Memo"
            memoTextView.text = ""
        }
 
    }
}
    
    
    extension MemoListViewController{
        static let newMemoDisInsert = Notification.Name(rawValue: "newMemoDisInsert")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


