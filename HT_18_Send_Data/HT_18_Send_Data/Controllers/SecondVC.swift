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
    
    
//MARK: - life circle -
    override func viewDidLoad() {
        super.viewDidLoad()
        colorVC.layer.borderWidth = 1
        colorVC.layer.borderColor = UIColor.darkGray.cgColor
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
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        greenTF.text = formatterForSlider(sender.value)
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        blueTF.text = formatterForSlider(sender.value)
    }
    @IBAction func opacitySlider(_ sender: UISlider) {
        opacityTF.text = formatterForSlider(sender.value)+"%"
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
    
    //MARK: - private funcs -
    private func formatterForSlider (_ value: Float) -> String {
        return String(lround(Double(value)))
    }

    private func formaterForTexFild (_ text: String?) -> Float {
        return Float(String(text ?? "")) ?? 0
    }
}












//MARK: - novigation -
