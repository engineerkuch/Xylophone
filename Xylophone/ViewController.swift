//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I got loaded!")
        
    }


    @IBAction func keyPressed(_ sender: UIButton) {
//        print("I was clicked!")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        playSound(soundName: sender.currentTitle!)
    }
    
    
    func playSound(soundName: String?) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print("[!] Error: \(error.localizedDescription)")
        }
    }
}
