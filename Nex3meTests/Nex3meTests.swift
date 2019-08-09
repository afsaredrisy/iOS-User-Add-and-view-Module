//
//  Nex3meTests.swift
//  Nex3meTests
//
//  Created by Introtuce on 08/08/19.
//  Copyright © 2019 Introtuce. All rights reserved.
//

import XCTest
@testable import Nex3me

class Nex3meTests: XCTestCase {

 //MARK: user Class Tests
    
    // Confirm that the User initializer returns a Meal object when passed valid parameters.
    func testUserInitializationSucceeds() {
        
        let img = UIImage()
        //Zero rating test
        let zeroRatingUser = User.init(name: "Zero", rating: 0, dp: img)
        XCTAssertNotNil(zeroRatingUser)
        
         //Highest rating test
        let positivwRating = User.init(name: "High", rating: 5, dp: img)
        XCTAssertNotNil(positivwRating)
        
    }
        
        // Confirm that the User initialier returns nil when passed a negative rating or an empty name.
        func testUserInitializationFails() {
              let img = UIImage()
            
            //Negative Rating test
            let negativeRating = User.init(name: "Negative", rating: -2, dp: img)
            XCTAssertNil(negativeRating)
            
            
            //Empty String test
            
            let emptyName = User.init(name: "", rating: 2, dp: img)
            XCTAssertNil(emptyName)
            
            
            
            //Rating exceed 5
            let exceedRating = User.init(name: "valid", rating: 8, dp: img)
            XCTAssertNil(exceedRating)
            
        
    }
    
    

}
