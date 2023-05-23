import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabBarHeight = self.tabBarController?.tabBar.frame.size.height {
            print("Высота TabBar: \(tabBarHeight)")
        }
        setupTabBar()
    }
    
    private func setupTabBar(){
        viewControllers = [setupVC(viewController: MainViewController(), title: "Главная", image: UIImage(systemName: "house.fill")),
                           setupVC(viewController: CartViewController(), title: "Корзина", image: UIImage(systemName: "cart.fill"))
        ]
        tabBar.barTintColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        let tabBarAppearance = UITabBarAppearance();
        tabBarAppearance.configureWithOpaqueBackground();
        tabBarAppearance.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1);
        tabBar.standardAppearance = tabBarAppearance;
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance;

    }

    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) ->UINavigationController{
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
                
        return navigationVC
    }
}
