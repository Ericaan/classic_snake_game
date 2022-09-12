public class Apple{
  int foodX, foodY;
  PVector food;
  int randX, randY;
  
  public Apple(){
  }
  
  void locApple(){
    //assign random location of apple
    randX = (int) random(grid.rows);
    randY = (int) random(grid.cols);
    foodX = randX*blockSize;
    foodY = randY*blockSize;
    food = new PVector (foodX, foodY);
    
  }
  
  void displayApple(){
    fill(255,0,0);
    rect(food.x, food.y, blockSize, blockSize);
  }
}
