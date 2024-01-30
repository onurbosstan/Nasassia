//
//  TabbarViewController.swift
//  Nasassia
//
//  Created by ONUR BOSTAN on 27.01.2024.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! PhotoViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! PhotoViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! PhotoViewController
        
        vc1.availableCameras = [.ALL, .FHAZ, .RHAZ, .MAST, .CHEMCAM, .MAHLI, .MARDI, .NAVCAM]
        vc2.availableCameras = [.ALL, .FHAZ, .RHAZ, .NAVCAM, .PANCAM, .MINITES]
        vc3.availableCameras = [.ALL, .FHAZ, .RHAZ, .NAVCAM, .PANCAM, .MINITES]
        
        vc1.rover = .Curiosity
        vc2.rover = .Opportunity
        vc2.rover = .Spirit
        
        self.viewControllers = [vc1, vc2, vc3]
        
        self.tabBar.items?[0].title = vc1.rover.description
        self.tabBar.items?[1].title = vc2.rover.description
        self.tabBar.items?[2].title = vc3.rover.description
        
        self.tabBar.items?[0].image = UIImage(named: vc1.rover.description)
        self.tabBar.items?[1].image = UIImage(named: vc2.rover.description)
        self.tabBar.items?[2].image = UIImage(named: vc3.rover.description)
    }
}
