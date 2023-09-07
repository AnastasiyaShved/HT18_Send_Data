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
    
    

    
//MARK: - actions -
    @IBAction func DoneWithDelegatee() {
        deligate?.colorBackgroundackgroundUpdate(color: colorVC.backgroundColor ?? .gray)
        
    }
    
    @IBAction func DoneWithClosure() {
    }
 

}





//MARK: - life circle -

//MARK: - private funcs -
//MARK: - novigation -
