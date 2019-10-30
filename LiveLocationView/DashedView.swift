////
////  DashedView.swift
////  LiveOrderCustomView
////
////  Created by MyGlamm on 10/28/19.
////  Copyright © 2019 MyGlamm. All rights reserved.
////
//
//import UIKit
//
//
//class DashedView : UIView
//{
//    override func draw(_ rect: CGRect) {
//        
//        let  path = UIBezierPath()
//        
//        let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
//        path.move(to: p0)
//        
//        let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
//        path.addLine(to: p1)
//        
//        let  dashes: [ CGFloat ] = [ 2, 3 ]
//        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
//        path.lineWidth = 2.0
//        path.lineCapStyle = .square
//        UIColor.white.set()
//        path.stroke()
//        
//        
////
////        let colors = [UIColor.red.cgColor,UIColor.blue.cgColor] as CFArray
////
////        let endRadius = min(frame.width , frame.height) / 2
////
////        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
////
////        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius:endRadius, options: .drawsBeforeStartLocation)
//        
//    }
//    
//
//    
//}
