public class Square extends StaticObject {
  int extent;
  
  public Square(PVector defaultPosition, int extent) {
    super(defaultPosition);
    this.extent = extent;
  }
  
  @Override
  public void init() {}
  
  @Override
  public void update() {
    float x = this.getPosition().x;
    float y = this.getPosition().y;
    square(x, y, extent); 
  }
}

public class PlayerSquare extends DynamicObject {
  int extent;
  
  public PlayerSquare(PVector defaultPosition, int extent) {
    super(defaultPosition);
    this.extent = extent;
    HookSupervisor.addHook(this);
  }
  
  @Override 
  public void init() {}
  
  @Override
  public void update() {
    float x = this.getPosition().x;
    float y = this.getPosition().y;
    square(x, y, extent);
  }
  
  @Override
  public void onKeyPress(KeyStruct keyData) {
    int speed = 10;
    int xspeed = 0;
    int yspeed = 0;
    if (keyData.KeyPressed) {
      if (keyData.Key == 'w') {
        yspeed += -speed;
      } else if (keyData.Key == 's') {
        yspeed += speed;
      } else if (keyData.Key == 'a') {
        xspeed += -speed;
      } else if (keyData.Key == 'd') {
        xspeed += speed;
      }
    }
    this.setPosition(this.getPosition().add(new PVector(xspeed, yspeed)));
  }
}

public class PlayerSpaceship extends DynamicObject {
  private float currentAngle;
  private float sideLength;  
  
  PlayerSpaceship(PVector defaultLocation, float sideLength) {
    super(defaultLocation);
    HookSupervisor.addHook(this);
    this.currentAngle = 90;
    this.sideLength = sideLength;
  }
  
  
  public void setAngle(float angle) {
    this.currentAngle = angle;
  }
  
  public float getAngle() {
    return this.currentAngle;
  }
  
  private void drawTriangle() {
    float centerx = this.getPosition().x;
    float centery = this.getPosition().y;
    float s = this.sideLength;
    float h = (sqrt(3)/2)*s;
    
    pushMatrix();
    fill(0, 100, 100);
    translate(centerx, centery);
    rotate(radians(this.currentAngle));
    triangle(0, -h/2, s/2, h/2, -s/2, h/2);
    circle(0, -h/2, 5);
    fill(255, 255, 255);
    popMatrix();
  }
  
  @Override
  public void init() {
  }
  
  @Override
  public void update() {
    
    drawTriangle();
    stroke(255);
    line(this.getPosition().x, this.getPosition().y, mouseX, mouseY);
    drawTriangle();
    
    fill(255, 255, 255);
  }
  
  @Override
  public void onClick(MouseStruct mouseData) {
      
  }
}
