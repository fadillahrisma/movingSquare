//
//  ViewController.swift
//  movingSquare
//
//  Created by Risma Fadillah on 17/05/19.
//  Copyright © 2019 Risma Fadillah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kotak: UIView!
    @IBOutlet weak var koordinat: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(move))
        kotak.addGestureRecognizer(tapGesture)
        
        kotak.layer.cornerRadius = 66
        
        
    }
    
    @objc func move() {
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 9,options: .curveEaseInOut, animations: {
            self.changePos()
            
            //change opacity
            let alpha = Float.random(in: 0.1...1)
            self.kotak.alpha = CGFloat(alpha)
            
            //change color
            let colors:[UIColor] = [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)]
            let randomInt = Int.random(in: 0...3)
            
            self.kotak.backgroundColor = colors[randomInt]
        }) { (isFinish) in
        }
    }
   
    
    
    func changePos() {
        let randomY = Int.random(in: 10...890)
        let randomX = Int.random(in: 10...400)
        kotak.center = CGPoint(x:randomX, y:randomY)
        
        let str = "(\(randomX), \(randomY))"
        koordinat.text = str
    }
    
    
    
    
}

