/*
* Picture file is dedicated on the level and menu selection. Both a level and a menu are pictures. A picture is what is on screen and is the "environment" that the
* player sees.
* Levels are pictures that house GameObjects and UIObjects. Used for the actual game.
* Menus are pictures that house UIObjects. Used for level selection.
*/

public class PictureSelector {
  private Picture currentPicture;
  private ArrayList<Picture> allPictures;
  
  PictureSelector() {
    allPictures = new ArrayList<Picture>();
  }
  
  public void loadPicture(int i) {
    this.currentPicture = allPictures.get(i);
    this.currentPicture.init();
  }
  
  public int savePicture(Picture p) {
    allPictures.add(p);
    return allPictures.indexOf(p);
  }
  
  public void removePicture(int i) {
    allPictures.remove(i);
  }
  
  public Picture getCurrentPicture() {
    return this.currentPicture;
  }
  
  public void updateCurrentPicture() {
    this.currentPicture.update();
  }
}

public interface Picture {
  public void init();
  public void update();
}



public interface Level extends Picture {
  public ArrayList<GameObject> getAllGameObjects();
  public ArrayList<UIObject> getAllUIObjects();
  public GameObject getGameObject(int i);
  public UIObject getUIObject(int i);
}

public interface Menu extends Picture {}

abstract class BasicLevel implements Level, MouseHook, KeyBoardHook {
  private ArrayList<GameObject> allGameObjects;
  private ArrayList<UIObject> allUIObjects;
  
  public BasicLevel() {
    this.allGameObjects = new ArrayList<GameObject>();
    this.allUIObjects = new ArrayList<UIObject>();
  }
  public void init() {}
  
  public void update() {}
  
  public ArrayList<GameObject> getAllGameObjects() {
    return this.allGameObjects;
  }
  
  public ArrayList<UIObject> getAllUIObjects() {
    return this.allUIObjects;
  }
  
  public GameObject getGameObject(int i) {
    return this.allGameObjects.get(i);
  }
  
  public UIObject getUIObject(int i) {
    return this.allUIObjects.get(i);
  }
  
  protected void addGameObject(GameObject d) {
    d.setIndex(getAllGameObjects().size());
    this.allGameObjects.add(d);
  }
  
  protected void addUIObject(UIObject d) {
    d.setIndex(getAllUIObjects().size());
    this.allUIObjects.add(d);
  }
  
  protected void removeGameObject(int i) {
    this.allGameObjects.remove(i);
  }
  
  protected void removeUIObject(int i) {
    this.allUIObjects.remove(i);
  }
  
  protected void initAllObjects() {
    for (GameObject GameObject : this.allGameObjects) {
      GameObject.init();
    }
    for (UIObject UIObject : this.allUIObjects) {
      UIObject.init();
    }
  }
  
  protected void updateAllObjects() {
    for (GameObject GameObject : this.allGameObjects) {
      GameObject.update();
    }
    for (UIObject UIObject : this.allUIObjects) {
      UIObject.update();
    }
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
