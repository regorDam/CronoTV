//
//  ViewController.swift
//  CronoTV
//
//  Created by Black Castle on 19/2/15.
//  Copyright (c) 2015 ___TAULE___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCorono: UILabel!
    @IBOutlet var lblLap: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnLap: UIButton!
    
    private var running = false;
    private var timer = NSTimer()
    private var dateFormatter = NSDateFormatter()
    private var startDate:NSDate!
    private var timeString: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStart.layer.cornerRadius = 0.5 * btnStart.bounds.size.width //Per fer btn rodons
        btnStart.layer.borderWidth = 1 //border el btn
        btnStart.layer.borderColor = UIColor.greenColor().CGColor //color
        btnLap.layer.cornerRadius = 0.5 * btnLap.bounds.size.width
        btnLap.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func update() {
        var currentDate:NSDate = NSDate()
        var timeInterval:NSTimeInterval = currentDate.timeIntervalSinceDate(startDate)
        var timerDate = NSDate(timeIntervalSince1970: timeInterval)
        
        dateFormatter.dateFormat = "mm:ss.SS"
        
       // [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
        
        timeString = dateFormatter.stringFromDate(timerDate)
        lblCorono.text = timeString
        
    }
    @IBAction func startTapped(sender: UIButton) {
        if(!running){
            btnStart.setTitle("Stop", forState:UIControlState.Normal)
            startDate = NSDate()
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0/100.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            running = true
        }
        else{
            btnStart.setTitle("Restart", forState:UIControlState.Normal)
            running = false
            timer.invalidate()
        }
    }

    @IBAction func lapTapped(sender: UIButton) {
        lblLap.text = lblCorono.text
    }
}

