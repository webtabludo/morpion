//
//  Model.swift
//  jeux du morpion
//
//  Created by ludo iMac on 23/11/2018.
//  Copyright © 2018 ludo iMac. All rights reserved.
//

import Foundation

struct Model {
    
    
    // Variables
    var cellUsedO: [EtatCell.PositionCell.RawValue] = []
    var cellUsedX: [EtatCell.PositionCell.RawValue] = []
    var cellUsed: [EtatCell.PositionCell.RawValue] = []
    var used: [EtatCell.PositionCell.RawValue:EtatCell.StatutCell.RawValue] = ["a":"rien","b":"rien","c":"rien","d":"rien","e":"rien","f":"rien","g":"rien","h":"rien","i":"rien"]
    
    
    
    // Dictionary combinaison victoire
    
    var victoireArray : [[(EtatCell.PositionCell.RawValue)]] = [[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.b.rawValue,EtatCell.PositionCell.c.rawValue].sorted(),
                                                                [EtatCell.PositionCell.d.rawValue,EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.f.rawValue].sorted(),[EtatCell.PositionCell.g.rawValue,EtatCell.PositionCell.h.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.d.rawValue,EtatCell.PositionCell.g.rawValue].sorted(),[EtatCell.PositionCell.b.rawValue,EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.h.rawValue].sorted(),[EtatCell.PositionCell.c.rawValue,EtatCell.PositionCell.f.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.c.rawValue,EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.g.rawValue].sorted()]
    
    
    
    // Dictionary combinaison proche victoire
    
    var procheVictoireArray : [[(EtatCell.PositionCell.RawValue)]] = [[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.b.rawValue].sorted(),
                                                                      [EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.c.rawValue].sorted(),[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.d.rawValue].sorted(),[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.e.rawValue].sorted(),[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.g.rawValue].sorted(),[EtatCell.PositionCell.a.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.b.rawValue,EtatCell.PositionCell.c.rawValue].sorted(),[EtatCell.PositionCell.b.rawValue,EtatCell.PositionCell.e.rawValue].sorted(),[EtatCell.PositionCell.b.rawValue,EtatCell.PositionCell.h.rawValue].sorted(),[EtatCell.PositionCell.c.rawValue,EtatCell.PositionCell.e.rawValue].sorted(),[EtatCell.PositionCell.c.rawValue,EtatCell.PositionCell.f.rawValue].sorted(),[EtatCell.PositionCell.c.rawValue,EtatCell.PositionCell.g.rawValue].sorted(),[EtatCell.PositionCell.c.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.d.rawValue,EtatCell.PositionCell.e.rawValue].sorted(),[EtatCell.PositionCell.d.rawValue,EtatCell.PositionCell.f.rawValue].sorted(),[EtatCell.PositionCell.d.rawValue,EtatCell.PositionCell.g.rawValue].sorted(),[EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.f.rawValue].sorted(),[EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.g.rawValue].sorted(),[EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.h.rawValue].sorted(),[EtatCell.PositionCell.e.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.f.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.g.rawValue,EtatCell.PositionCell.h.rawValue].sorted(),[EtatCell.PositionCell.g.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),[EtatCell.PositionCell.h.rawValue,EtatCell.PositionCell.i.rawValue].sorted(),]
    
    
    
    
    // Enum état case
    enum EtatCell {
        
        enum StatutCell: String {
            case croix
            case rond
            case rien
        }
        
        enum PositionCell: String {
            case a
            case b
            case c
            case d
            case e
            case f
            case g
            case h
            case i
        }
        case cell(statut:StatutCell.RawValue, position:PositionCell.RawValue)
        
    }
    
    
    
    // Fonction jouer
    mutating func jouer(statut: EtatCell.StatutCell.RawValue, position: EtatCell.PositionCell.RawValue) {
        
        
        guard cellUsed.contains(position) == false else {
            print("\(position) position déja utilisée")
            return  }
        
        if case let EtatCell.cell(stat, posit) = EtatCell.cell(statut: statut, position: position) {
            cellUsed.append(posit)
            used.updateValue(stat, forKey: posit)
            
        }
        print("cellX:\(cellUsedX)  cellO:\(cellUsedO)    celltotatl:\(cellUsed)   used:\(used)")
    }
    
    
    
    // Détermine les cases utilisées Global par X et par O
    
    mutating func misaAJourCase() {
        for (key,value) in used {
            if value == "croix" && value == "rond" {
                cellUsed.append(key)
            }
        }
        
        for (key,value) in used {
            if value == "croix"
            {
                cellUsedX.append(key)
            }
            
        }
        
        for (key,value) in used {
            if value == "rond"
            {
                cellUsedO.append(key)
            }
        }
        
        
    }
    
    
    
    // Donne toute les combinaison possibel en fonction ce qui a été joué
    
    func combinations<T>(source: [T], takenBy : Int) -> [[T]] {
        if(source.count == takenBy) {
            return [source]
        }
        
        if(source.isEmpty) {
            return []
        }
        
        if(takenBy == 0) {
            return []
        }
        
        if(takenBy == 1) {
            return source.map { [$0] }
        }
        
        var result : [[T]] = []
        
        let rest = Array(source.suffix(from: 1))
        let subCombos = combinations(source: rest, takenBy: takenBy - 1)
        result += subCombos.map { [source[0]] + $0 }
        result += combinations(source: rest, takenBy: takenBy)
        return result
    }
    
    
    // Fonction Test victoire
    func victoire (cellUsedBy:[(EtatCell.PositionCell.RawValue)]) -> String {
        var resultat = ""
        let result = combinations(source: cellUsedBy, takenBy: 3)
        
        guard cellUsed.count != 9 else {
            print("Egalité Fin de partie")
            resultat = "Egalité Fin de partie"
            return resultat
        }
        for trigramme in result {
            if victoireArray.contains(trigramme.sorted()) {
                if cellUsedBy == cellUsedX {
                    print("victoire : \(cellUsedBy)")
                    resultat = "Looser"
                } else if cellUsedBy == cellUsedO {
                    print("victoire : \(cellUsedBy)")
                    resultat = "Winner"
                }
            }
        }
        print("resultat:\(resultat)")
        return resultat
    }
    
  
    
    
    
    // Fonction test adversaire proche de la victoire
    
    mutating func almostVictoire () -> String {
        var positString = ""
        
        let result = combinations(source: cellUsedO, takenBy: 2)
        
        for bigramme in result {
            if procheVictoireArray.contains(bigramme.sorted()) {
                
                for trigramme in victoireArray where trigramme.contains(bigramme[0]) && trigramme.contains(bigramme[1]) {
                    
                    let setTri = Set(trigramme)
                    let caseAJouer =  setTri.subtracting(Set(bigramme.sorted()))
                    let position = Array(caseAJouer)
                    
                    if cellUsed.contains(position[0]) {
                        
                        
                    } else {
                        
                        positString = position[0]
                        jouer(statut: "croix", position: positString)
                        
                    }
                }
            }
        }
        
        return positString
    }
    
    
    // Fonction test si je suis proche de la victoire
    
    mutating func almostMyVictoire () -> String {
        var positString = ""
        
        let result = combinations(source: cellUsedX, takenBy: 2)
        
        for bigramme in result {
            if procheVictoireArray.contains(bigramme.sorted()) {
                
                for trigramme in victoireArray where trigramme.contains(bigramme[0]) && trigramme.contains(bigramme[1]) {
                    
                    let setTri = Set(trigramme)
                    let caseAJouer =  setTri.subtracting(Set(bigramme.sorted()))
                    let position = Array(caseAJouer)
                    
                    if cellUsed.contains(position[0]) {
                        
                        
                    } else {
                        
                        positString = position[0]
                        jouer(statut: "croix", position: positString)
                        
                    }
                }
            }
        }
        
        return positString
    }
    
    //Fonction IA
    mutating func choixIA() -> String {
        
        var result = ""
        result = almostMyVictoire()
        if result == "" {
            result = almostVictoire()
            
            if result == ""  {
                
                if !cellUsed.contains(EtatCell.PositionCell.e.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.e.rawValue)
                    result = "e"
                } else if !cellUsed.contains(EtatCell.PositionCell.a.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.a.rawValue)
                    result = "a"
                } else if !cellUsed.contains(EtatCell.PositionCell.c.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.c.rawValue)
                    result = "c"
                } else if !cellUsed.contains(EtatCell.PositionCell.g.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.g.rawValue)
                    result = "g"
                } else if !cellUsed.contains(EtatCell.PositionCell.i.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.i.rawValue)
                    result = "i"
                } else if !cellUsed.contains(EtatCell.PositionCell.b.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.b.rawValue)
                    result = "b"
                } else if !cellUsed.contains(EtatCell.PositionCell.d.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.d.rawValue)
                    result = "d"
                } else if !cellUsed.contains(EtatCell.PositionCell.f.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.f.rawValue)
                    result = "f"
                } else if !cellUsed.contains(EtatCell.PositionCell.h.rawValue) {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.h.rawValue)
                    result = "h"
                } else {
                    
                    jouer(statut: "croix", position: EtatCell.PositionCell.e.rawValue)
                    result = "e"
                }
            }
    }
            return result
        }
   
}



