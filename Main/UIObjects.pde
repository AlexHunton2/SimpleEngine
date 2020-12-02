public interface UIObject extends Entity {}

abstract class UIObjectBase extends EntityBase implements UIObject {
  UIObjectBase(PVector defaultPosition) {
    super(defaultPosition);
  }
}

abstract class StaticUIObject extends UIObjectBase {
  StaticUIObject(PVector defaultPostion) {
    super(defaultPostion);
  }

}
abstract class DynamicUIObject extends UIObjectBase implements KeyBoardHook, MouseHook {
  DynamicUIObject(PVector defaultPostion) {
    super(defaultPostion);
  }
  
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
