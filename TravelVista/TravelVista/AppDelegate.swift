//
//  AppDelegate.swift
//  TravelVista
//
//  Created by Amandine Cousin on 13/12/2023.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Créez votre ListViewSwiftUI avec un ListViewModel
        let rootView = ListViewSwiftUI(viewmodel: ListViewModel())

        // Configurez le UIHostingController comme rootViewController
        let hostingController = UIHostingController(rootView: rootView)
        
        // Configurez la fenêtre principale
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = hostingController
        window?.makeKeyAndVisible()

        return true
    }
}

