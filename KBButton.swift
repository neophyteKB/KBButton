//
//  KBButton.swift
//  TURNSTR
//
//  Created by Apple on 22/02/16.
//  Copyright © 2016 Neophyte. All rights reserved.
//

import UIKit

@IBDesignable

class KBButton: UIButton {
    
    
    @IBInspectable var borderColor  : UIColor?{
        
        didSet{
            layer.borderColor = borderColor?.CGColor;
        }
    }
    @IBInspectable var borderWidth  : CGFloat = 1.0{
        didSet{
            layer.borderWidth = borderWidth;
        }
    }
    @IBInspectable var cornerRadius : CGFloat = 1.0{
        didSet{
            layer.cornerRadius = cornerRadius;
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var selectedColor : UIColor = UIColor.clearColor(){
        didSet{
            setBackgroundImage(imageFromColor(selectedColor), forState: .Selected)
        }
    }
    @IBInspectable var normalColor : UIColor = UIColor.clearColor(){
        didSet{
            setBackgroundImage(imageFromColor(normalColor), forState: .Normal)
        }
    }
    @IBInspectable var underline : Bool = false{
        didSet{
            if (underline){
                let btnTitle : NSMutableAttributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: self.currentTitle!))
                let range : NSRange = NSMakeRange(0, (self.currentTitle?.characters.count)!)
                btnTitle.addAttributes([NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue, NSForegroundColorAttributeName : (self.titleLabel?.textColor)!], range: range)
                self.setAttributedTitle(btnTitle, forState: self.state)
            }
            else{
                self.setTitle(self.currentTitle, forState: self.state)
            }
        }
    }

    @IBInspectable var badgeValue: String? = "0"{
        didSet{
            let lblBadge = UILabel(frame: CGRectMake(frame.width - 13.0, 0.0, 12.0, 12.0))
            lblBadge.text = badgeValue
            lblBadge.textAlignment = .Center
            lblBadge.adjustsFontSizeToFitWidth = true
            lblBadge.backgroundColor = UIColor(red: 249.0/255.0, green: 142.0/255.0, blue: 32.0/255.0, alpha: 1.0)
            lblBadge.textColor = UIColor.whiteColor()
            lblBadge.font = UIFont.systemFontOfSize(8.0)
            lblBadge.sizeToFit()
            lblBadge.layer.cornerRadius = lblBadge.frame.size.height/2
            lblBadge.clipsToBounds = true
            addSubview(lblBadge)
        }
    }
    
    func imageFromColor(color: UIColor) -> UIImage{
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image
    }

}
