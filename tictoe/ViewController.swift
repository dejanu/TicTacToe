//
//  ViewController.swift
//  tictoe
//
//  Created by OLPS RO TV on 1/3/18.
//  Copyright © 2018 OLPS RO TV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // class variables
    
    //variable for each turn
    var playerTurn : Int = 1 //cross starts
    
    //array for board var boardArr = [Int] (count:9, repeatedValue:0)
    var boardArray = [0,0,0,0,0,0,0,0,0]
    
    //winning combos
    let winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    //game ongoing
    var gameActive = true
    
    //result label
    var result = UILabel()
    
    
    //where & how it is called ?????
    @IBAction func action(_ sender: AnyObject) {
       
        if (boardArray[sender.tag-1]==0 && gameActive==true)
            {
                //modify the array
                boardArray[sender.tag-1] = playerTurn
                
                //if cross then change nouhgt
                if (playerTurn == 1){
                    sender.setImage(UIImage(named:"cross.png"),for:UIControlState())
                    playerTurn = 2
            
                }
                    //else put nought
                else {
                    sender.setImage(UIImage(named:"nought.png"), for: UIControlState())
                    playerTurn = 1

                    }
            }
        
        //iterate through winningCombos
        for i in winningCombos{
            if boardArray[i[0]] != 0 && boardArray[i[0]] == boardArray[i[1]] && boardArray[i[1]] == boardArray[i[2]]{
                
                        //stop game
                        gameActive = false
                
                if boardArray[i[0]] == 1{
                            //cross aka player1 has won
                            result.text = "Player1 WON"
                            result.textColor=UIColor.yellow
                            result.frame = CGRect(x: 100,
                                                  y: 10,
                                                  width: 100,
                                                  height: 100)
                            self.view.addSubview(result)
                    
                            }
                else{
                    //nought aka player2 has won
                    result.text = "Player2 WON"
                    result.textColor=UIColor.yellow
                    result.frame = CGRect(x: 100,
                                          y: 10,
                                          width: 110,
                                          height: 120)

                    self.view.addSubview(result)
                    
                }
                //recover label
                result.isHidden = false
                
                
                
                    }
        }
        
}
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call score view
        self.ScoreView()
        
        
        //add button
        let resetButton = UIButton()
        resetButton.setTitle("Restart", for: UIControlState.normal)
        resetButton.backgroundColor = UIColor.orange
        resetButton.frame =  CGRect(x: 10, y: 250, width: 80, height: 80)
        resetButton.layer.borderWidth = 3
        resetButton.layer.cornerRadius = 30
        
        //make it look like a button
        resetButton.layer.borderWidth = 2
        resetButton.layer.cornerRadius = 40
        
        
        //bind button to event = can't figure out the f** logic ???
        resetButton.addTarget(self, action: #selector(buttonClicked(button:)), for: .touchUpInside)
        
        self.view.addSubview(resetButton)
        
    }
    //funct for restarting the game
    @objc func buttonClicked(button: UIButton){
            print("test")
            result.isHidden = true
            boardArray = [0,0,0,0,0,0,0,0,0]
            gameActive = true
            playerTurn = 1
        //remove images from buttons
        for i in 1...9{
            let button =  view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:UIControlState())
                }
        
        }
        
    

    func ScoreView(){
        let Container = UIView()
        //view width and height
        let XX = self.view.frame.width
        let YY = self.view.frame.height
        
        Container.frame = CGRect(x: 0,
                                 y: 0,
                                 width: XX ,
                                 height: YY * 0.5)
        
//        Container.backgroundColor = UIColor(displayP3Red: 0.2,
//                                            green: 0,
//                                            blue: 0.4,
//                                            alpha: 0.8)
        
        //call function for changing background color
        changeBackgroundColor(view: Container, color: UIColor.purple)
        
        self.view.addSubview(Container)
        
        //create label Player1
        let PlayerOne = UILabel()
        PlayerOne.text = "Player1"
        PlayerOne.textColor = UIColor.yellow
        PlayerOne.font = UIFont.boldSystemFont(ofSize: 25)
        PlayerOne.frame = CGRect(x: 0,
                                 y: 50,
                                 width: 100,
                                 height: 100)
        Container.addSubview(PlayerOne)
        
        //create label for vs
        //create label Player1
        let Versus = UILabel()
        Versus.text = "Vs."
        Versus.textColor = UIColor.yellow
        Versus.font = UIFont.boldSystemFont(ofSize: 25)
        Versus.frame = CGRect(x: 0,
                                 y: 100,
                                 width: 100,
                                 height: 100)
        Container.addSubview(Versus)
        

        
        //create label Player2
        let PlayerTwo = UILabel()
        PlayerTwo.text = "Player2"
        PlayerTwo.textColor = UIColor.yellow
        PlayerTwo.font = UIFont.boldSystemFont(ofSize: 25)
        PlayerTwo.frame = CGRect(x: 0,
                                 y: 160,
                                 width: 100,
                                 height: 100)
        Container.addSubview(PlayerTwo)
        
        // container dimensions
        
        let xx = Container.frame.width
        let yy = Container.frame.height
        
        //addlogo
        let LogoView = UIImageView(frame:CGRect(x: xx * 0.5,
                                                y: yy * 0.3,
                                                width: 150,
                                                height: 150))
        LogoView.image = UIImage(named:"logo")
        Container.addSubview(LogoView)
        
        
    }

    //change background color for a view
    func changeBackgroundColor(view:UIView, color:UIColor){
        
        view.backgroundColor = color
    }
}

