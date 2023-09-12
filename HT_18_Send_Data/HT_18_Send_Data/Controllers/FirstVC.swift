//
//  ViewController.swift
//  HT_18_Send_Data
//
//  Created by Apple on 7.09.23.
//

import UIKit

protocol ColorBackgroundUpdateProtocol {
    func colorBackgroundackgroundUpdate(color: UIColor)
}


class FirstVC: UIViewController {

    @IBOutlet var viewColor: UIView!

    @IBAction func ChangeBG() {

        // with delegates
        let stor2 = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = stor2.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else { return }

        secondVC.view.backgroundColor = viewColor.backgroundColor ?? .gray
        secondVC.deligate = self
        
        // with clousure
        secondVC.complitionHander = { [weak self] color in
            
            self?.view.backgroundColor = color
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension FirstVC: ColorBackgroundUpdateProtocol {
    func colorBackgroundackgroundUpdate(color: UIColor) {
        viewColor.backgroundColor = color
        

    }
    
}







//secondVC.color = viewColor.backgroundColor ?? .gray
//        var stor1 = UIStoryboard(name: "Main", bundle: nil)
//        guard let firstVC = stor1.instantiateViewController(withIdentifier: "FirstVC") as? FirstVC else { return }
//        firstVC. = .blue
