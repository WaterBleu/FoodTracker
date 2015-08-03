//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Jeff Huang on 2015-08-03.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var spacing = 5
    var ratingButtons = [UIButton]()
    
    let filledStarImage = UIImage(named: "filledStar")
    let emptyStarImage = UIImage(named: "emptyStar")
 
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0..<5 {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: .Highlighted)
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in enumerate(ratingButtons) {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    func ratingButtonTapped(button: UIButton) {
        rating = find(ratingButtons, button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in enumerate(ratingButtons) {
            // If the index of a button is less than the rating, that button shouldn't be selected.
            button.selected = index < rating
        }
    }
}
