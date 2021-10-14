//
//  SceneDelegate.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {       
       guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let statusBar =  UIView()
        statusBar.frame = (window?.windowScene?.statusBarManager!.statusBarFrame)!
        statusBar.backgroundColor = UIColor.CustomColor.principalColor
        UIApplication.shared.keyWindow?.addSubview(statusBar)
        let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
        window?.rootViewController = appDelegate?.getFirstController()
        window?.makeKeyAndVisible()
 
    }
}
