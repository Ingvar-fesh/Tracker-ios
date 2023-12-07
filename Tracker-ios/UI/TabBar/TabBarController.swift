import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = .blue
        
        let trackersViewController = TrackersViewController()
        let statisticsViewController = StatisticsViewController()
        
        trackersViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("tabbar.trackers", comment: ""),
            image: UIImage(systemName: "record.circle.fill"),
            selectedImage: nil
        )
        statisticsViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("tabbar.statistics", comment: ""),
            image: UIImage(systemName: "hare.fill"),
            selectedImage: nil
        )
        
        let controllers = [trackersViewController, statisticsViewController]
        
        viewControllers = controllers
    }
}
