PictureSelector picSelector;

void setup() {
  size(800, 600);
  
  picSelector = new PictureSelector();
 
  picSelector.savePicture(new Level1());
  picSelector.loadPicture(0);  
}

void draw() {
  picSelector.updateCurrentPicture();
}
