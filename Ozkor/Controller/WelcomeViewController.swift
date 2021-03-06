//
//  WelcomeViewController.swift
//  Ozkor
//
//  Created by Ahmed Ramy on 4/7/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit
import BubbleTransition

class WelcomeViewController: UIViewController, UIViewControllerTransitioningDelegate
{
    @IBOutlet weak var menuButton: UIButton!
    
    let transition = BubbleTransition()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeUI()
    }
    
    fileprivate func customizeUI()
    {
        menuButton.layer.cornerRadius = menuButton.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MenuViewController
        destination.transitioningDelegate = self
        destination.modalPresentationStyle = .custom
        
    }
    
    
    @IBAction func didTapMenuButton(_ sender: Any)
    {
        performSegue(withIdentifier: "goToMenu", sender: self)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.bubbleColor = menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.bubbleColor = menuButton.backgroundColor!
        
        return transition
    }

}
