

import UIKit


class ViewController: UIViewController  {
    
    var array1 = [0,1,2,3,4,5,6,7,8,9]
    var array2 = [0,1,2]
    var array3 = [0,1,2,3,4,5]
    
    var num = 0
    var limitNumSw = false
    var limitNumSw_1 = false
    
    var fullURL: URL!
    
    
    @IBOutlet weak var pickView: UIPickerView!
    
    func pick_use()  {
        stroeNumber = num
        display.text = "\(stroeNumber)"
    }
    
    func pickClear()  {
        
        pickView.selectRow(0, inComponent: 0, animated: true)
        pickView.selectRow(0, inComponent: 1, animated: true)
        pickView.selectRow(0, inComponent: 2, animated: true)
//        stroeNumber = 0
    }
    
    func pickChange()  {
        
        num = stroeNumber
        
        let x1 = stroeNumber % 10
        let x2 = (stroeNumber / 10) % 10
        let x3 = stroeNumber / 100
        
        if stroeNumber < 200 {
            limitNumSw = false
            pickView.reloadAllComponents()
        }else {
            limitNumSw = true
            pickView.reloadAllComponents()
        }
        
        if stroeNumber < 250 {
            limitNumSw_1 = false
            pickView.reloadAllComponents()
        }else {
            limitNumSw_1 = true
            pickView.reloadAllComponents()
        }
        
        pickView.selectRow(x3, inComponent: 0, animated: true)
        pickView.selectRow(x2, inComponent: 1, animated: true)
        pickView.selectRow(x1, inComponent: 2, animated: true)
        
    }
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var saveNumber: UIBarButtonItem!
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        app.dataArray.removeAll()
        saveNumber.title = "\(app.dataArray.count)"
        
        (app.dataArray as NSArray).write(to: fullURL, atomically: true)
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
//        print("\(app.dataArray.count)")
        app.dataArray.append(stroeNumber)
        saveNumber.title = "\(String(describing: app.dataArray.count))"
        
        //...存plist
        (app.dataArray as NSArray).write(to: fullURL, atomically: true)
    }
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
        if stroeNumber < 255{
            stroeNumber = stroeNumber + 1
        }
        display.text = "\(stroeNumber)"
        enterTotal()
//        pickClear()
        pickChange()
    }
    
    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        if stroeNumber > 0{
            stroeNumber = stroeNumber - 1
        }
        display.text = "\(stroeNumber)"
        enterTotal()
//        pickClear()
        pickChange()
    }
    
    @IBAction func down(_ sender: UISwipeGestureRecognizer) {
        stroeNumber = 1
        display.text = "1"
        enterTotal()
    }
    
    @IBAction func up(_ sender: UISwipeGestureRecognizer) {
        stroeNumber = 255
        display.text = "255"
        enterTotal()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        
        saveNumber.title = "\(app.dataArray.count)"
        
    }
    
    @IBOutlet weak var outlet1: UIButton!
    @IBOutlet weak var outlet2: UIButton!
    @IBOutlet weak var outlet3: UIButton!
    @IBOutlet weak var outlet4: UIButton!
    
    @IBOutlet weak var outlet5: UIButton!
    @IBOutlet weak var outlet6: UIButton!
    @IBOutlet weak var outlet7: UIButton!
    @IBOutlet weak var outlet8: UIButton!
    
    private var stroeNumber = 255;
    
    private var x1 = 1
    private var x2 = 1
    private var x3 = 1
    private var x4 = 1
    private var x5 = 1
    private var x6 = 1
    private var x7 = 1
    private var x8 = 1
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func bt1(_ sender: Any) {
        x1^=1
        let sd = sender as! UIButton
        sd.setTitle("\(x1)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt2(_ sender: UIButton) {
        x2^=1
        sender.setTitle("\(x2)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt3(_ sender: UIButton) {
        x3^=1
        sender.setTitle("\(x3)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt4(_ sender: UIButton) {
        x4^=1
        sender.setTitle("\(x4)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt5(_ sender: UIButton) {
        x5^=1
        sender.setTitle("\(x5)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt6(_ sender: UIButton) {
        x6^=1
        sender.setTitle("\(x6)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt7(_ sender: UIButton) {
        x7^=1
        sender.setTitle("\(x7)", for: .normal)
        total()
//        pickClear()
    }
    @IBAction func bt8(_ sender: UIButton) {
        x8^=1
        sender.setTitle("\(x8)", for: .normal)
        total()
//        pickClear()
    }
    
    func total()  {
//        stroeNumber = x1|x2<<1|x3<<2|x4<<3|x5<<4|x6<<5|x7<<6|x8<<7;
        stroeNumber=x1+x2*2+x3*4+x4*8+x5*16+x6*32+x7*64+x8*128;
        display.text = "\(stroeNumber)"
    }
    
    func enterTotal()  {
        x1=0;
        x2=0;
        x3=0;
        x4=0;
        x5=0;
        x6=0;
        x7=0;
        x8=0;
        outlet1.setTitle("0", for: .normal)
        outlet2.setTitle("0", for: .normal)
        outlet3.setTitle("0", for: .normal)
        outlet4.setTitle("0", for: .normal)
        outlet5.setTitle("0", for: .normal)
        outlet6.setTitle("0", for: .normal)
        outlet7.setTitle("0", for: .normal)
        outlet8.setTitle("0", for: .normal)
        

        
        if((stroeNumber>>0&1)==1){
            outlet1.setTitle("1", for: .normal)
            x1=1;
        }
        
        if((stroeNumber>>1&1)==1){
            outlet2.setTitle("1", for: .normal)
            x2=1;
        }
        
        if((stroeNumber>>2&1)==1){
            outlet3.setTitle("1", for: .normal)
            x3=1;
        }
        
        if((stroeNumber>>3&1)==1){
            outlet4.setTitle("1", for: .normal)
            x4=1;
        }
        
        if((stroeNumber>>4&1)==1){
            outlet5.setTitle("1", for: .normal)
            x5=1;
        }
        
        if((stroeNumber>>5&1)==1){
            outlet6.setTitle("1", for: .normal)
            x6=1;
        }
        
        if((stroeNumber>>6&1)==1){
            outlet7.setTitle("1", for: .normal)
            x7=1;
        }
        
        if((stroeNumber>>7&1)==1){
            outlet8.setTitle("1", for: .normal)
            x8=1;
        }
    }
    
    @IBAction func btAdd(_ sender: UIButton) {
        if stroeNumber < 255{
            stroeNumber = stroeNumber + 1
        }
        display.text = "\(stroeNumber)"
        
        enterTotal()
//        pickClear()
        pickChange()
    }
    
    @IBAction func btReduce(_ sender: UIButton) {
        if stroeNumber > 0{
            stroeNumber = stroeNumber - 1
        }
        display.text = "\(stroeNumber)"
        
        enterTotal()
//        pickClear()
        pickChange()
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        saveNumber.title = "\(app.dataArray.count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //把plist 加入 dataArray
        let documentsURL = FileManager.default.urls(for:
            .documentDirectory, in: .userDomainMask).first!
        fullURL = documentsURL.appendingPathComponent("data.plist")
     
        guard let array = NSArray(contentsOf: fullURL)as? [Int] else {
            return  }
        
        //        print("\(array)")
        app.dataArray = array
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController:  UIPickerViewDataSource , UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0{
            return array2.count
        }else if component == 1 && limitNumSw{
            return array3.count
        }else if component == 2 && limitNumSw_1{
            return array3.count
        }
        return array1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            return "\(array2[row])"
        }
        return "\(array1[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let picker1 = self.pickView.selectedRow(inComponent: 0)
        let picker2 = self.pickView.selectedRow(inComponent: 1)
        let picker3 = self.pickView.selectedRow(inComponent: 2)
        let number = picker1 * 100 + picker2 * 10 + picker3
        print(number)
        
        
        
        switch component {
        case 0://百
            num %= 100
            num += (array1[row] * 100)
            if row == 2{
                limitNumSw = true
                limitNumSw_1 = true
                pickerView.reloadAllComponents()
            }else{
                limitNumSw = false
                limitNumSw_1 = false
                pickerView.reloadAllComponents()
            }
            
            
        case 1://十
            var tmp = num / 10
            tmp %= 10
            num -= tmp * 10
            num += (array1[row] * 10)
            if row == 5{
                limitNumSw_1 = true
                pickerView.reloadAllComponents()
            }else{
                limitNumSw_1 = false
                pickerView.reloadAllComponents()
            }
        case 2://個
            let tmp = num % 10
            num -= tmp
            num += array1[row]
        default:
            break
        }
        // 可以試看看 把數字
        
        if num > 255{
            num = 255
        }
        //        stroeNumber = num
        //        display.text = "\(stroeNumber)"
        pick_use()
        
        
        enterTotal()
        
    }
}
    
    




