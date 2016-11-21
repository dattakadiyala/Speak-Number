//
//  ViewController.swift
//  Speak Token Number
//
//  Created by Datta on 11/19/16.
//  Copyright © 2016 dvapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    @IBOutlet weak var tokenNumberText: UITextField!
    var synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func speakButton(_ sender: Any) {
        let text = tokenNumberText.text
        let utterance = AVSpeechUtterance(string: text!)
        utterance.voice = AVSpeechSynthesisVoice(language : "en-GB")
        synthesizer.speak(utterance)
        
        
    }
    @IBAction func afterNumber(_ sender: Any) {
        if var tempText: Int = Int(tokenNumberText.text!){
            tempText += 1
            tokenNumberText.text = String(tempText)
        }
        
    }
    
    
    @IBAction func beforeNumber(_ sender: Any) {
        if var tempText: Int = Int(tokenNumberText.text!){
            tempText -= 1
            tokenNumberText.text = String(tempText)
        }
    
    }
    

}
