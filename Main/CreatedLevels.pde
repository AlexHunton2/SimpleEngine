public class Level1 extends BasicLevel{
  PlayerSpaceship playerSpaceship;
  
  Level1() {
    super();
    HookSupervisor.addHook(this);
  }
  
  @Override
  public void init() {

    playerSpaceship = new PlayerSpaceship(new PVector(200, 200), 50);
    this.addGameObject(playerSpaceship);
    Label label1 = new Label(new PVector(100, 100), "Exampe of Label!");
    label1.setColor(color(255, 255, 255));
    label1.setTextSize(20);
    this.addUIObject(label1);
    
    this.initAllObjects();
  }
  
  @Override
  public void update() {
    background(0); 
    this.updateAllObjects();
  }
  
  @Override
  public void onClick(MouseStruct mouseData) {
    playerSpaceship.setPosition(new PVector(mouseData.MouseX, mouseData.MouseY));
  }
  
  @Override
  public void onMove(MouseStruct mouseData) {
    float mousex = mouseData.MouseX;
    float mousey = mouseData.MouseY;
    
    float spaceshipx = playerSpaceship.getPosition().x;
    float spaceshipy = playerSpaceship.getPosition().y;
    
    float angle = degrees(atan2(mousey - spaceshipy, mousex - spaceshipx));
    playerSpaceship.setAngle(angle+90);
  }
  
}
