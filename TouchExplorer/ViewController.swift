//  ViewController.swift
//  TouchExplorer
//
//  Created by Daniel Catlett on 5/10/17.
//  Copyright © 2017 Daniel Catlett. All rights reserved.

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var touchesLabel: UILabel!
    @IBOutlet var tapsLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    private func updateLabelsFromTouches(_ touch: UITouch?, allTouches: Set<UITouch>?)
    {
        let numTaps = touch?.tapCount ?? 0
        let tapsMessage = "\(numTaps) taps detected"
        tapsLabel.text = tapsMessage
        
        let numTouches = allTouches?.count ?? 0
        let touchMsg = "\(numTouches) touches detected"
        touchesLabel.text = touchMsg
        
        if(traitCollection.forceTouchCapability == .available)
        {
            forceLabel.text = "Force: \(touch?.force ?? 0)"
        }
        else
        {
            forceLabel.text = "3D Touch not available"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        messageLabel.text = "Touches began"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        messageLabel.text = "Touches Cancelled"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        messageLabel.text = "Touches Ended"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        messageLabel.text = "Drag Detected"
        updateLabelsFromTouches(touches.first, allTouches: event?.allTouches)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
