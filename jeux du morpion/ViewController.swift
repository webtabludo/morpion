//
//  ViewController.swift
//  jeux du morpion
//
//  Created by ludo iMac on 23/11/2018.
//  Copyright © 2018 ludo iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isMyTurn = false
    var model = Model()
    var positPlayByIa = ""
    
    @IBOutlet weak var posit1: UIButton!
    @IBOutlet weak var posit2: UIButton!
    @IBOutlet weak var posit3: UIButton!
    @IBOutlet weak var posit4: UIButton!
    @IBOutlet weak var posit5: UIButton!
    @IBOutlet weak var posit6: UIButton!
    @IBOutlet weak var posit7: UIButton!
    @IBOutlet weak var posit8: UIButton!
    @IBOutlet weak var posit9: UIButton!
    
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.isHidden = true
        enabledButton(status: false)
        demarrage()
    }

    // Fonction qui démarre la partie
    
    func demarrage() {

        let alert = UIAlertController(title: "Morpion", message: "Voulez vous commencer la partie ?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Oui", style: .default, handler: { action in
        print("Vous commencez")
            self.myImageView.isHidden = false
            self.enabledButton(status: true)

        })
        alert.addAction(ok)
        let cancel = UIAlertAction(title: "Non", style: .default, handler: { action in
        print("Je commence")
            self.myImageView.isHidden = false
            self.automatisme()
        })
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    
    }
    
    @IBAction func selectCase(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "O"), for: .normal)

            switch sender.tag {
            case 1:
                print("la case a est joué")
                model.jouer(statut: "rond", position: "a")
                automatisme()
            case 2:
                print("la case b est joué")
                model.jouer(statut: "rond", position: "b")
                automatisme()


            case 3:
                print("la case c est joué")
                model.jouer(statut: "rond", position: "c")
                automatisme()


            case 4:
                print("la case d est joué")
                model.jouer(statut: "rond", position: "d")
                automatisme()


            case 5:
                print("la case e est joué")
                model.jouer(statut: "rond", position: "e")
                automatisme()


            case 6:
                print("la case f est joué")
                model.jouer(statut: "rond", position: "f")
                automatisme()


            case 7:
                print("la case g est joué")
                model.jouer(statut: "rond", position: "g")
                automatisme()


            case 8:
                print("la case h est joué")
                model.jouer(statut: "rond", position: "h")
                automatisme()


            case 9:
                print("la case i est joué")
                model.jouer(statut: "rond", position: "i")
                automatisme()

            default :
                print("Sélection Impossible")
            }

        
    }
    
    
    func automatisme () {
        enabledButton(status: false)
        model.misaAJourCase()
        if model.victoire(cellUsedBy: model.cellUsedO) != "" {
            alerte(winner: model.victoire(cellUsedBy: model.cellUsedO))
            
        } else {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.positPlayByIa = self.model.choixIA()
            print("positPlayIA:\(self.positPlayByIa)")
            self.setButtonImageCroix(posit: self.positPlayByIa)
            self.model.misaAJourCase()
            if self.model.victoire(cellUsedBy: self.model.cellUsedX) != "" {
                self.alerte(winner: self.model.victoire(cellUsedBy: self.model.cellUsedX))
            }
            self.positPlayByIa = ""
            self.enabledButton(status: true)
            }
        }
    }
    
    func setButtonImageCroix(posit: String){
        let image = UIImage(named: "x")!
        switch posit {
        case "a":
            self.posit1.setBackgroundImage(image, for: .normal)
        case "b":
            self.posit2.setBackgroundImage(image, for: .normal)
        case "c":
            self.posit3.setBackgroundImage(image, for: .normal)
        case "d":
            self.posit4.setBackgroundImage(image, for: .normal)
        case "e":
            self.posit5.setBackgroundImage(image, for: .normal)
        case "f":
            self.posit6.setBackgroundImage(image, for: .normal)
        case "g":
            self.posit7.setBackgroundImage(image, for: .normal)
        case "h":
            self.posit8.setBackgroundImage(image, for: .normal)
        case "i":
            self.posit9.setBackgroundImage(image, for: .normal)
        default:
            print("lol trop moche les switch case")
            
        }
       
    }
    
    
  
    // Fonction popup Alert fin de jeu
    
    func alerte(winner: String) {
        
        
        
        let alert = UIAlertController(title: "Game Over", message: winner, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.posit1.setBackgroundImage(nil, for: .normal)
            self.posit2.setBackgroundImage(nil, for: .normal)
            self.posit3.setBackgroundImage(nil, for: .normal)
            self.posit4.setBackgroundImage(nil, for: .normal)
            self.posit5.setBackgroundImage(nil, for: .normal)
            self.posit6.setBackgroundImage(nil, for: .normal)
            self.posit7.setBackgroundImage(nil, for: .normal)
            self.posit8.setBackgroundImage(nil, for: .normal)
            self.posit9.setBackgroundImage(nil, for: .normal)
            
            self.demarrage()
            self.model.cellUsed.removeAll()
            self.model.cellUsedO.removeAll()
            self.model.cellUsedX.removeAll()
            self.model.used.removeAll()
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
// Fonction désactiver bouton
    func enabledButton(status: Bool) {
        posit1.isEnabled = status
        posit2.isEnabled = status
        posit3.isEnabled = status
        posit4.isEnabled = status
        posit5.isEnabled = status
        posit6.isEnabled = status
        posit7.isEnabled = status
        posit8.isEnabled = status
        posit9.isEnabled = status
    }
    
    
}

