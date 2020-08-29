//
//  Copyright © 2020 Swinject Contributors. All rights reserved.
//

import Nimble
import Quick
import Swinject

private enum MockNamedService: NamedService {
    typealias Service = (String) -> Int
}

// swiftlint:disable line_length
// swiftlint:disable file_length
class ContainerSpec_NamedService: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
        }

        it("resolves the registered NamedService") {
            let expectedArg = "1701"
            let expectedResult = 1701
            var receivedArg: String?
            var receivedResult: Int?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService
            container.register(namedServiceType: MockNamedService.self) { _ -> MockNamedService.Service in
                return functionToRegister
            }

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the resolved function is the one that has been registered
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
        }

        it("resolves the registered NamedService with one argument") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister = 17.01
            var receivedArgInRegister: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with a Double parameter
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg: Double) -> MockNamedService.Service in
                                receivedArgInRegister = arg
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         argument: expectedArgInRegister)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the resolved function is the one that has been registered
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameter received in the register function is the expected one
            expect(receivedArgInRegister) == expectedArgInRegister
        }

        it("resolves the registered NamedService with two arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
        }

        it("resolves the registered NamedService with three arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
        }

        it("resolves the registered NamedService with four arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?
            let expectedArgInRegister4 = 17.04
            var receivedArgInRegister4: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double, arg4: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                receivedArgInRegister4 = arg4
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3,
                                                         expectedArgInRegister4)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
            expect(receivedArgInRegister4) == expectedArgInRegister4
        }

        it("resolves the registered NamedService with five arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?
            let expectedArgInRegister4 = 17.04
            var receivedArgInRegister4: Double?
            let expectedArgInRegister5 = 17.05
            var receivedArgInRegister5: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double, arg4: Double, arg5: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                receivedArgInRegister4 = arg4
                                receivedArgInRegister5 = arg5
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3,
                                                         expectedArgInRegister4,
                                                         expectedArgInRegister5)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
            expect(receivedArgInRegister4) == expectedArgInRegister4
            expect(receivedArgInRegister5) == expectedArgInRegister5
        }

        it("resolves the registered NamedService with six arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?
            let expectedArgInRegister4 = 17.04
            var receivedArgInRegister4: Double?
            let expectedArgInRegister5 = 17.05
            var receivedArgInRegister5: Double?
            let expectedArgInRegister6 = 17.06
            var receivedArgInRegister6: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double, arg4: Double, arg5: Double, arg6: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                receivedArgInRegister4 = arg4
                                receivedArgInRegister5 = arg5
                                receivedArgInRegister6 = arg6
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3,
                                                         expectedArgInRegister4,
                                                         expectedArgInRegister5,
                                                         expectedArgInRegister6)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
            expect(receivedArgInRegister4) == expectedArgInRegister4
            expect(receivedArgInRegister5) == expectedArgInRegister5
            expect(receivedArgInRegister6) == expectedArgInRegister6
        }

        it("resolves the registered NamedService with seven arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?
            let expectedArgInRegister4 = 17.04
            var receivedArgInRegister4: Double?
            let expectedArgInRegister5 = 17.05
            var receivedArgInRegister5: Double?
            let expectedArgInRegister6 = 17.06
            var receivedArgInRegister6: Double?
            let expectedArgInRegister7 = 17.07
            var receivedArgInRegister7: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double, arg4: Double, arg5: Double, arg6: Double, arg7: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                receivedArgInRegister4 = arg4
                                receivedArgInRegister5 = arg5
                                receivedArgInRegister6 = arg6
                                receivedArgInRegister7 = arg7
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3,
                                                         expectedArgInRegister4,
                                                         expectedArgInRegister5,
                                                         expectedArgInRegister6,
                                                         expectedArgInRegister7)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
            expect(receivedArgInRegister4) == expectedArgInRegister4
            expect(receivedArgInRegister5) == expectedArgInRegister5
            expect(receivedArgInRegister6) == expectedArgInRegister6
            expect(receivedArgInRegister7) == expectedArgInRegister7
        }

        it("resolves the registered NamedService with height arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?
            let expectedArgInRegister4 = 17.04
            var receivedArgInRegister4: Double?
            let expectedArgInRegister5 = 17.05
            var receivedArgInRegister5: Double?
            let expectedArgInRegister6 = 17.06
            var receivedArgInRegister6: Double?
            let expectedArgInRegister7 = 17.07
            var receivedArgInRegister7: Double?
            let expectedArgInRegister8 = 17.08
            var receivedArgInRegister8: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double, arg4: Double, arg5: Double, arg6: Double, arg7: Double, arg8: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                receivedArgInRegister4 = arg4
                                receivedArgInRegister5 = arg5
                                receivedArgInRegister6 = arg6
                                receivedArgInRegister7 = arg7
                                receivedArgInRegister8 = arg8
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3,
                                                         expectedArgInRegister4,
                                                         expectedArgInRegister5,
                                                         expectedArgInRegister6,
                                                         expectedArgInRegister7,
                                                         expectedArgInRegister8)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
            expect(receivedArgInRegister4) == expectedArgInRegister4
            expect(receivedArgInRegister5) == expectedArgInRegister5
            expect(receivedArgInRegister6) == expectedArgInRegister6
            expect(receivedArgInRegister7) == expectedArgInRegister7
            expect(receivedArgInRegister8) == expectedArgInRegister8
        }

        it("resolves the registered NamedService with nine arguments") {
            let expectedArg = "1701"
            let expectedResult = 1701

            var receivedArg: String?
            var receivedResult: Int?
            let expectedArgInRegister1 = 17.01
            var receivedArgInRegister1: Double?
            let expectedArgInRegister2 = 17.02
            var receivedArgInRegister2: Double?
            let expectedArgInRegister3 = 17.03
            var receivedArgInRegister3: Double?
            let expectedArgInRegister4 = 17.04
            var receivedArgInRegister4: Double?
            let expectedArgInRegister5 = 17.05
            var receivedArgInRegister5: Double?
            let expectedArgInRegister6 = 17.06
            var receivedArgInRegister6: Double?
            let expectedArgInRegister7 = 17.07
            var receivedArgInRegister7: Double?
            let expectedArgInRegister8 = 17.08
            var receivedArgInRegister8: Double?
            let expectedArgInRegister9 = 17.09
            var receivedArgInRegister9: Double?

            // Given: a function to register in a Swinject container
            let functionToRegister: MockNamedService.Service = { arg in
                receivedArg = arg
                return expectedResult
            }

            // Given: a registration of this function as a NamedService with some Double parameters
            container.register(namedServiceType: MockNamedService.self,
                               factory: { (_, arg1: Double, arg2: Double, arg3: Double, arg4: Double, arg5: Double, arg6: Double, arg7: Double, arg8: Double, arg9: Double) -> MockNamedService.Service in
                                receivedArgInRegister1 = arg1
                                receivedArgInRegister2 = arg2
                                receivedArgInRegister3 = arg3
                                receivedArgInRegister4 = arg4
                                receivedArgInRegister5 = arg5
                                receivedArgInRegister6 = arg6
                                receivedArgInRegister7 = arg7
                                receivedArgInRegister8 = arg8
                                receivedArgInRegister9 = arg9
                                return functionToRegister
            })

            // When: resolving this NamedService
            let resolvedNamedService = container.resolve(namedServiceType: MockNamedService.self,
                                                         arguments: expectedArgInRegister1,
                                                         expectedArgInRegister2,
                                                         expectedArgInRegister3,
                                                         expectedArgInRegister4,
                                                         expectedArgInRegister5,
                                                         expectedArgInRegister6,
                                                         expectedArgInRegister7,
                                                         expectedArgInRegister8,
                                                         expectedArgInRegister9)

            // Then: the NamedService is resolved
            expect(resolvedNamedService).toNot(beNil())

            // When: executing the resolved function
            receivedResult = resolvedNamedService!(expectedArg)

            // Then: the registered function is called
            expect(receivedArg) == expectedArg
            expect(receivedResult) == expectedResult
            // Then: the parameters received in the register function are the expected one
            expect(receivedArgInRegister1) == expectedArgInRegister1
            expect(receivedArgInRegister2) == expectedArgInRegister2
            expect(receivedArgInRegister3) == expectedArgInRegister3
            expect(receivedArgInRegister4) == expectedArgInRegister4
            expect(receivedArgInRegister5) == expectedArgInRegister5
            expect(receivedArgInRegister6) == expectedArgInRegister6
            expect(receivedArgInRegister7) == expectedArgInRegister7
            expect(receivedArgInRegister8) == expectedArgInRegister8
            expect(receivedArgInRegister9) == expectedArgInRegister9
        }
    }
}
