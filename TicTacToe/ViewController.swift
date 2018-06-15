//
//  ViewController.swift
//  TicTacToe
//
//  Created by Deipayan Dash on 14/06/18.
//  Copyright © 2018 Deipayan Dash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playerID: UILabel!
    
    @IBOutlet var winerLabel: UILabel!
    
    @IBAction func playAgain(_ sender: UIButton) {
        activeGame = true
        
        activePlayer = 1
        gamestate = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
                
            }
        }
        
        winerLabel.isHidden = true
        winerLabel.center = CGPoint(x: winerLabel.center.x-1000, y: winerLabel.center.y)

    }
    
    
    var activeGame = true
    
    var activePlayer = 1
    
    //1 is O and 2 is X
    var gamestate = [0,0,0,0,0,0,0,0,0]
    let winningCombs = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let activePosition = sender.tag-1
        if gamestate[activePosition] == 0 && activeGame{
            gamestate[activePosition] = activePlayer
            if activePlayer == 1{
                
                sender.setImage(#imageLiteral(resourceName: "nought.png"), for: [])
                activePlayer=2
                playerID.text = "Cross"
                
            }else {
                sender.setImage(#imageLiteral(resourceName: "cross.png"), for: [])
                activePlayer = 1
                playerID.text = "Nought"
            }
            
            for comb in winningCombs{
                if gamestate[comb[0]] != 0 && gamestate[comb[0]] == gamestate[comb[1]] && gamestate[comb[1]] == gamestate[comb[2]]{
                    activeGame = false
                    winerLabel.isHidden = false
                    if (gamestate[comb[0]] == 1){
                        winerLabel.text = "Noughts won it!!"
                        
                        
                    }else {
                        winerLabel.text = "Crosses won it!!"
                        
                    }
                    UIView.animate(withDuration: 0.5, animations: {
                        self.winerLabel.center = CGPoint(x: self.winerLabel.center.x+1000, y: self.winerLabel.center.y)
                        
                    })
                }
            }
        }

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winerLabel.isHidden = true
        winerLabel.center = CGPoint(x: winerLabel.center.x-1000, y: winerLabel.center.y)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

