import Core

public final class StaticViewRenderer: ViewRenderer {
    let loader = DataFile()
    
    public let viewsDir: String
    public var cache: [String: View]?
    
    public init(viewsDir: String) {
        self.viewsDir = viewsDir.finished(with: "/")
    }
    
    public func make(_ path: String, _ context: Node) throws -> View {
        let path = path.hasPrefix("/") ? path : viewsDir + path
        if let cached = cache?[path] { return cached }
        let bytes = try loader.read(at: path)
        let view = View(bytes: bytes)
        cache?[path] = view
        return view
    }
}
