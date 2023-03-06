//modified by YatMan Chan 301279592
import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        self.zRotation = -.pi / 2
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // constrain the player on the left boundary-->lower
        if(position.y <= -310)
        {
            position.y = -310
        }
        
        // constrain the player on the right boundary-->upper
        if(position.y >= 310)
        {
            position.y = 310
        }
    }
    
    override func Reset()
    {
        position.x = -640
// get a pseudo random number for the Y position: -310 to 310
        let randomY:Int = (randomSource?.nextInt(upperBound: 620))! - 310
        position.y = CGFloat(randomY)
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
    
}
