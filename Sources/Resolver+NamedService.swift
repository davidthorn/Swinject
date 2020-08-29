//
//  Copyright © 2020 Swinject Contributors. All rights reserved.
//

public extension Resolver {
    func resolve<Service>(namedServiceType: Service.Type) -> Service.Service? where Service: NamedService {
        self.resolve(namedServiceType.type, name: namedServiceType.name)
    }

    func resolve<Service, Arg0>(namedServiceType: Service.Type,
                                argument: Arg0) -> Service.Service? where Service: NamedService {
        self.resolve(namedServiceType.type, name: namedServiceType.name, argument: argument)
    }
}
