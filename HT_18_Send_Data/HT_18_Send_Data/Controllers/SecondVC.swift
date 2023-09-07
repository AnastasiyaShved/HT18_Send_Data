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
    
    var color: UIColor = .green
    
    @IBOutlet var colorBG: UIView!
    
    
    
//MARK: - actions -
    @IBAction func doneTab(_ sender: UIButton) {
    }

}








//MARK: - life circle -

//MARK: - private funcs -
//MARK: - novigation -
