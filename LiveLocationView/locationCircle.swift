//
//  locationCircle.swift
//  LiveLocationView
//
//  Created by MyGlamm on 10/30/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class locationCircle: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var isSelectedColorChange : Bool = false{
        
        didSet{
            //setNeedsDisplay()
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    

    
    
    
    func drawColors(){
        
        
        var colors : CFArray!
        
        if isSelectedColorChange{
        
         colors = [#colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1).cgColor,#colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1).cgColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1).cgColor,#colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1).cgColor] as CFArray
        }
        else{
           colors = [#colorLiteral(red: 0.8470588235, green: 0.8392156863, blue: 0.8392156863, alpha: 1).cgColor,#colorLiteral(red: 0.8470588235, green: 0.8392156863, blue: 0.8392156863, alpha: 1).cgColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.8470588235, green: 0.8392156863, blue: 0.8392156863, alpha: 1).cgColor,#colorLiteral(red: 0.8470588235, green: 0.8392156863, blue: 0.8392156863, alpha: 1).cgColor] as CFArray
        }
        
        
        let endRadius = min(frame.width, frame.height) / 2
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: [0,0.7,0.7,0.85,0.85,1])
        
        // let locations = [0.5,0.5,1,1]
        
        
        // gradient.locations = locations as [NSNumber]
        
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
            
            
    }
    
    
    override func draw(_ rect: CGRect) {
        
        drawColors()
    }
    

}
