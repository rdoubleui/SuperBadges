public extension UITabBarController {
    func addDotAtTabBarItemIndex(index: Int, radius : CGFloat = 5, color : UIColor = UIColor.red, text : String? = nil) {
        let tag = index + 999
        
        removeDotAtTabBarItemIndex(index: index)
        
        let dotRadius: CGFloat = radius
        let dotDiameter = dotRadius * 2
        let TabBarItemCount = CGFloat(self.tabBar.items!.count)
        let HalfItemWidth = view.bounds.width / (TabBarItemCount * 2)
        let imageHalfWidth: CGFloat = (self.tabBar.items![index]).selectedImage!.size.width / 2
        if text == nil {
            let xOffset = HalfItemWidth * CGFloat(index * 2 + 1)
            let TopMargin:CGFloat = 7
            let dot = UIView(frame: CGRect(x: xOffset + imageHalfWidth, y: TopMargin, width: dotDiameter, height: dotDiameter))
            dot.tag = tag
            dot.backgroundColor = color
            dot.layer.cornerRadius = dotRadius
            tabBar.subviews[index + 1].subviews.first?.insertSubview(dot, at: 1)
        } else {
            let xOffset = HalfItemWidth * CGFloat(index * 2 + 1) - 3
            let TopMargin:CGFloat = 3
            let label = UILabel(frame: CGRect(x: xOffset + imageHalfWidth, y: TopMargin, width: dotDiameter, height: dotDiameter))
            label.tag = tag
            label.numberOfLines = 1
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.3
            label.text = text!
            tabBar.subviews[index + 1].subviews.first?.insertSubview(label, at: 1)
        }
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
