class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  Laser laser=new Laser();
  int coolTime =0;

  Robot(float x, float y){
    super(x,y);
  }
  
  void display(){
     pushMatrix();
     translate( x, y );
     if(speed==2f){
      scale( 1, 1 );
      image( robot, 0, 0 );
     }else{
      scale( -1, 1 );
      image(robot, -w, 0);        
    }
    popMatrix();     
  }
  
  void update(){
    
     boolean checkX = (speed==2f && player.x+w/2>x) ||  (speed==-2f && player.x+w/2<x);
     boolean checkY = abs(player.row - (y/w))<=2;
     
     if(checkX && checkY){
        if(coolTime == 0){
            if(speed ==2f){
              laser.fire(x+HAND_OFFSET_X_FORWARD, y+HAND_OFFSET_Y, player.x+w/2, player.y+h/2);
             }else{
              laser.fire(x+HAND_OFFSET_X_BACKWARD, y+HAND_OFFSET_Y, player.x+w/2, player.y+h/2);
             }
             
            coolTime = LASER_COOLDOWN;
            }else{
            coolTime--;
            }
            
        }else{
         x += speed;
         if(x+80 >= width || x<=0){
          speed*=-1; 
         }
       } 
       laser.display();
       laser.update();
      }
      
  void checkCollision(Player player){
    super.checkCollision(player);
    laser.checkCollision(player);
  }
    
}
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
