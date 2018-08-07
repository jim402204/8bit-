

import UIKit

class TableViewController2: UITableViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    func alert()  {
        
        let alert = UIAlertController(title: "清除記錄",
                                      message: "確定要清除\(app.dataArray.count)筆記錄嗎？",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "確定", style: .default) { (_ ) in
            self.app.dataArray.removeAll()
            self.tableView.reloadData()
            
            let documentsURL = FileManager.default.urls(for:
                .documentDirectory, in: .userDomainMask).first!
            let fullURL = documentsURL.appendingPathComponent("data.plist")
            
            (self.app.dataArray as NSArray).write(to: fullURL, atomically: true)
            
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel) { (_ ) in
            
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        
        alert()
        
    }
    func dec2bin( number1:Int) -> String {
        var number = number1
        var str = ""
        
        for _  in 0...7 {
            str = "\(number % 2)" + str
            number = number>>1
        }
 
        return str
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // 這邊的運作機制 dataArray 存的的 stroeNumber 再到cell 分別轉換為 2種進制 顯示
        
        
        return app.dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        let num = dec2bin( number1: app.dataArray[indexPath.row] )
        
        cell.textLabel?.text = "2進位: \( num )"
        cell.detailTextLabel?.text = "10進位: \(app.dataArray[indexPath.row])"
        
        
        return cell
    }
    

    /*允許編輯
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.實作編輯
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            app.dataArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .middle )
            // tableView.reloadData()  刷新後IndexPath就對不到了 以致cash
            //新增或移除 更動行數時 必須更改設定的行數來達到匹配 deleteRows有包含刷新動作
            
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*實作排序
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /* 允許排序
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
