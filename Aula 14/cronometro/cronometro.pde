/**
  * Descrição: Tarefa aula 14
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe Almeida
  */
  
//Definindo variáveis
float a, b, c;

void setup() {
  size(560, 480);
  b = HALF_PI * 3; // Ângulo inicial do ponteiro
}

void draw() {
  background(239, 118, 0);
  cronometroSegundo(width/2, height/2, 300, 60*60, color(255, 255, 255));
  cronometroSegundo(width/2, height/2, 250, 60, color(186, 87, 219));
  cronometroSegundo(width/2, height/2, 200, 1, color(38, 214, 129));
}

void cronometroSegundo(float x, float y, float r, int t, color _c) {
  noStroke();
  float c = ((float)millis() / 1000) * (TWO_PI / t);
  float p = r / 2 * 0.9;
  float s =  int(c/TWO_PI);
  fill(_c);
  if (int(c/TWO_PI) % 2 == 0) {
    arc(x, y, p * 2, p * 2, c + b - (s * TWO_PI), TWO_PI + b, PIE);
  } else {
    arc(x, y, p * 2, p * 2, b, c + b - (s * TWO_PI), PIE);
  }
}