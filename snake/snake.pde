// 1. Follow the recipe instructions inside the Segment class.
// This class will be used to represent each part of the moving snake.
ArrayList<Segment> snakeSegments = new ArrayList<Segment>();
class Segment {
  //2. Create x and y member variables to hold the location of each segment.
  int x;
  int y;
  // 3. Add a constructor with parameters to initialize each variable.
  Segment(int newX, int newY) {
    x = newX;
    y = newY;
  }
  // 4. Add getter and setter methods for both the x and y member variables.
  void setX(int newX) {
    x = newX;
  }
  int getX() {
    return x;
  }
  void setY(int newY) {
    y = newY;
  }
  int getY() {
    return y;
  }
}

// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment headOfSnake;
// 6. Create a String to hold the direction of your snake e.g. "up"
String directionOfSnake = "up";
// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
int piecesOfFoodEaten = 0;
// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX = ((int)random(50)) * 10;
int foodY = ((int)random(50)) * 10;
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)
void setup() {
  // 9. Set the size of your sketch (500 by 500).
  size(500, 500);
  // 10. initialize your head to a new segment.
  headOfSnake = new Segment(250, 250);
  snakeSegments.add(headOfSnake);
  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}

void draw() {
  background(0);
  //12. Call the drawFood, drawSnake, move, and collision methods.
  drawFood();
  move();
  drawSnake();
  collision();
  headOfSnake = snakeSegments.get(snakeSegments.size() - 1);
}

// 15. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).
void drawFood() {
  fill(204, 17, 51);
  rect(foodX, foodY, 10, 10);
}

//16. Complete the drawSnake method below.
void drawSnake() {  
  fill(0, 153, 119);
  rect(headOfSnake.getX(), headOfSnake.getY(), 10, 10);
  for (Segment s : snakeSegments) {
    rect(s.getX(), s.getY(), 10, 10);
  }
  if (snakeSegments.size() > piecesOfFoodEaten) {
    snakeSegments.remove(0);
  }
}

// 17. Complete the missing parts of the collision method below.
void collision() {
  // For each segment in the snake,
  // If the segment is colliding with a piece of food...
  // Increase the amount of food eaten and set foodX and foodY to new random locations.
  if (headOfSnake.getX() == foodX && headOfSnake.getY() == foodY) {
    println("Food eaten!");
    piecesOfFoodEaten++;
    foodX = ((int)random(50)) * 10;
    foodY = ((int)random(50)) * 10;
  }
  for(int i = 0; i < snakeSegments.size(); i++) {
    for(int j = 0; j < snakeSegments.size(); j++) {
      if(i != j) {
        if(snakeSegments.get(i).getX() == snakeSegments.get(j).getX() && snakeSegments.get(i).getY() == snakeSegments.get(j).getY()) {
          noLoop();
        } 
      }
    }
  }
  // If different segments have the same location...
  // Set food to 3.
}

// 18. Complete the move method below.
void move() {
  // 18a. Create a switch statement using your direction variable. Depending on the direction, add a new segment to your snake.
  // The first case is done for you.
  switch(directionOfSnake) {
  case "up":
    headOfSnake = new Segment(headOfSnake.x, headOfSnake.y-10);
    break;
  case "down":
    headOfSnake = new Segment(headOfSnake.x, headOfSnake.y+10);
    break;
  case "left":
    headOfSnake = new Segment(headOfSnake.x-10, headOfSnake.y);
    break;
  case "right":
    headOfSnake = new Segment(headOfSnake.x+10, headOfSnake.y);
    break;
  }
  snakeSegments.add(headOfSnake);
  // 18b. Call the checkBoundaries method to make sure the snake doesn't go off the screen.
  checkBoundaries();
}

//check if your snake is out of bounds (optional teleport you snake to the other side.
void checkBoundaries() {
  if (headOfSnake.getX() < 0) {
    headOfSnake.setX(500);
  } else if (headOfSnake.getX() > 500) {
    headOfSnake.setX(0);
  } else if (headOfSnake.getY() < 0) {
    headOfSnake.setY(500);
  } else if (headOfSnake.getY() > 500) {
    headOfSnake.setY(0);
  }
}


// 19. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed. 
void keyPressed() {
  if (keyCode == UP) {
    if (!directionOfSnake.equals("down")) {
      directionOfSnake = "up";
    }
  }
  if (keyCode == DOWN) {
    if (!directionOfSnake.equals("up")) {
      directionOfSnake = "down";
    }
  }
  if (keyCode == LEFT) {
    if (!directionOfSnake.equals("right")) {
      directionOfSnake = "left";
    }
  }
  if (keyCode == RIGHT) {
    if (!directionOfSnake.equals("left")) {
      directionOfSnake = "right";
    }
  }
}

void updateSnake() {
  // 16a. Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.

  // 16b. While the snake size is greater than your food, remove the first Segment in your snake.
}
