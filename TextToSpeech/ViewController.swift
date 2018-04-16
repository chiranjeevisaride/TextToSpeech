//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Chiranjeevi Saride on 4/15/18.
//  Copyright © 2018 Chiranjeevi Saride. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {

    var synthesizer  = AVSpeechSynthesizer()
    var totalUtterance : Int = 0
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       textView.layer.cornerRadius = 20
       self.navigationItem.title = "Insta Speech"
    }
    
    
    @IBAction func pause(_ sender: Any) {
        self.synthesizer.pauseSpeaking(at: .word)
    }
    
    @IBAction func stop(_ sender: Any) {
        self.synthesizer.stopSpeaking(at: .immediate)
    }
    
    @IBAction func play(_ sender: Any) {
        if !self.synthesizer.isSpeaking {
            let textParagrphs = self.textView.text.components(separatedBy: ".")
            self.totalUtterance = textParagrphs.count
            for textParagraph in textParagrphs {
                let speechUtterance = AVSpeechUtterance(string: textParagraph)
                speechUtterance.rate = 0.4
                speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-EN")
                print(AVSpeechSynthesisVoice.speechVoices())
              self.synthesizer.speak(speechUtterance)
            }
        } else {
            self.synthesizer.continueSpeaking()
        }
    }
}

