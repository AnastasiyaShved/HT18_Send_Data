//
//  SecondVC.swift
//  HT_18_Send_Data
//
//  Created by Apple on 7.09.23.
//

import UIKit

class SecondVC: UIViewController {
    
//MARK: - property -

    @IBOutlet weak var colorVC: UIView!{
        didSet {
        colorVC.backgroundColor = color
        }
    }
    @IBOutlet var colorBG: UIView!
    var color: UIColor = .green
    var deligate: ColorBackgroundUpdateProtocol?
    var complitionHander: ((UIColor) -> ())?
    
    @IBOutlet weak var redSl: UISlider!
    @IBOutlet weak var greenSl: UISlider!
    @IBOutlet weak var blueSl: UISlider!
    @IBOutlet weak var opacitySl: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    @IBOutlet weak var hexColorTF: UITextField!
    @IBOutlet weak var opacityTF: UITextField!
    
    var rgbRedValue = 0
    var rgbGreenValue = 0
    var rgbBlueValue = 0
    var opacity: CGFloat = 100
    
//MARK: - life circle -
    override func viewDidLoad() {
        super.viewDidLoad()
        colorVC.layer.borderWidth = 1
        colorVC.layer.borderColor = UIColor.darkGray.cgColor
        convertToHex()
    }
    
//MARK: - actions -
    @IBAction func DoneWithDelegatee() {
        deligate?.colorBackgroundackgroundUpdate(color: colorVC.backgroundColor ?? .gray)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func DoneWithClosure() {
        _ = complitionHander?(color)
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func redSlider(_ sender: UISlider) {
        redTF.text = formatterForSlider(sender.value)
        rgbRedValue = Int(sender.value)
        convertToHex()
        
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        greenTF.text = formatterForSlider(sender.value)
        rgbGreenValue = Int(sender.value)
        convertToHex()
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        blueTF.text = formatterForSlider(sender.value)
        rgbBlueValue = Int(sender.value)
        convertToHex()
    }
    @IBAction func opacitySlider(_ sender: UISlider) {
        opacityTF.text = formatterForSlider(sender.value) + "%"
        opacity = CGFloat(sender.value)
        convertToHex()
    }
    
    @IBAction func redAction(_ sender: UITextField) {
        redSl.setValue(formaterForTexFild(sender.text), animated: true)
    }
    
    @IBAction func greebAction(_ sender: UITextField) {
        greenSl.setValue(formaterForTexFild(sender.text), animated: true)
    }
    @IBAction func blueAction(_ sender: UITextField) {
        blueSl.setValue(formaterForTexFild(sender.text), animated: true)
    }
    @IBAction func opacityAction(_ sender: UITextField) {
        opacitySl.setValue(formaterForTexFild(sender.text), animated: true)
    }
    
    @IBAction func hexColorAction(_ sender: UITextField) {


    }
    
    
    
    //MARK: - private funcs -
    private func formatterForSlider (_ value: Float) -> String {
        return String(lround(Double(value)))
    }

    private func formaterForTexFild (_ text: String?) -> Float {
        return Float(String(text ?? "")) ?? 0
    }
    private func convertToHex() {
        hexColorTF.text = String(format:"%02X", Int(rgbRedValue)) + String(format:"%02X", Int(rgbGreenValue)) + String(format:"%02X", Int(rgbBlueValue))
        let color = UIColor(red: rgbRedValue, green: rgbGreenValue, blue: rgbBlueValue).withAlphaComponent(CGFloat(opacity / 100))
        colorVC.backgroundColor = color
    }


}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
}
}
















//MARK: - novigation -
