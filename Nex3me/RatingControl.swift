
import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    
    private var ratingButtons = [UIButton]()
    
  
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    

    
    
    

    //MARK: Initializer
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupButtons()
        
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
      
    }
    
    //MARK: Private Methods
    
    private func setupButtons(){
        
        
        
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "black_star", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"empty_start", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"blue_star", in: bundle, compatibleWith: self.traitCollection)
        
        
        
        for index in 0..<5{
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
         updateButtonSelectionStates()
        
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("UI BUtton has Pressed")
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
        
        
    }
    
    
    
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            
            
            
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
            

        }
    }
    

    
}
