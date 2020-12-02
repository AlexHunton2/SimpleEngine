public class Label extends StaticUIObject {
  String text;
  PFont textFont;
  float textSize;
  float textLeading;
  int textHAlignment;
  int textVAlignment;
  color Color;
  
  public Label(PVector defaultPosition, String t) {
    super(defaultPosition);
    this.text = t;
  }
  
  public void setText(String t) {
    this.text = t;
  }
  
  public void setTextFont(PFont font) {
    this.textFont = font;
  }
  
  public void setTextSize(float size) {
    this.textSize = size;
  }
  
  public void setTextLeading(float lead) {
    this.textLeading = lead;
  }
  
  public void setTextAlign(int horizontal, int vertical) {
    this.textHAlignment = horizontal;
    this.textVAlignment = vertical;
  }
  
  public void setColor(color Color) {
    this.Color = Color;
  }
  
  @Override
  public void init() {}
  
  @Override
  public void update() {
    if (this.textFont != null) {
      textFont(this.textFont);
    }
    if (this.textSize != 0.0f) {
      textSize(this.textSize);
    }
    textLeading(this.textLeading);
    textAlign(this.textHAlignment, this.textVAlignment);
    if (this.Color != color(0, 0, 0)) {
      fill(this.Color);
    }
    text(this.text, this.getPosition().x, this.getPosition().y);
  }

}
