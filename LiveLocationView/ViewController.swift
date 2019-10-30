//
//  ViewController.swift
//  LiveLocationView
//
//  Created by MyGlamm on 10/30/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleScale: locationCircle!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var trackView: trackingView!
    
    @IBAction func btnTapped(_ sender: UIButton) {
        //circleScale.transform = circleScale.transform.scaledBy(x: 2, y: 2)
        
       // circleScale.isSelectedColorChange = true
    
      // trackView.islocationCircleViewTransit = true
        
        trackView.animateTolocationCircleViewToTransit =  true
        
        
//        UIView.animate(withDuration: 1,
//                       delay: 0.0,
//                       options: [.curveLinear, .repeat, .autoreverse],
//                       animations: { () -> Void in
//                        self.circleScale.transform = CGAffineTransform(scaleX: 2, y: 2)
//                        self.circleScale.alpha = 0.4
//        }, completion: { (finished: Bool) -> Void in
//             self.circleScale.transform = CGAffineTransform.identity
//        })
        
//        let animation = CATransition()
//        animation.duration = 1.75
//        animation.type = CATransitionType(rawValue: "rippleEffect")
//        self.circleScale.layer.add(animation, forKey: "transition")

        

        
        let pulse = Pulsing(numberOfPulses: Float.infinity, radius: circleScale.frame.width + 10, position: circleScale.center)
        pulse.animationDuration = 1.5
        pulse.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8392156863, blue: 0.8392156863, alpha: 1).cgColor
        
        self.view.layer.insertSublayer(pulse, below: circleScale.layer)
        
        
        
//        UIView.animate(withDuration: 1, animations: {
//            self.circleScale.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }) { (finished) in
//            UIView.animate(withDuration: 1, animations: {
//                self.circleScale.transform = CGAffineTransform.identity
//            })
//        }
        
    }

    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBAction func finishTap(_ sender: UIButton) {
        
        trackView.animateTolocationCircleViewToDelivery =  true
    }
    
}

extension ViewController :  UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! damnTableViewCell
        
        
        return cell
    }
    

    
    
}


class damnTableViewCell : UITableViewCell{
    
    @IBOutlet weak var trackV: trackingView!
}
