//
//  StartScene.swift
//  MAPD724-W2022-ICE4
//
//  Created by Fathima Fathila on 2022-02-10.
//

import SpriteKit
import GameplayKit
class EndScene: SKScene
{
    var ocean: Ocean?
    
    override func didMove( to view: SKView)
    {
        name = "END"
        
        screenWidth = frame.width
        screenHeight = frame.height
        
       
        ocean = Ocean()
        ocean?.position = CGPoint(x: 0, y: 773)
        addChild(ocean!)
    }
    func touchDown(atPoint pos : CGPoint)
    {
       
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
       
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
    }
}
