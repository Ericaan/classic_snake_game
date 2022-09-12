public class Snake{
  PVector []snake = new PVector[50];
  int snakeX, snakeY;
  int tail;
  int speedX, speedY;
  boolean moveX, moveY;
  
  //constructor
  public Snake(int snakeX, int snakeY){
    this.snakeX = snakeX;
    this.snakeY = snakeY;
    tail=1;
    //assign the head of the snake
    snake[0] = new PVector(snakeX, snakeY);
  }
  
  void displayHead(){
    //display snake head
    fill(0,255,0);
    rect(snake[0].x*blockSize, snake[0].y*blockSize, blockSize, blockSize);
  }
  
  void input(){
    //snake goes up and left = -1
    //snake goes down and right = 1
    //key arrows
    //snake cannot move back to itself
    if (keyCode == UP){
      if (speedY == 1){
        return;
      }
      speedY = -1;
      speedX=0;
      
    }else if (keyCode == LEFT){
      if (speedX == 1){
        return;
      }
      speedX = -1;
      speedY =0;
      
    }else if (keyCode == RIGHT){
      if (speedX == -1){
        return;
      }
      speedX = 1;
      speedY = 0;
      
    }else if (keyCode == DOWN){
      if (speedY == -1){
        return;
      }
      speedY = 1;
      speedX =0;
    }
  }
  
  void collide(){
    //collision between apple and snake
    //if the head bumps the food
    if (snake[0].x*blockSize == apple.food.x && snake[0].y*blockSize == apple.food.y){
      //assign value to the last position of tail
      snake[tail] = new PVector(snake[tail-1].x , snake[tail-1].y);
      tail +=1;
      //assign new loc of the apple 
      apple.locApple();
      //score +1 if collided
      score++;
      println(score + " ");
    }
  }
  
  void showTail(){
    //showing tails
    for (int i=1; i<tail;i++){
      fill(0,255,0);
      rect(snake[i].x*blockSize, snake[i].y*blockSize, blockSize, blockSize);
    }
  }
  
  void moveTail(){
    //shifting the tail
    for (int i = tail-1; i>0; i--){
      snake[i].x = snake[i-1].x;
      snake[i].y = snake[i-1].y;
    }
    //moving the head after shifting the tail
    snake[0].y= snake[0].y + speedY;
    snake[0].x= snake[0].x + speedX;
  }
  
  //snake bumps itself -- game over
  void bumpItself(){
    //checking if snake head bumps its body.
    for (int i=1; i<tail; i++){
      if(snake[0].x*blockSize == snake[i].x*blockSize &&
      snake[0].y*blockSize == snake[i].y*blockSize){
        println("snake meets snake -- game over");
        stop();
        clear();
        fill(255);
        textSize(25);
        textAlign(CENTER);
        text("Game Over", width/2, height/2);
      }
    }
  }
  
  //checking if location of apple is on the snake location
  void checkAppleSnake(){
    for (int i=1; i<tail; i++){
      if (snake[i].x* blockSize == apple.food.x 
      && snake[i].y*blockSize == apple.food.y){
        apple.locApple();
        println("apple on snake");
      }
    }
  }
}
