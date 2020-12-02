public interface Entity {
  public void init();
  public void update();
  public PVector getPosition();
  public void setPosition(PVector p);
  public int getIndex();
  public void setIndex(int i);
}

abstract class EntityBase implements Entity {
  private PVector position;
  private int index;
  
  public EntityBase() {
    this.setPosition(new PVector(0, 0));
  }
  
  public EntityBase(PVector defaultPosition) {
    this.setPosition(defaultPosition);
  }
  
  public void init() {}
  
  public void update() {}
  
  public PVector getPosition() {
    return this.position;
  }
  
  public void setPosition(PVector position) {
    this.position = position;
  }
  
  public int getIndex() {
    return this.index;
  }
  
  public void setIndex(int i) {
    this.index = i;
  }
}
