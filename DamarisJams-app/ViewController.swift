//
//  ViewController.swift
//  DamarisJams-app
//
//  Created by Carlos Lemus on 2/7/17.
//  Copyright © 2017 Carlos Lemus. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: BaseViewController, UITextViewDelegate{

    @IBOutlet weak var txt_about: UITextView!
    
    @IBOutlet weak var lbl_about: UILabel!
    
    let synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.navigationItem.title = "Home"
        
        self.addSlideMenuButton()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func speak_about(_ sender: Any) {
        //Prepare Speech
        let about_text = lbl_about.text
        let speaker = AVSpeechUtterance(string: about_text!)
        
        //Select Speaker
        speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
        speaker.rate = 0.5
        
        //Speak
        synthesizer.speak(speaker)
    }
    
    
    @IBAction func goToWebpage(_ sender: Any) {
        let url = URL(string: "http://www.damarisjams.com")!
        UIApplication.shared.open(url)
    }
    
}

