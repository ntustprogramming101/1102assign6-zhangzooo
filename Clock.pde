class Clock extends Item {
  
  Clock(float x, float y){
    super(x,y);
  }
  
   void display(){
      if(isAlive){
        image(clock,x,y);
      }
    }
    
    void checkCollision(Player player){
    if(isAlive == true && player.health < player.PLAYER_MAX_HEALTH
    && isHit(x, y, w, h, player.x, player.y, player.w, player.h)){      
      addTime(15);
      isAlive = false;
    }
  }    
	// Requirement #2: Complete Clock Class

	/*
	Code for Reference:

		for(int i = 0; i < clockX.length; i++){

			// Display Clock
			image(clock, clockX[i], clockY[i]);

			// Check collision with player
		    if(isHit(clockX[i], clockY[i], SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)){

				addTime(CLOCK_BONUS_SECONDS);
				clockX[i] = clockY[i] = -1000; // Now that they're objects, toggle isAlive instead of throwing them away from screen

			}

		}
	*/
}
