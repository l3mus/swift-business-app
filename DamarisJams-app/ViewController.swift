//
//  ViewController.swift
//  DamarisJams-app
//
//  Created by Carlos Lemus on 2/7/17.
//  Copyright © 2017 Carlos Lemus. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var txt_about: UITextView!
    
    @IBOutlet weak var lbl_title: UILabel!
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gestureRecognizer = UIGestureRecognizer(target: self, action: Selector(("handleTap:")))
        lbl_title.addGestureRecognizer(gestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func speak_about(_ sender: Any) {
        //Prepare Speech
        let about_text = txt_about.text
        let speaker = AVSpeechUtterance(string: about_text!)
        
        //Select Speaker
        speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
        speaker.rate = 0.5
        
        //Speak
        synthesizer.speak(speaker)
    }
    
    
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        UIApplication.shared.open(URL(string: "www.damarisjams.com")!, options: [:])
    }
}

