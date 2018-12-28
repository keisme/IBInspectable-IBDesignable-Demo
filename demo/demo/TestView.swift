//
//  TestView.swift
//  demo
//
//  Created by Max on 2018/12/28.
//  Copyright © 2018 JFF. All rights reserved.
//

import UIKit

/* @IBInspectable 支持的类型 */
//Int
//CGFloat
//Double
//String
//Bool
//CGPoint
//CGSize
//CGRect
//UIColor
//UIImage

@IBDesignable class TestView: UIView {

    @IBInspectable var hideContent: Bool = false {
        didSet {
            if hideContent {
                contentLbl.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
}



extension UIView {
    
    public func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        let contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
}
