public interface GameObject extends Entity {}

abstract class GameObjectBase extends EntityBase implements GameObject {
  public GameObjectBase(PVector defaultPosition) {
    this.setPosition(defaultPosition);
  }
}

abstract class StaticObject extends GameObjectBase {
  StaticObject(PVector defaultPostion) {
    super(defaultPostion);
  }

}
abstract class DynamicObject extends GameObjectBase implements KeyBoardHook, MouseHook {
  DynamicObject(PVector defaultPostion) {
    super(defaultPostion);
  }
  
  //All of these are the possible hooks for a dynamic object. Override them in the concrete object
  public void onKeyPress(KeyStruct keyData) {}
  public void onKeyRelease(KeyStruct keyData) {}
  public void onKeyType(KeyStruct keyData) {}
  public void onClick(MouseStruct mouseData) {}
  public void onMove(MouseStruct mouseData) {}
  public void onPressed(MouseStruct mouseData) {}
  public void onDragged(MouseStruct mouseData) {}
  public void onReleased(MouseStruct mouseData) {}
  public void onWheel(MouseStruct mouseData) {}
}
