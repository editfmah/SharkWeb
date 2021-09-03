import Foundation
import Switchblade

internal var sessionsDB = try! Switchblade(provider: SQLiteProvider(path: "sessions.db"))

public class SharkWeb {
    
    private var port: UInt16
    private var svr: HttpServer
    public init(port: Int, _ registrations: [SRKWebEndpoint]) {
        self.port = UInt16(port)
        self.svr = HttpServer()
        for r in registrations {
            
            if let r = r as? SRKWebHtmlEndpoint {
                var path = "/"
                if let module = r.module {
                    path += module
                    if let controller = r.controller {
                        path += "/"
                        path += controller
                    }
                } else if let controller = r.controller {
                    path += controller
                }
                
                let requestHandler: ((HttpRequest) -> HttpResponse) = { request in
                    let p = WebProcess(navigation: WebNavigationPosition(request))
                    p.user = WebUser(request)
                    r.content(p)
                    return .ok(.html(p.body))
                }
                
                svr.get[path] = requestHandler
                svr.post[path] = requestHandler
                svr.delete[path] = requestHandler
                svr.patch[path] = requestHandler
                
            } else if let r = r as? SRKWebAPIEndpoint {
                
            }
            
        }
        try? self.svr.start(self.port, forceIPv4: true, priority: .userInteractive)
    }
    
}
