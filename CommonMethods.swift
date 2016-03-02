//
//  CommonMethods.swift
//  CarPool_S
//
//  Created by Sakshi Jain on 18/09/15.
//  Copyright (c) 2015 Sakshi Jain. All rights reserved.
//

import UIKit

class CommonMethods: NSObject
{
 /* Draw circle and dot pattern
    Input : Set any radius
            Boundary color of dot/Circle
            Fill color of circle
            Count of Dots/Circle
*/
    class func DrawCircleDots_Seats (EmptySeatCount : Int , FilledSeatCount : Int , TotalSeatsCount : Int , DotCircleColor : UIColor) -> CAShapeLayer
    {
        var finalLayer : CAShapeLayer = CAShapeLayer.new()
        
        var startY = (TotalSeatsCount > 4) ? 8 : 12
        var fillSeat = FilledSeatCount
        
        for var i = 0; i < TotalSeatsCount ; i++
        {
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: ((i%4)*8) ,y: ((i/4)*startY)+startY ), radius: CGFloat(2), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            
            if fillSeat > 0
            {
                let DotLayer = CAShapeLayer()
                DotLayer.path = circlePath.CGPath
                DotLayer.fillColor = DotCircleColor.CGColor
                DotLayer.strokeColor = DotCircleColor.CGColor
                DotLayer.lineWidth = 1.0
                finalLayer.addSublayer(DotLayer)
                
                fillSeat = fillSeat - 1
            }
            else if EmptySeatCount > 0
            {
                let DotLayer = CAShapeLayer()
                DotLayer.path = circlePath.CGPath
                DotLayer.fillColor = UIColor.clearColor().CGColor
                DotLayer.strokeColor = DotCircleColor.CGColor
                DotLayer.lineWidth = 1.0
                finalLayer.addSublayer(DotLayer)
            }
        }
    
        return finalLayer
    }
    
    // Only for Circles
    class func DrawCircleDots_Offer (TotalSeatsCount : Int , DotCircleColor : UIColor) -> CAShapeLayer
    {
        var finalLayer : CAShapeLayer = CAShapeLayer.new()
        
        for var i = 0; i < TotalSeatsCount ; i++
        {
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: (i*20)+37 ,y: 25), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            
            let DotLayer = CAShapeLayer()
            DotLayer.path = circlePath.CGPath
            DotLayer.fillColor = UIColor.clearColor().CGColor
            DotLayer.strokeColor = DotCircleColor.CGColor
            DotLayer.lineWidth = 2.0
            finalLayer.addSublayer(DotLayer)
        }
        
        return finalLayer
    }
    
    
    
    
    /* Atributted Text For BUTTON 
       Things can be done: Custom Font Name and size,Color of text
    */
    
    class func  AtributtedTitle (title: String ) -> NSMutableAttributedString
    {
        var finalStr : NSMutableAttributedString = NSMutableAttributedString ()
        
        let smallFont : UIFont = UIFont(name: "YOUR_FONTNAME", size: 14.0)!
        let bigFont : UIFont = UIFont(name: "YOUR_FONTNAME", size: 15.0)!
        
        let small_textAttributes = [
            NSForegroundColorAttributeName: "YOUR_FONT_COLOR_NAME",
            NSFontAttributeName : smallFont
        ]
        let big_textAttributes = [
            NSForegroundColorAttributeName: UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0),
            NSFontAttributeName : bigFont
        ]
        
        if title.lowercaseString.rangeOfString("YOUR STRING") != nil {
            let range : Range = title.lowercaseString.rangeOfString("YOUR STRING")!
            
            if !(range.isEmpty)
            {
                let SubString : String = title.substringToIndex(range.startIndex)
                let SubString1 : String = title.substringWithRange(range)
                
                finalStr.appendAttributedString(NSAttributedString(string: String (format: "    %@",SubString), attributes:big_textAttributes))
                finalStr.appendAttributedString(NSAttributedString(string: String (format: " %@",SubString1), attributes:small_textAttributes))
            }
        }
        else
        {
            finalStr.appendAttributedString(NSAttributedString(string: String (format: "    %@",title), attributes:big_textAttributes))
        }
        
        return finalStr
    }
}