import XCTest
@testable import SwiftyUserDefaultsNamespaces

final class SwiftyUserDefaultsNamespacesTests: XCTestCase {
    func testSubscript() {
        Defaults[\.drawer][\.lineWidth] = 5
        XCTAssertEqual(Defaults[\.drawer][\.lineWidth], 5)
        
        Defaults[\.drawer][\.color] = .red
        XCTAssertEqual(Defaults[\.drawer][\.color], .red)
        
        Defaults[\.drawer].remove(\.color)
        XCTAssertEqual(Defaults[\.drawer][\.color], .black)
        
        Defaults[\.drawer].removeAll()
        XCTAssertEqual(Defaults[\.drawer][\.lineWidth], nil)
    }
    
    #if swift(>=5.1)
    func testDynamicMemberLookup() {
        Defaults.drawer.lineWidth = 6
        XCTAssertEqual(Defaults.drawer.lineWidth, 6)
        
        Defaults.drawer.color = .white
        XCTAssertEqual(Defaults.drawer.color, .white)
        
        Defaults.drawer.remove(\.color)
        XCTAssertEqual(Defaults.drawer.color, .black)
        
        Defaults.drawer.removeAll()
        XCTAssertEqual(Defaults.drawer.lineWidth, nil)
    }
    #endif
    
    func testObservation() {
        var value: Double?
        let disposable = Defaults[\.drawer].observe(\.lineWidth) { update in
            value = update.newValue ?? nil
        }
        withExtendedLifetime(disposable) {
            Defaults[\.drawer][\.lineWidth] = 7
            XCTAssertEqual(value, 7)
        }
    }
}
