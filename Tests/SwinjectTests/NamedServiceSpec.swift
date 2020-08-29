//
//  Copyright © 2020 Swinject Contributors. All rights reserved.
//

import Nimble
import Quick
import Swinject

private enum Sut: NamedService {
    typealias Service = (String) -> Int
}

class NamedServiceSpec: QuickSpec {

    override func spec() {
        it("produces the expected name and type") {
            let expectedType = "\(((String) -> Int).self)"
            let expectedName = "Sut"

            expect("\(Sut.type)") == expectedType
            expect(Sut.name) == expectedName
        }
    }
}
