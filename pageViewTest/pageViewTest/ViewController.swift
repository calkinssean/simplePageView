//
//  ViewController.swift
//  pageViewTest
//
//  Created by Sean Calkins on 11/11/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    let pageTitles = ["Dogs Drinking Beer", "Beer"]
    var pageImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageImages = ["page1", "page2"]
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "Page View Controller") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(index: 0) as PageContentViewController
        
        let viewControllers = [startVC]
        
        self.pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.height - 60)
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> PageContentViewController {
        
        if self.pageTitles.count == 0 || index >= self.pageTitles.count {
            return PageContentViewController()
        }
        
        let vc: PageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "Content View Controller") as! PageContentViewController
        
        vc.titleText = self.pageTitles[index]
        vc.pageIndex = index
        vc.imageFile = self.pageImages[index]
        
        return vc
        
    }
    
    @IBAction func restartTapped(_ sender: UIButton) {
        
        let startVC = self.viewControllerAtIndex(index: 0) 
        
        let viewControllers = [startVC]
        
        self.pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
    }
    
    // MARK: - PageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! PageContentViewController
        var index = vc.pageIndex as Int
        
        if index == 0 || index == NSNotFound {
            
            return nil
            
        }
        
        index = index - 1
        return self.viewControllerAtIndex(index: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! PageContentViewController
        var index = vc.pageIndex as Int
        
        if index == NSNotFound {
            
            return nil
            
        }
        
        index = index + 1
        
        if index == self.pageTitles.count {
            
            return nil
            
        }
        
        return self.viewControllerAtIndex(index: index)
    
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return self.pageTitles.count
        
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
        
    }
    


}

