//按下“a”“s”“d”会改变的颜色（声音不同），第二次按下清空画布
//鼠标上下左右移动小圆点会有不同方向的移动
//“f”保存图像至文件夹

import processing.sound.*;

SoundFile[] file;
int numsounds = 3;

float angle, speed;
float l0, l1, l2;
int n = 4;
boolean first = true;

void setup() {
  size(800, 800);
  angle = 0;
  speed = 0.005;
  background(75,0,80);
  file = new SoundFile[numsounds];
    for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
}

void draw() {  
  fill(0, 400);
  
  translate(width/2, height/2);
  rotate(angle);
  
  l0 = map(mouseX, 0, width, 50, 200);
  l1 = map(mouseY, 0, width, 37, 150);
  l2 = map(mouseX+mouseY, 0, width+height, 25, 100);
  
  for (int i=0; i<n; i++) {
    fill(150, 100);
    pushMatrix();
    rotate(i*TWO_PI/n);
    translate(0, l0);
    ellipse(100, 100, 15, 15);

    for (int j=0; j<n; j++) {
      fill(200, 100);
      pushMatrix();
      rotate(j*TWO_PI/n);
      translate(0, l1);
      ellipse(0, 0, 10, 10);

      for (int k=0; k<n; k++) {
        fill(250, 100);
        pushMatrix();
        rotate(k*TWO_PI/n);
        translate(0, l2);    
        ellipse(200, 200, 5, 5);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
  angle = (angle+speed)%TWO_PI;
}
void keyPressed() {
  boolean validKey = true;
  println(key);
  switch(key) {
  case 'a':
    background(82,0,0);
    file[0].play(0.5, 1.0);
    break;
  case 's':
    background(0,82,0);
    file[1].play(0.5, 1.0);
    break;
  case 'd':
    background(0,0,82);
    file[2].play(0.5, 1.0);
    break;
  //输出  
  case 'f':
    saveFrame("picture.gif");
  //case 'g':  
    //save("move.gif");
  }
}
