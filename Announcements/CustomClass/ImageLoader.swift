//
//  ImageLoader.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

class ImageLoader {
    
    private let cache = NSCache<NSString, AnyObject>()
    
    class var sharedLoader : ImageLoader {
        struct Static {
            static let instance : ImageLoader = ImageLoader()
        }
        return Static.instance
    }
    
    func imageForUrl(urlString: String, completionHandler: @escaping (_ image: UIImage?, _ url: String) -> ()) {
        
        DispatchQueue.global(qos: .background).async {
            
            let data: NSData? = self.cache.object(forKey: urlString as NSString) as? NSData
            
            if let goodData = data {
                let image = UIImage(data: goodData as Data)
                DispatchQueue.main.async {
                    completionHandler(image, urlString)
                }
                return
            }
            
            let session = URLSession.shared
            let request = URLRequest(url: URL(string: urlString)!);
            
            session.dataTask(with: request) { data, response, error in
                
                if (error != nil) {
                    completionHandler(nil, urlString)
                    return
                }
                
                if let data = data{
                    let image = UIImage(data: data)
                    self.cache.setObject(data as AnyObject, forKey: urlString as NSString)
                    DispatchQueue.main.async {
                        completionHandler(image, urlString)
                    }
                }
            }.resume()
            
        }
    }
}
