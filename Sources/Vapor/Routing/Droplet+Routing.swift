import HTTP

@_exported import Routing
@_exported import TypeSafeRouting

extension Droplet: RouteBuilder {
    public func register(host: String?, method: Method, path: [String], responder: Responder) {
        router.register(host: host, method: method, path: path, responder: responder)
    }
}

extension Int {
    public init?(_ string: String) {
        guard let int = string.int else {
            return nil
        }
        self = int
    }
}
