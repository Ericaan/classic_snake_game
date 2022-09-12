public class Grid{
  int cols, rows;
  
  //contructor
  public Grid(int cols, int rows){
    this.cols = cols;
    this.rows = rows;
  }
  
  void display(){
    //grid
    for (int i = 0; i<cols; i++){
      for (int j=0; j<rows; j++){
        fill(255);
        rect(i*blockSize, j*blockSize, blockSize, blockSize);
      }
    }
  }
}
