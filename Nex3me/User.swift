
import UIKit

class User{
    
    var name: String
    var rating: Int
    var dp: UIImage?
    
    
    init?(name: String, rating: Int, dp:UIImage) {
        if name.isEmpty || rating<0
        {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name=name;
        self.dp=dp
        self.rating=rating
    }
    
    
    
}
