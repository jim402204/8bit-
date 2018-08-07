

import UIKit

//extension ViewController:  UIPickerViewDataSource , UIPickerViewDelegate {
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 3
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        
//        if component == 0{
//            return array2.count
//        }else if component == 1 && limitNumSw{
//            return array3.count
//        }else if component == 2 && limitNumSw_1{
//            return array3.count
//        }
//        return array1.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        if component == 0{
//            return "\(array2[row])"
//        }
//        return "\(array1[row])"
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//        switch component {
//        case 0://百
//            num %= 100
//            num += (array1[row] * 100)
//            if row == 2{
//                limitNumSw = true
//                limitNumSw_1 = true
//                pickerView.reloadAllComponents()
//            }else{
//                limitNumSw = false
//                limitNumSw_1 = false
//                pickerView.reloadAllComponents()
//            }
//            
//            
//        case 1://十
//            var tmp = num / 10
//            tmp %= 10
//            num -= tmp * 10
//            num += (array1[row] * 10)
//            if row == 5{
//                limitNumSw_1 = true
//                pickerView.reloadAllComponents()
//            }else{
//                limitNumSw_1 = false
//                pickerView.reloadAllComponents()
//            }
//        case 2://個
//            let tmp = num % 10
//            num -= tmp
//            num += array1[row]
//        default:
//            break
//        }
//        // 可以試看看 把數字
//        
//        if num > 255{
//            num = 255
//        }
//        //        stroeNumber = num
//        //        display.text = "\(stroeNumber)"
//        pick_use()
//        
//        
//        enterTotal()
//        
//    }
//}
