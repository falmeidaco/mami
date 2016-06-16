float m_x, m_y, p_x, p_y, tg, arc_tan, ang_grau;
int tam_pupila;

void setup() {
  size(560, 480);
  tam_pupila = 100;
}

void draw() { 
  atualizaVariaveis(); 
  
  background(255);
  stroke(0);
  strokeWeight(4);
  fill(255);
  ellipse(width/2, height/2, 230, 230);
  
  stroke(0);
  strokeWeight(1);
  
  //triangle(width/2, height/2, mouseX, mouseY, width/2, mouseY);
  println(m_x, m_y, "tg=" + tg, "arctg=" + arc_tan, "grau=" + ang_grau);
  
  if ((m_x > (-60) && m_x < 60) && (m_y > (-60) && m_y < 60)) {
    fill(255, 0, 0);
    ellipse(width/2, height/2, 70, 70);
    desenhaPupila( mouseX, mouseY, tam_pupila);
  } else {
    desenhaPupila( polarX(arc_tan, 70) + width/2, polarY(arc_tan, 70) + height/2, tam_pupila);
  }
  
}

void atualizaVariaveis() {
  m_x = mouseX - (width/2);
  m_y = mouseY - (height/2);
  if (m_y != 0) {
    tg = m_y/m_x;
    arc_tan = atan(tg);
    ang_grau = degrees(arc_tan);
    if (m_x<0)
      arc_tan = arc_tan + PI;
    else if (m_y<0)
      arc_tan = arc_tan + (2 * PI);
    ang_grau = degrees(arc_tan);
  }
}

float polarX(float a, float r) {
  return cos(a) * r;
}

float polarY(float a, float r) {
  return sin(a) * r;
}

void desenhaPupila(float x, float y, float s) {
  noStroke();
  fill(0);
  ellipse(x, y, s, s);
  fill(255);
  ellipse(x - (s * 0.2), y - (s * 0.2), s * 0.3, s * 0.3);
}