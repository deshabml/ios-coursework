//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Лаборатория on 26.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func createFirstController() -> UINavigationController {
        let fvc = UINavigationController(rootViewController: HabitsViewController())
        fvc.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "rectangle.grid.1x2.fill"), tag: 0)
        return fvc
    }

    func createSecondController() -> UINavigationController {
        let lvc = UINavigationController(rootViewController: InfoViewController())
        lvc.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        return lvc
    }

    func creatTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        tabBar.tabBar.backgroundColor = UIColor(
            red: 247/255,
            green: 247/255,
            blue: 247/255,
            alpha: 0.8)
        tabBar.tabBar.tintColor = UIColor(
            red: 161/255,
            green: 22/255,
            blue: 204/255,
            alpha: 1.0)
        return tabBar
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = creatTabBar()
        window.makeKeyAndVisible()

        self.window = window
    }

}

