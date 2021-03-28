//
//  SplashScreenViewController.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var hipoLabel: UILabel!
    @IBOutlet weak var labsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hipo"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        redirectToHome()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hipoLabel.text = ""
        labsLabel.text = ""
        
        let hipoLabel = "HIPO"
        let labsLabel = "Labs"
        
        textLoader(text: hipoLabel, time: 0.4, label: self.hipoLabel)
        textLoader(text: labsLabel, time: 0.2, label: self.labsLabel)
        
    }
    
    private func redirectToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        })
    }
    
    func textLoader(text: String, time: Double, label: UILabel){
        var charIndex = 0.0
        for i in text {
            Timer.scheduledTimer(withTimeInterval: time * charIndex, repeats: false) { (timer) in
                label.text?.append(i)
            }
            charIndex += 1
        }
    }
}
