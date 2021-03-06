//
//  GameViewController.swift
//  MAPD724-W2022-ICE1
//
//  Created by Tom Tsiliopoulos on 2022-01-12.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
   

    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var EndButton: UIButton!
    
    //Label Outlets
    @IBOutlet weak var Lives: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var GameOverLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    var currentScene: SKScene!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        ScoreLabel.isHidden = true
        Lives.isHidden = true
        GameOverLabel.isHidden = true
        EndButton.isHidden = true
        // Initialozinf Lives and score
        CollisonManager.gameViewController = self
        //ScoreManager.Score = 0
        //ScoreManager.Lives = 5
        //updateLivesLabel()
        //updateScoreLabel()
        SetScene(sceneName: "StartScene")
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    func updateScoreLabel() -> Void{
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    func updateLivesLabel() -> Void{
        Lives.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView?
        {
            // load the sksscens as current scene
            currentScene = SKScene(fileNamed: sceneName)
            // Load the SKScene from 'GameScene.sks'
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            // Set the scale mode to scale to fit the window
            currentScene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            view.ignoresSiblingOrder = true
            
        }
    }
    func PresentStartScene() {
        StartButton.isHidden =  false
        StartLabel.isHidden = false
        ScoreLabel.isHidden = true
        Lives.isHidden = true
        
    }
    
    func PresentEndScene() {
        GameOverLabel.isHidden = false
        EndButton.isHidden = false
        ScoreLabel.isHidden = true
        Lives.isHidden = true
        SetScene(sceneName: "EndScene")
       
    }
    
   
    @IBAction func StartButton_pressed(_ sender: UIButton) {
        StartButton.isHidden = true
        ScoreLabel.isHidden = false
        StartLabel.isHidden = true
        Lives.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
    
    @IBAction func EndButton(_ sender: UIButton) {
        EndButton.isHidden = true
        GameOverLabel.isHidden = true
        ScoreLabel.isHidden = false
        StartLabel.isHidden = true
        Lives.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
    
}
