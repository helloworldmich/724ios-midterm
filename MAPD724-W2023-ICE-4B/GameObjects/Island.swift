import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 5.0  // verticalSpeed
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -751) // y<= -876
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 738
        // get a pseudo random number
        let randomY:Int = (randomSource?.nextInt(upperBound: 312))! - 100 // replace 626 -313
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!  //replace verticalSpeed
    }
}
