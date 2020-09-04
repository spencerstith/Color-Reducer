PImage work;
int rez = 150;
int rows, cols;

void setup() {
  size(1200, 600);
  work = loadImage("nature1.jpg");
  rows = work.height / rez;
  cols = work.width / rez;
}

void draw() {
  image(work, 0, 0);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      color currentAverage = getAverageColor(work, i * rez, j * rez, rez, rez);
      noStroke();
      fill(currentAverage);
      rect(600 + i * rez, j * rez, rez, rez);
    }
  }
  noLoop();
}

color getAverageColor(PImage img, int x, int y, int w, int h) {
  int rTotal = 0;
  int gTotal = 0;
  int bTotal = 0;
  for (int i = x; i < x + w; i++) {
    for (int j = y; j < y + h; j++) {
      PVector current = getVectorFromHex(hex(img.get(i, j)));
      rTotal += current.x;
      gTotal += current.y;
      bTotal += current.z;
    }
  }
  rTotal /= (w * h);
  gTotal /= (w * h);
  bTotal /= (w * h);
  return color(rTotal, gTotal, bTotal);
}

PVector getVectorFromHex(String hexVal) {
  int r = unhex(hexVal.substring(2, 4));
  int g = unhex(hexVal.substring(4, 6));
  int b = unhex(hexVal.substring(6, 8));
  return new PVector(r, g, b);
}
