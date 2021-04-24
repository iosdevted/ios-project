//
//  DiagonalCustomImageView.swift
//  CodeConnectNib
//
//  Created by Ted Hyeong on 21/01/2021.
//

import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {

    // bezierPath
    
    // path -> layer
    
    // layer -> mask
    
    @IBInspectable var innerHeight: CGFloat = 0
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
        
    }
    
    override func layoutSubviews() {
        makeMask()
    }

}
