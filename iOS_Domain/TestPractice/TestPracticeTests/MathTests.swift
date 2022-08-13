//
//  MathTests.swift
//  TestPracticeTests
//
//  Created by 塗木冴 on 2022/08/11.
//

import XCTest
@testable import TestPractice

class MathTests: XCTestCase {

    func test() {
        let math = MathItem()
        
        XCTAssertEqual(math.addNumbers(3, 4), 7)
        XCTAssertEqual(math.multiplyNumbers(3, 4), 12)
        XCTAssertFalse(math.isSameNumber(3, 4))
    }

}
