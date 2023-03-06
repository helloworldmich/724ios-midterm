//modified by YatMan Chan 301279592
import GameplayKit
import SpriteKit


class Cloud : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        self.position.x = 690
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -690)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the horizontalSpeed speed: 5 to 10
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the verticalSpeed speed: -2 to 2
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        // get a pseudo random number for the X position: -262 to 262-->-687 to 687
//        let randomX:Int = (randomSource?.nextInt(upperBound: 1374))! - 687
//        position.x = CGFloat(randomX)
        
        position.x = 690
        
        // get a pseudo random number for the Y position: 902 to 932 --> -286 to 286
        let randomY:Int = (randomSource?.nextInt(upperBound: 572))! - 286
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!//-= horizontalSpeed!
    }
}
