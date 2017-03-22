//
//  ViewController.swift
//  Clock
//
//  Created by Kenneth Debruyn on 6/03/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    // MARK: - Properties
    var clock = Clock()
    
    
    
    // MARK: - Overridden Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            Now send your app to the background (command shift H)

            Called as part of the transition from the background to the inactive state; 
            Here you can undo many of the changes made on entering the background.
            The VC registers as an observer. This value must not be nil.
                -> NotificationCenter.default.addObserver(self...
            Only notifications sent by this sender (M) are delivered to the observer (VC)
        */
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.updateDisplaylabel),
                                               name: NSNotification.Name.UIApplicationWillEnterForeground,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDisplaylabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Functions
    func updateDisplaylabel() {
        
//        // print current Locale
//        print(Locale.current)
        
        // create a formatter to work with date and time
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from: clock.currentDate as Date)
        displayLabel.text = String(describing: timeString)
        
    }
    
    /*
        Removes the Observer instance from the memory
    */
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


