public extension UITabBarController {
    func addTextAtTabBarItemIndex(index: Int, xOffset: Int = 18, yOffset: Int = 7, text : String) {
        let labelWidth = 30
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: labelWidth))
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.text = text
        addSubViewAtTabBarItemIndex(index: index, view: label, offset: CGRect(x: xOffset, y: yOffset, width: labelWidth, height: labelWidth))
    }
    
    func addIndicatorAtTabBarItemIndex(index: Int, radius: Int = 5, xOffset: Int = 18, yOffset: Int = 7, color : UIColor = UIColor.red) {
        let dotDiameter = radius * 2
        let dot = UIView(frame: CGRect(x: 0, y: 0, width: dotDiameter, height: dotDiameter))
        dot.backgroundColor = color
        dot.layer.cornerRadius = CGFloat(radius)
        
        addSubViewAtTabBarItemIndex(index: index, view: dot, offset: CGRect(x: xOffset, y: yOffset, width: dotDiameter, height: dotDiameter))
    }
    
    func addSubViewAtTabBarItemIndex(index: Int, view: UIView, offset: CGRect) {
        let tag = index + 999
        
        removeDotAtTabBarItemIndex(index: index)
        
        let holder = UIView(frame: offset)
        holder.tag = tag
        holder.addSubview(view)
        tabBar.subviews[index + 1].subviews.first?.insertSubview(holder, at: 1)
    }
    
    func removeDotAtTabBarItemIndex(index: Int) {
        let tag = index + 999
        
        if let subviews = tabBar.subviews[index + 1].subviews.first?.subviews {
            for subview in subviews where subview.tag == tag {
                subview.removeFromSuperview()
            }
        }
    }
}
