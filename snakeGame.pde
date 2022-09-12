//cell
Grid grid;
int blockSize;
//snake
Snake snake;
//food
Apple apple;
//player
int score;
boolean gameOver;

void setup(){
  size(600, 650);
  gameOver = false;
  blockSize = 30;
  score = 0;
  //cols and rows = 20
  grid = new Grid(20,20);
  apple = new Apple();
  //snakeX and snakeY location
  snake = new Snake(10,10);
  //location of apple
  apple.locApple();
  //restart();
  //play();
}

void draw(){
  background(0);
  if (gameOver==false){
    play();
  }else {
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
      
    println("Restart game");
    if (keyPressed&& key== ' '){
      play();
      gameOver = false;
      
      
    }
  }
  
  
  
}


void play(){
  //if the snake is outside the screen -- game over
  if ((snake.snake[0].x*blockSize)+blockSize/2 > width || 
  (snake.snake[0].x*blockSize)+blockSize/2 < 0 ||
  (snake.snake[0].y*blockSize)+blockSize/2 > grid.cols*blockSize ||
  (snake.snake[0].y*blockSize)+blockSize/2 < 0){
    gameOver = true;
    
    
  }else {
    //display grid
    grid.display();
    
    //check whether apple is on the top of snake
    //if it is, it'll assign new location.
    snake.checkAppleSnake();
    
    //snake collide with apple
    snake.collide();
    
    //move the tail, move every frame by 60
    //make the snake goes slower
    if (frameCount%8==0){
      snake.moveTail();
      //check if it bumps to itself
      snake.bumpItself();
    }
    
    //showing tails 
    snake.showTail();
    
    //snake movement
    snake.input();
    
    //display snake head
    snake.displayHead();
    
    //display food
    apple.displayApple();
    
    //display score
    fill(255);
    textSize(25);
    text("Score: "+ score, 10, 630);
  }
  
}
