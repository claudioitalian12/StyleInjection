import XCTest
@testable import StyleInjection

final class StyleInjectionTests: XCTestCase {
    
    func testApplyStyle() {
        let label = UILabel()
        
        let labelStyle = UILabel.stylizable.buildStyle { label in
            label
                .set(\.textAlignment, to: .center)
                .set(\.numberOfLines, to: 0)
        }
        
        labelStyle.applyStyle(to: label)
        
        XCTAssertEqual(label.textAlignment, .center)
        XCTAssertEqual(label.numberOfLines, 0)
    }
    
    func testApplyStyles() {
        let label = UILabel()
        let labelTest = UILabel()
        
        let labelStyle = UILabel.stylizable.buildStyle { label in
            label
                .set(\.textAlignment, to: .center)
                .set(\.numberOfLines, to: 0)
        }
        
        labelStyle.applyStyle(to: label, labelTest)
        
        XCTAssertEqual(label.textAlignment, .center)
        XCTAssertEqual(label.numberOfLines, 0)
        
        XCTAssertEqual(labelTest.textAlignment, .center)
        XCTAssertEqual(labelTest.numberOfLines, 0)
    }
}
