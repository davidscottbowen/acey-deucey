//
//  ViewController.swift
//  aceyDeucey
//
//  Created by David  Bowen on 5/26/17.
//  Copyright © 2017 David  Bowen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerCash = 50
    var values = [Int]()
    var cardOneValue = Int()
    var cardTwoValue = Int()
    var cardThreeValue = Int()
    var tempValue = Int()
    var bet = 5
    var pot = 100
    var position = 0
    var cardsInDeck = 52
    var randomNum = 0
    var taken = 0
    var cardImages: [Int : UIImage] = [1 : #imageLiteral(resourceName: "ace_of_spades"),
                                       2 : #imageLiteral(resourceName: "2_of_spades"),
                                       3 : #imageLiteral(resourceName: "3_of_spades"),
                                       4 : #imageLiteral(resourceName: "4_of_spades"),
                                       5 : #imageLiteral(resourceName: "5_of_spades"),
                                       6 : #imageLiteral(resourceName: "6_of_spades"),
                                       7 : #imageLiteral(resourceName: "7_of_spades"),
                                       8 : #imageLiteral(resourceName: "8_of_spades"),
                                       9 : #imageLiteral(resourceName: "9_of_spades"),
                                       10 : #imageLiteral(resourceName: "10_of_spades"),
                                       11 : #imageLiteral(resourceName: "jack_of_spades"),
                                       12 : #imageLiteral(resourceName: "queen_of_spades"),
                                       13 : #imageLiteral(resourceName: "king_of_spades"),
                                       14 : #imageLiteral(resourceName: "ace_of_hearts"),
                                       15 : #imageLiteral(resourceName: "2_of_hearts"),
                                       16 : #imageLiteral(resourceName: "3_of_hearts"),
                                       17 : #imageLiteral(resourceName: "4_of_hearts"),
                                       18 : #imageLiteral(resourceName: "5_of_hearts"),
                                       19 : #imageLiteral(resourceName: "6_of_hearts"),
                                       20 : #imageLiteral(resourceName: "7_of_hearts"),
                                       21 : #imageLiteral(resourceName: "8_of_hearts"),
                                       22 : #imageLiteral(resourceName: "9_of_hearts"),
                                       23 : #imageLiteral(resourceName: "10_of_hearts"),
                                       24 : #imageLiteral(resourceName: "jack_of_hearts"),
                                       25 : #imageLiteral(resourceName: "queen_of_hearts"),
                                       26 : #imageLiteral(resourceName: "king_of_hearts"),
                                       27 : #imageLiteral(resourceName: "ace_of_clubs"),
                                       28 : #imageLiteral(resourceName: "2_of_clubs"),
                                       29 : #imageLiteral(resourceName: "3_of_clubs"),
                                       30 : #imageLiteral(resourceName: "4_of_clubs"),
                                       31 : #imageLiteral(resourceName: "5_of_clubs"),
                                       32 : #imageLiteral(resourceName: "6_of_clubs"),
                                       33 : #imageLiteral(resourceName: "7_of_clubs"),
                                       34 : #imageLiteral(resourceName: "8_of_clubs"),
                                       35 : #imageLiteral(resourceName: "9_of_clubs"),
                                       36 : #imageLiteral(resourceName: "10_of_clubs"),
                                       37 : #imageLiteral(resourceName: "jack_of_clubs"),
                                       38 : #imageLiteral(resourceName: "queen_of_clubs"),
                                       39 : #imageLiteral(resourceName: "king_of_clubs"),
                                       40 : #imageLiteral(resourceName: "ace_of_diamonds"),
                                       41 : #imageLiteral(resourceName: "2_of_diamonds"),
                                       42 : #imageLiteral(resourceName: "3_of_diamonds"),
                                       43 : #imageLiteral(resourceName: "4_of_diamonds"),
                                       44 : #imageLiteral(resourceName: "5_of_diamonds"),
                                       45 : #imageLiteral(resourceName: "6_of_diamonds"),
                                       46 : #imageLiteral(resourceName: "7_of_diamonds"),
                                       47 : #imageLiteral(resourceName: "8_of_diamonds"),
                                       48 : #imageLiteral(resourceName: "9_of_diamonds"),
                                       49 : #imageLiteral(resourceName: "10_of_diamonds"),
                                       50 : #imageLiteral(resourceName: "jack_of_diamonds"),
                                       51 : #imageLiteral(resourceName: "queen_of_diamonds"),
                                       52 : #imageLiteral(resourceName: "king_of_diamonds")
    ]
    
    var cards: [Int : Int] = [1 : 1,
                              2 : 2,
                              3 : 3,
                              4 : 4,
                              5 : 5,
                              6 : 6,
                              7 : 7,
                              8 : 8,
                              9 : 9,
                              10 : 10,
                              11 : 11,
                              12 : 12,
                              13 : 13,
                              14 : 1,
                              15 : 2,
                              16 : 3,
                              17 : 4,
                              18 : 5,
                              19 : 6,
                              20 : 7,
                              21 : 8,
                              22 : 9,
                              23 : 10,
                              24 : 11,
                              25 : 12,
                              26 : 13,
                              27 : 1,
                              28 : 2,
                              29 : 3,
                              30 : 4,
                              31 : 5,
                              32 : 6,
                              33 : 7,
                              34 : 8,
                              35 : 9,
                              36 : 10,
                              37 : 11,
                              38 : 12,
                              39 : 13,
                              40 : 1,
                              41 : 2,
                              42 : 3,
                              43 : 4,
                              44 : 5,
                              45 : 6,
                              46 : 7,
                              47 : 8,
                              48 : 9,
                              49 : 10,
                              50 : 11,
                              51 : 12,
                              52 : 13
    ]
    
    @IBOutlet weak var cardOneImage: UIImageView!
    @IBOutlet weak var cardTwoImage: UIImageView!
    @IBOutlet weak var cardThreeImage: UIImageView!
    @IBOutlet weak var cardsLeft: UILabel!
    @IBOutlet weak var potAmount: UILabel!
    @IBOutlet weak var betField: UITextField!
    @IBOutlet weak var playerMoney: UILabel!
    @IBOutlet weak var winLoseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 25/255, green: 77/255, blue: 30/255, alpha: 1.0)
        cardOneImage.image = #imageLiteral(resourceName: "hoyleback")
        cardTwoImage.image = #imageLiteral(resourceName: "hoyleback")
        cardThreeImage.image = #imageLiteral(resourceName: "hoyleback")
        potAmount.text = String(pot)
        playerMoney.text = String(playerCash)
        cardsLeft.text = String(cardsInDeck)
        betField.text = String(bet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func deckButtonTapped(_ sender: Any) {
        winLoseLabel.text = ""
        position = position + 1

        if position > 3 {

            cardOneValue = 0
            cardTwoValue = 0
            cardThreeValue = 0
    
            position = 1
        }
        
        cardsInDeck -= 1
        cardsLeft.text = String(cardsInDeck)
        
        var used = true
        
        var attempts = 0
        
        while used {
            attempts = attempts + 1
            let randomNumber = arc4random_uniform(52) + 1;
            let number = Int(randomNumber)
            if cards[number] != 99 {
                used = false
                randomNum = number
            }
            
        }
        
        let key = Int(randomNum)
        
        
        if position == 1 {
            cardOneValue = cards[key]!
            cardOneImage.image = cardImages[key]
        } else if position == 2 {
            cardTwoValue = cards[key]!
            cardTwoImage.image = cardImages[key]
        } else {
            cardThreeValue = cards[key]!
            cardThreeImage.image = cardImages[key]
        }
        
        cards[key] = 99
        
        taken = 0
        
        for i in 1...52 {
            if cards[i] == 99 {
                taken = taken + 1
            }
            
        }
        
        if position == 3 {
            print("cardOneValue: \(cardOneValue) cardTwoValue: \(cardTwoValue) cardThreeValue: \(cardThreeValue)")
            if cardOneValue > cardTwoValue {
                tempValue = cardOneValue
                cardOneValue = cardTwoValue
                cardTwoValue = tempValue
            }
            print("cardOneValue: \(cardOneValue) cardTwoValue: \(cardTwoValue) cardThreeValue: \(cardThreeValue)")
            
            if cardThreeValue > cardOneValue && cardThreeValue < cardTwoValue {
                print("WINNER")
                winLoseLabel.text = "WINNER"
                pot = pot - 5
                potAmount.text = String(pot)
                playerCash = playerCash + 5
                playerMoney.text = String(playerCash)
            } else if cardThreeValue == cardOneValue || cardThreeValue == cardTwoValue {
                print("DRAW")
                winLoseLabel.text = "DRAW"
            } else {
                print("LOSER")
                winLoseLabel.text = "LOSER"
                pot = pot + 5
                potAmount.text = String(pot)
                playerCash = playerCash - 5
                playerMoney.text = String(playerCash)
            }
            
        }
        
    }
    
    
}

