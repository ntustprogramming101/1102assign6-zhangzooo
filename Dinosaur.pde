class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;

  Dinosaur(float x, float y){
    super(x,y);
  }
  
  void display(){
    
     pushMatrix();
     translate( x, y );
     if(speed==1f){
      scale( 1, 1 );
      image( dinosaur, 0, 0 );
     }else{
      scale( -1, 1 );
      image(dinosaur, -w, 0);        
    }
    popMatrix(); 
  }
  
  void update(){

   float currentSpeed = speed;
    if((player.y==y && player.x>x && speed==1f) || 
      (player.y==y && player.x<x && speed==-1f)){
      currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
    }
    x += currentSpeed;
    if(x+80 >= width || x<=0){
      speed*=-1; 
    }    
  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
