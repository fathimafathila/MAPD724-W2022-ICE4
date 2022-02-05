import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
  
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    override func CheckBounds()
    {
        if(position.y <= -756)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        
        // randomize vertical speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
                
        // randomize horizontal drift
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        position.y = 756
        //get pseudo randomnnumber -262 to 262
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
                position.x = CGFloat(randomX)
                
        
        position.y = 756
        //get pseudo randomnnumber -756 to 756
        let randomY:Int = (randomSource?.nextInt(upperBound: 20))! + 756
                position.x = CGFloat(randomX)
                isCollding = false
    }
    
   
    override func Start()
    {
        Reset()
        zPosition = 3
        alpha = 0.5
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
        position.x -= horizontalSpeed!
    }
}
