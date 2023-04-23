//
//  SharpImageView.swift
//  HW_UIBezierPath_DesignPicture
//
//  Created by 曹家瑋 on 2023/4/23.
//

// 在 SharpImageView.swift 裡加入製造斜邊的程式碼。

import UIKit

class SharpImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let sharpPath = UIBezierPath()
        
        // (0,0) -> (x的寬,0) -> (x寬,y高) -> (0,y高) -> (回到座標)
        sharpPath.move(to: CGPoint.zero)
        sharpPath.addLine(to: CGPoint(x: bounds.width, y: 0))
        sharpPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        // 可用於調整頃斜面比例
        sharpPath.addLine(to: CGPoint(x: 0, y: bounds.height * 0.75))
        sharpPath.close()
        
        let sharpPathLayer = CAShapeLayer()
        sharpPathLayer.path = sharpPath.cgPath
        layer.mask = sharpPathLayer
        
    }
}
