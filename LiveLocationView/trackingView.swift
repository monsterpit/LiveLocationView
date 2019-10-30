//
//  trackingView.swift
//  LiveLocationView
//
//  Created by MyGlamm on 10/30/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class trackingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    private var dashedView : HorizontalDashedView!
    
    private var orderStatusLine : UIView!
    
    
    //.isActive = true
    private var locationCircleViewStart : UIImageView!
    
    private var locationCircleViewTransit : UIImageView!
    
    private var locationCircleViewEstimatedDelivery : UIImageView!
    
    
    private var locationCircleViewStartLabel : UILabel!
    
    private var locationCircleViewTransitLabel : UILabel!
    
    private var locationCircleViewEstimatedDeliveryDateLabel : UILabel!
    
    private var estDeliveryLabel : UILabel!
    
    
    private var orderStatusLineWidthAnchor : NSLayoutConstraint?
    
    private var locationCircleViewTransitLeadingAnchor : NSLayoutConstraint?
    
    var animateTolocationCircleViewToTransit : Bool = false {
        
        didSet{
            
            
           animateView()
            
        }
        
    }

    
    
    var animateTolocationCircleViewToDelivery : Bool = false {
        
        didSet{
            
            
            animateView()
            
        }
        
    }
    
    
    
    private func animateView(){
        
        //self.view.layoutIfNeeded()
        
        
        orderStatusLineWidthAnchor?.constant = (frame.maxX - frame.minX) * 0.33
        
        locationCircleViewTransitLeadingAnchor?.constant = (frame.maxX - frame.minX) * 0.33
        
        
        let images : [UIImage]  = [ UIImage(named: "ovalCopy10") ?? UIImage(),UIImage(named: "ovalCopy6") ?? UIImage()]

        
        if self.animateTolocationCircleViewToTransit {
        
        
        locationCircleViewTransit.isHidden = false
        
        locationCircleViewTransit.image = UIImage(named: "ovalCopy6")
        
        self.setNeedsLayout()
        
            
        
        locationCircleViewStart.animationImages = images
        locationCircleViewStart.animationRepeatCount = 1
        locationCircleViewStart.animationDuration = 0.2
        locationCircleViewStart.startAnimating()
        
        
        locationCircleViewStart.image = UIImage(named: "ovalCopy6")
        
        //            UIView.animate(withDuration: 1) { [weak self] in
        //               guard let `self` = self else {return}
        //                self.layoutIfNeeded()
        //            }
        
        UIView.animate(withDuration: 1, animations: {
            [weak self] in
            guard let `self` = self else {return}
            self.layoutIfNeeded()
        }) { [weak self](success) in
            guard let `self` = self else {return}
            
            
             self.locationCircleViewTransitLabel.isHidden = false
            
            let pulse = Pulsing(numberOfPulses: Float.infinity, radius: self.locationCircleViewTransit.frame.width , position: self.locationCircleViewTransit.center)
            pulse.animationDuration = 1.5
            pulse.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8392156863, blue: 0.8392156863, alpha: 1).cgColor
            
            self.layer.insertSublayer(pulse, below: self.locationCircleViewTransit.layer)
                
            
                
            
                //                let animation = CATransition()
                //                animation.duration = 1.75
                //                animation.type = CATransitionType(rawValue: "rippleEffect")
                //                self.locationCircleViewTransit.layer.add(animation, forKey: "transition")
                //
                //                self.locationCircleViewTransit.animationImages = images
                //                self.locationCircleViewTransit.animationRepeatCount = 1
                //                self.locationCircleViewTransit.animationDuration = 1
                //                self.locationCircleViewTransit.startAnimating()
                //                self.locationCircleViewTransit.image = UIImage(named: "ovalCopy6")
                
            }
            

  
            
        }
        else if self.animateTolocationCircleViewToDelivery{
            
            self.orderStatusLineWidthAnchor?.constant = (self.frame.width) - 60
            self.setNeedsLayout()
            
            
            locationCircleViewStart.animationImages = images
            locationCircleViewStart.animationRepeatCount = 1
            locationCircleViewStart.animationDuration = 0.2
            locationCircleViewStart.startAnimating()
            
            
            locationCircleViewStart.image = UIImage(named: "ovalCopy6")
            
            UIView.animate(withDuration: 1, animations: {
                [weak self] in
                guard let `self` = self else {return}
                self.layoutIfNeeded()
                }, completion: {[weak self] (success) in
                    guard let `self` = self else {return}
                    
                    
                    self.locationCircleViewEstimatedDelivery.animationImages = images
                    self.locationCircleViewEstimatedDelivery.animationRepeatCount = 1
                    self.locationCircleViewEstimatedDelivery.animationDuration = 0.2
                    self.locationCircleViewEstimatedDelivery.startAnimating()
                    
                    
                    self.locationCircleViewEstimatedDelivery.image = UIImage(named: "ovalCopy6")
                    
                    
            })
            
            
        }

        
        
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    
    private func setupView(){
        
        
        backgroundColor = .clear
  
        
        addDashedLine()

        addOrderStatuLine()
  
        addFirstCircleWithLabel()
     
        addSecondCircleWithLabel()
        

        
        addThirdCircleWithLabel()

    }
    
    
    private func addDashedLine(){
        
        dashedView = HorizontalDashedView()
        
        dashedView.backgroundColor = .clear
        
        addSubview(dashedView)
        
        dashedView.translatesAutoresizingMaskIntoConstraints = false
        
        dashedView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        
        dashedView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30).isActive = true
        
        dashedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        dashedView.heightAnchor.constraint(equalToConstant: frame.height * 0.1).isActive = true
    }
    
    private func addOrderStatuLine() {
        
        orderStatusLine = UIView()
        
        orderStatusLine.backgroundColor = #colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        
        addSubview(orderStatusLine)
        
        orderStatusLine.translatesAutoresizingMaskIntoConstraints = false
        
        orderStatusLine.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        
        orderStatusLineWidthAnchor = orderStatusLine.widthAnchor.constraint(equalToConstant: 0)
        
        orderStatusLineWidthAnchor?.isActive = true
        
        orderStatusLine.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        orderStatusLine.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
    
    private func addFirstCircleWithLabel(){
        
        locationCircleViewStart = UIImageView(image: UIImage(named: "ovalCopy10"))
        
        locationCircleViewStart.backgroundColor = .clear
        
        addSubview(locationCircleViewStart)
        
        locationCircleViewStart.translatesAutoresizingMaskIntoConstraints = false
        
        
        locationCircleViewStart.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25).isActive = true
        
        locationCircleViewStart.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        locationCircleViewStart.heightAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        
        locationCircleViewStart.widthAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        
        
        
        locationCircleViewStartLabel = UILabel()
        
        locationCircleViewStartLabel.text = "CONFIRMED"
        
        addSubview(locationCircleViewStartLabel)
        
        locationCircleViewStartLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        locationCircleViewStartLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        //locationCircleViewStartLabel.centerYAnchor.constraint(equalTo: locationCircleViewStart.centerYAnchor).isActive = true
        
        locationCircleViewStartLabel.topAnchor.constraint(equalTo: locationCircleViewStart.bottomAnchor, constant: 5).isActive = true
        
        //  locationCircleViewStartLabel.heightAnchor.constraint(equalToConstant: frame.height * 0.4).isActive = true
        
        // locationCircleViewStartLabel.widthAnchor.constraint(equalToConstant: frame.height * 0.4).isActive = true
        
        
        
    }
    
    
    private func addSecondCircleWithLabel(){
        
        locationCircleViewTransit = UIImageView(image: UIImage(named: "ovalCopy10"))
        
        locationCircleViewTransit.isHidden = true
        
        locationCircleViewTransit.backgroundColor = .clear
        
        addSubview(locationCircleViewTransit)
        
        locationCircleViewTransit.translatesAutoresizingMaskIntoConstraints = false
        
        //(frame.maxX - frame.minX) * 0.33
        //locationCircleViewTransit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        locationCircleViewTransitLeadingAnchor =  locationCircleViewTransit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        
        locationCircleViewTransitLeadingAnchor?.isActive = true
        
        // locationCircleViewTransit.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        locationCircleViewTransit.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        locationCircleViewTransit.heightAnchor.constraint(equalToConstant: frame.height * 0.25).isActive = true
        
        locationCircleViewTransit.widthAnchor.constraint(equalToConstant: frame.height * 0.25).isActive = true
        
        
        
        
        locationCircleViewTransitLabel = UILabel()
        
        locationCircleViewTransitLabel.text = "In Transit"
        
        addSubview(locationCircleViewTransitLabel)
        
        locationCircleViewTransitLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationCircleViewTransitLabel.centerXAnchor.constraint(equalTo: locationCircleViewTransit.centerXAnchor,constant: 0).isActive = true
        
        //  locationCircleViewTransitLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: (frame.maxX - frame.minX) * 0.33).isActive = true
        
        //locationCircleViewStartLabel.centerYAnchor.constraint(equalTo: locationCircleViewStart.centerYAnchor).isActive = true
        
        locationCircleViewTransitLabel.centerYAnchor.constraint(equalTo: locationCircleViewStartLabel.centerYAnchor, constant: 0).isActive = true
        
        
        locationCircleViewTransitLabel.isHidden = true
        
    }
    
    private func addThirdCircleWithLabel()
    {
        locationCircleViewEstimatedDelivery = UIImageView(image: UIImage(named: "ovalCopy10"))
        
        
        locationCircleViewEstimatedDelivery.backgroundColor = .clear
        
        addSubview(locationCircleViewEstimatedDelivery)
        
        locationCircleViewEstimatedDelivery.translatesAutoresizingMaskIntoConstraints = false
        
        
        locationCircleViewEstimatedDelivery.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25).isActive = true
        
        // locationCircleViewTransit.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        locationCircleViewEstimatedDelivery.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        locationCircleViewEstimatedDelivery.heightAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        
        locationCircleViewEstimatedDelivery.widthAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        
        
        
        
        locationCircleViewEstimatedDeliveryDateLabel = UILabel()
        
        locationCircleViewEstimatedDeliveryDateLabel.text = "16 Sep 2019"
        
        addSubview(locationCircleViewEstimatedDeliveryDateLabel)
        
        locationCircleViewEstimatedDeliveryDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationCircleViewEstimatedDeliveryDateLabel.centerXAnchor.constraint(equalTo: locationCircleViewEstimatedDelivery.centerXAnchor,constant: 0).isActive = true
        
        //  locationCircleViewTransitLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: (frame.maxX - frame.minX) * 0.33).isActive = true
        
        //locationCircleViewStartLabel.centerYAnchor.constraint(equalTo: locationCircleViewStart.centerYAnchor).isActive = true
        
        locationCircleViewEstimatedDeliveryDateLabel.topAnchor.constraint(equalTo: locationCircleViewEstimatedDelivery.bottomAnchor, constant: 5).isActive = true
        
        
        
        
        
        estDeliveryLabel = UILabel()
        
        estDeliveryLabel.text = "Est. Delivery"
        
        addSubview(estDeliveryLabel)
        
        estDeliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        estDeliveryLabel.centerXAnchor.constraint(equalTo: locationCircleViewEstimatedDeliveryDateLabel.centerXAnchor,constant: 0).isActive = true
        
        //  locationCircleViewTransitLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: (frame.maxX - frame.minX) * 0.33).isActive = true
        
        //locationCircleViewStartLabel.centerYAnchor.constraint(equalTo: locationCircleViewStart.centerYAnchor).isActive = true
        
        estDeliveryLabel.topAnchor.constraint(equalTo: locationCircleViewEstimatedDeliveryDateLabel.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    func setupLabelStrings(firstLabelString : String,secondLabelString : String,thirdLabelString : String,fourthLabelString : String){
        
         locationCircleViewStartLabel.text = firstLabelString
        
         locationCircleViewTransitLabel.text = secondLabelString
        
         locationCircleViewEstimatedDeliveryDateLabel.text = thirdLabelString
        
         estDeliveryLabel.text = fourthLabelString
        
        
        
    }
    
    
    func setupLabelFontStyle(firstLabelFont : UIFont,secondLabelFont : UIFont,thirdLabelFont : UIFont,fourthLabelFont : UIFont){
        
        
        locationCircleViewStartLabel.font = firstLabelFont
        
        locationCircleViewTransitLabel.font = secondLabelFont
        
        locationCircleViewEstimatedDeliveryDateLabel.font = thirdLabelFont
        
        estDeliveryLabel.font = fourthLabelFont
        
    }
    
    func setupLabelFontColor(firstLabelColor : UIColor ,secondLabelColor : UIColor,thirdLabelColor : UIColor,fourthLabelColor : UIColor){
        
        
        locationCircleViewStartLabel.textColor = firstLabelColor
        
        locationCircleViewTransitLabel.textColor = secondLabelColor
        
        locationCircleViewEstimatedDeliveryDateLabel.textColor = thirdLabelColor
        
        estDeliveryLabel.textColor = fourthLabelColor
        
    }
    
    
}









//MARK:- DashedView
class HorizontalDashedView : UIView
{
    override func draw(_ rect: CGRect) {
        
        let  path = UIBezierPath()
        
        let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
        path.move(to: p0)
        
        let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
        path.addLine(to: p1)
        
        let  dashes: [ CGFloat ] = [ 2, 3 ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        path.lineWidth = 2.0
        path.lineCapStyle = .square
        UIColor.white.set()
        path.stroke()
        
        
        //
        //        let colors = [UIColor.red.cgColor,UIColor.blue.cgColor] as CFArray
        //
        //        let endRadius = min(frame.width , frame.height) / 2
        //
        //        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        //
        //        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius:endRadius, options: .drawsBeforeStartLocation)
        
    }
    
    
    
}



//MARK:- DashedView
class VerticalDashedView : UIView
{
    override func draw(_ rect: CGRect) {
        
        let  path = UIBezierPath()
        
        let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
        path.move(to: p0)
        
        let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
        path.addLine(to: p1)
        
        let  dashes: [ CGFloat ] = [ 2, 3 ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        path.lineWidth = 2.0
        path.lineCapStyle = .square
        UIColor.white.set()
        path.stroke()
        
        
        //
        //        let colors = [UIColor.red.cgColor,UIColor.blue.cgColor] as CFArray
        //
        //        let endRadius = min(frame.width , frame.height) / 2
        //
        //        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        //
        //        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius:endRadius, options: .drawsBeforeStartLocation)
        
    }
    
    
    
}



//MARK:- Pulsing Animation
class Pulsing: CALayer {
    
    var animationGroup = CAAnimationGroup()
    
    var initialPulseScale:Float = 0
    var nextPulseAfter:TimeInterval = 0
    var animationDuration:TimeInterval = 1.5
    var radius:CGFloat = 200
    var numberOfPulses:Float = Float.infinity
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init (numberOfPulses:Float = Float.infinity, radius:CGFloat, position:CGPoint) {
        super.init()
        
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        self.cornerRadius = radius
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimationGroup()
            
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
        
        
        
    }
    
    
    func createScaleAnimation () -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: initialPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        
        return scaleAnimation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]
        
        
        return opacityAnimation
    }
    
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = animationDuration + nextPulseAfter
        self.animationGroup.repeatCount = numberOfPulses
        
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        self.animationGroup.timingFunction = defaultCurve
        
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
        
        
    }
    
    
    
}




