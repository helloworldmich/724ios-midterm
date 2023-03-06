//modified by YatMan Chan 301279592
import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 3.0) //changed fr 2.0
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
//        verticalSpeed = 5.0
      horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -2067)  //changed y<=-2263
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 1773       //changed y=2263
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!  //changed y
    }
}
