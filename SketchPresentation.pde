import processing.serial.*;
Serial myPort;
import guru.ttslib.*;
TTS tts;


PFont myFont;

int a = 200;
int imgW = 40;
int imgH = 40;
int VibrationPattern;
String message;

ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
boolean logged = false; 

emoticon[] smileys;
String[] imageNames = { 
  "shocked-face-with-exploding-head_1f92f.png",                             //1.1 Erschrocken
  "serious-face-with-symbols-covering-mouth_1f92c.png",                     //1.2 Wuetend
  "hushed-face_1f62f-2.png",                                                //1.3 Erstaunt
  "face-with-finger-covering-closed-lips_1f92b.png",                        //1.4 Achtsam
  "face-with-open-mouth-vomiting_1f92e.png",                                //1.5 Angewidert
  "heavy-black-heart_2764.png",                                             //1.6 Bewundernd
  "grinning-face-with-smiling-eyes_1f601.png",                              //1.7 Begeistert
  "loudly-crying-face_1f62d.png",                                           //1.8 Betruebt


  "face-screaming-in-fear_1f631.png", //2.1
  "face-with-look-of-triumph_1f624.png", //2.2
  "hear-no-evil-monkey_1f649.png", //2.3
  "white-up-pointing-index_261d.png", //2.4
  "confounded-face_1f616.png", //2.5
  "smirking-face_1f60f.png", //2.6
  "face-with-party-horn-and-party-hat_1f973.png", //2.7
  "face-with-head-bandage_1f915.png", //2.8


  "dizzy-face_1f635.png", //3.1
  "reversed-hand-with-middle-finger-extended_1f595.png", //3.2
  "see-no-evil-monkey_1f648.png", //3.3
  "face-with-monocle_1f9d0.png", //3.4
  "nauseated-face_1f922.png", //3.5
  "face-throwing-a-kiss_1f618.png", //3.6
  "face-with-stuck-out-tongue-and-winking-eye_1f61c.png", //3.7
  "confused-face_1f615.png", //3.8
  
  "freezing-face_1f976.png", //3.1
  "angry-face_1f620.png", //3.2
  "frowning-face-with-open-mouth_1f626.png", //3.3
  "sleeping-face_1f634.png", //3.4
  "pile-of-poo_1f4a9.png", //3.5
  "heart-with-arrow_1f498.png", //3.6
  "clapping-hands-sign_1f44f.png", //3.7
  "sleepy-face_1f62a.png", //3.8
  
  "anguished-face_1f627.png", //3.1
  "pouting-face_1f621.png", //3.2
  "smiling-face-with-smiling-eyes-and-hand-covering-mouth_1f92d.png", //3.3
  "thinking-face_1f914.png", //3.4
  "face-with-medical-mask_1f637.png", //3.5
  "smiling-face-with-heart-shaped-eyes_1f60d.png", //3.6
  "smiling-face-with-smiling-eyes_1f60a.png", //3.7
  "face-with-pleading-eyes_1f97a.png", //3.8


};
PImage[] images = new PImage[imageNames.length];
int[] vibrations = new int [8];

void setup() {

  String[] fontList = PFont.list();
  printArray(fontList);
  myFont = createFont("SFCompactText-Ultrathin", 30);
  textFont(myFont);
  smooth(100);
  
  for (int i=0; i < imageNames.length; i++) {
    //String imageName = imageNames[i];
    images[i] = loadImage(imageNames[i]);
    //vibrations[i] = i+1;
  } 
  smileys = new emoticon[40];

  //initialize emoticons
  for (int i = 0; i<5; i++) { //row
    for (int j = 0; j<8; j++) { //column
      vibrations[i] = i+1;
      vibrations[j] = j+1;
      smileys[i*8+j] = new emoticon(10+j*50, 120+i*50, 40, 40, images[j+i*8], vibrations[j]);
      println(vibrations[j]);
      println(images);
    }
  }

  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.buffer(1);

  tts = new TTS();

  size(410, 390);


  TEXTBOX userTB = new TEXTBOX();
  userTB.X = 10; 
  userTB.Y = 40; 
  userTB.W = 390;
  userTB.H = 40; 

  textboxes.add(userTB);
}

void draw() {
  background(240,240,240,0);


  for (int i = 0; i<smileys.length; i++) {
    smileys[i].display();
  }

  // DRAW THE TEXTBOXES
  for (TEXTBOX t : textboxes) {
    t.DRAW();
  }
}

void mousePressed() {
  for (TEXTBOX t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
  println("Coordinates: " + mouseX +"," + mouseY);
  for (int i = 0; i<smileys.length; i++) {
    smileys[i].mouseOver();
    if (smileys[i].hovered) {
      smileys[i].selected = true;
      if (smileys[i].selected == true) {
        VibrationPattern = smileys[i].vibrationPattern;
      }

      println("index: "+i+"; VibrationPattern: "+ VibrationPattern);
    } else {
      smileys[i].selected = false;
    }
  }
}

void Submit() {
  message = textboxes.get(0).Text;
}

void keyPressed() {
  for (TEXTBOX t : textboxes) {
    if (t.KEYPRESSED(key, (int)keyCode)) {
      Submit();
      tts.speak(message);

      println (VibrationPattern);
      myPort.write(VibrationPattern);
    }
  }
}



class emoticon {

  //variables for every object
  boolean selected, hovered;
  float xPos, yPos, h, w;
  PImage icon;
  int vibrationPattern;

  //constructor
  emoticon(float x, float y, int he, int wi, PImage i, int vibe) {
    xPos = x;
    yPos = y;
    h = he;
    w = wi;
    icon = i;
    vibrationPattern = vibe;
    selected = false;
    hovered = true;
  }

  //im Prinzip draw function nur für die emoticons
  void display() {
    if (selected == true) {
      tint(255, 255);
      image(icon, xPos, yPos, w, h);
    } else {
      tint(255, 100);
      image(icon, xPos, yPos, w, h);
    }
  }

  void mouseOver() {
    if (mouseX>xPos && mouseX<xPos+w && mouseY>yPos && mouseY<yPos+h) {
      hovered = true;
    } else {
      hovered = false;
    }
  }
}




public class TEXTBOX {
  public int X = 0, Y = 0, H = 20, W = 200;
  public int TEXTSIZE = 16;

  // COLORS
  public color Background = color(255,255,255,0); //(255)
  public color Foreground = color(0, 0, 0);
  public color BackgroundSelected = color(255);

  public boolean BorderEnable = false;
  public int BorderWeight = 1;

  public String Text = "";
  public int TextLength = 0;

  private boolean selected = false;

  TEXTBOX() {
    // CREATE OBJECT DEFAULT TEXTBOX
  }

  TEXTBOX(int x, int y, int w, int h) {
    X = x; 
    Y = y; 
    W = w; 
    H = h;
  }

  void DRAW() {

    //...
    fill(255);
    rect(10,35,380,30, 5);
    //...
    
    if (selected) {
      fill(BackgroundSelected);
    } else {
      fill(Background);
    }

    if (BorderEnable) {
      strokeWeight(BorderWeight);
    } else {
      noStroke();
    }

    rect(X, Y, W, H);

    // DRAWING THE TEXT ITSELF
    fill(100);
    textSize(TEXTSIZE);
    text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
    
  }

  // IF THE KEYCODE IS ENTER RETURN 1
  // ELSE RETURN 0
  boolean KEYPRESSED(char KEY, int KEYCODE) {
    //if (selected) {
    if (KEYCODE == (int)BACKSPACE) {
      BACKSPACE();
    } else if (KEYCODE == 32) {
      // SPACE
      addText(' ');
    } else if (KEYCODE == (int)ENTER) {
      return true;
    } else {
      // ALLOWED LETTERS
      boolean isKeyGrossbuchstaben = (KEY >= 'A' && KEY <= 'Z');
      boolean isKeyKleinbuchstaben = (KEY >= 'a' && KEY <= 'z');
      boolean isKeyNummern = (KEY >= '0' && KEY <= '9');
      boolean isKeyKomma = (KEY == ',');
      boolean isKeyPunkt = (KEY == '.');
      boolean isKeyFrage = (KEY == '?');
      boolean isKeyAusruf = (KEY == '!');
      boolean isKeyBindestrich = (KEY == '-');
      boolean isKeyUnterstrich = (KEY == '_');
      boolean isKeyKlammer1 = (KEY == '(');
      boolean isKeyKlammer2 = (KEY == ')');
      boolean isKeyGleich = (KEY == '=');
      boolean isKeyUnd = (KEY == '&');
      boolean isKeyZitat = (KEY == '"');
      boolean isKeyProzent = (KEY == '%');
      boolean isKeyDoppelpunkt = (KEY == ':');

      if (isKeyGrossbuchstaben || isKeyKleinbuchstaben || isKeyNummern || isKeyKomma || isKeyPunkt 
        || isKeyFrage || isKeyAusruf || isKeyBindestrich || isKeyUnterstrich || isKeyKlammer1 || isKeyKlammer2 
        || isKeyGleich || isKeyUnd || isKeyZitat || isKeyProzent || isKeyDoppelpunkt) {
        addText(KEY);
      }
    }
    //}

    return false;
  }

  private void addText(char text) {
    // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
    if (textWidth(Text + text) < W) {
      Text += text;
      TextLength++;
    }
  }

  private void BACKSPACE() {
    if (TextLength - 1 >= 0) {
      Text = Text.substring(0, TextLength - 1);
      TextLength--;
    }
  }


  private boolean overBox(int x, int y) {
    if (x >= X && x <= X + W) {
      if (y >= Y && y <= Y + H) {
        return false;
      }
    }

    return false;
  }


  void PRESSED(int x, int y) {
    if (overBox(x, y)) {
      selected = true;
    } else {
      selected = false;
    }
  }
}
