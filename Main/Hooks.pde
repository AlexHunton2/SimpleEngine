public interface Hook {}

public interface KeyBoardHook extends Hook {
  public void onKeyPress(KeyStruct keyData);
  public void onKeyRelease(KeyStruct keyData);
  public void onKeyType(KeyStruct keyData);
}

//This is the key struct and holds all the information on the key press. Please refer to mouse struct for the purpose of these.
public class KeyStruct {
  char Key;
  int KeyCode;
  boolean KeyPressed;
  
  public KeyStruct(char Key, int KeyCode, boolean KeyPressed) {
    this.Key = Key;
    this.KeyCode = KeyCode;
    this.KeyPressed = KeyPressed;
  }
}

public interface MouseHook extends Hook {
  public void onClick(MouseStruct mouseData);
  public void onMove(MouseStruct mouseData);
  public void onPressed(MouseStruct mouseData);
  public void onDragged(MouseStruct mouseData);
  public void onReleased(MouseStruct mouseData);
  public void onWheel(MouseStruct mouseData);
}

//This struct holds all the mouse data. It's purpose to make implementing types of hooks easier by having just one paramter instead of six.
public class MouseStruct {
  boolean MousePressed;
  int MouseButton;
  int MouseX;
  int MouseY;
  int PMouseX;
  int PMouseY;
  
  public MouseStruct(boolean MousePressed, int MouseButton, int MouseX, int MouseY, int PMouseX, int PMouseY) {
    this.MousePressed = MousePressed;
    this.MouseButton = MouseButton;
    this.MouseX = MouseX;
    this.MouseY = MouseY;
    this.PMouseX = PMouseX;
    this.PMouseY = PMouseY;
  }

}

// This class is a static class that can be used anywhere. Anything that implements a hook would have to assign itself to supervisor in order to work.
// Forgetting to assign a class to the supervisor in it's constructor will make the class unable to receieve hooks. 
// The supervisor is in charge of managing and holding all hooks created by the classes while the program is running. 
public static class HookSupervisor {
  private static ArrayList<Hook> allHooks = new ArrayList<Hook>();
  
  public static void addHook(Hook h) {
    allHooks.add(h);
  }
  
  public static void removeHook(int i) {
    allHooks.remove(i);
  }
  
  public static ArrayList<Hook> getHooks() {
    return allHooks;
  }
}

// ===============================================================================================================================================================================
// The following are all the inbuilt processing functions that handle events. They will speak to the supervisor and call the method associated to all the classes that implement that hook

// Keyboard:
void keyPressed() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((KeyBoardHook)hook).onKeyPress(new KeyStruct(key, keyCode, keyPressed));
    } catch (ClassCastException e) {} 
  }
}

void keyReleased() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((KeyBoardHook)hook).onKeyRelease(new KeyStruct(key, keyCode, keyPressed));
    } catch (ClassCastException e) {} 
  }
}

void keyTyped() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((KeyBoardHook)hook).onKeyType(new KeyStruct(key, keyCode, keyPressed));
    } catch (ClassCastException e) {} 
  }
}

// Mouse:
void mouseClicked() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((MouseHook)hook).onClick(new MouseStruct(mousePressed, mouseButton, mouseX, mouseY, pmouseX, pmouseY));
    } catch (ClassCastException e) {} 
  }
}

void mouseMoved() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((MouseHook)hook).onMove(new MouseStruct(mousePressed, mouseButton, mouseX, mouseY, pmouseX, pmouseY));
    } catch (ClassCastException e) {} 
  }
}

void mousePressed() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((MouseHook)hook).onPressed(new MouseStruct(mousePressed, mouseButton, mouseX, mouseY, pmouseX, pmouseY));
    } catch (ClassCastException e) {} 
  }
}

void mouseDragged() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((MouseHook)hook).onDragged(new MouseStruct(mousePressed, mouseButton, mouseX, mouseY, pmouseX, pmouseY));
    } catch (ClassCastException e) {} 
  }
}

void mouseReleased() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((MouseHook)hook).onReleased(new MouseStruct(mousePressed, mouseButton, mouseX, mouseY, pmouseX, pmouseY));
    } catch (ClassCastException e) {} 
  }
}

void mouseWheel() {
  for (Hook hook : HookSupervisor.getHooks()) {
    try {
      ((MouseHook)hook).onWheel(new MouseStruct(mousePressed, mouseButton, mouseX, mouseY, pmouseX, pmouseY));
    } catch (ClassCastException e) {} 
  }
}
