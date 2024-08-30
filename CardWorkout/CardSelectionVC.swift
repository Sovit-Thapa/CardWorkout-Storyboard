//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Sovit Thapa on 2024-08-29.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    let cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons{
            button.layer.cornerRadius = 10
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.09, target: self, selector: #selector(getRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func getRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "KH")
    }
    

    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
