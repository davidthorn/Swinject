//
//  Copyright © 2020 Swinject Contributors. All rights reserved.
//

public protocol NamedService {
    associatedtype Service

    static var type: Service.Type { get }
    static var name: String { get }
}

public extension NamedService {
    static var type: Service.Type {
        Service.self
    }

    static var name: String {
        "\(self)"
    }
}
