/**
  * Descrição: Tarefa aula 13
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */

int i;
float y, y_sin, onda_x, onda_y;

void setup() {  
  size (480, 320);
  y = -0.5;
  onda_x = 0;
}

void draw() {
  
  background(0, 200, 255);
  
  //Desenho da onda com shape
  beginShape();
  noStroke();
  fill(20, 100, 170);
  vertex(0, height);
  onda_y = 0 + onda_x; 
  for (i = 0; i < width; i++) {
    vertex(i, 15 * sin(onda_y) + 170);
    onda_y += 0.05;
  }
  vertex(width, height);
  endShape();
  onda_x += 0.05;
  
  //Desenho do barco
  y += 0.05;
  y_sin = 15 * sin(y) + 100;
  desenhaBarco(width/2 - 35, y_sin, 70, 70);
  
}

//Função para desenho do barco
void desenhaBarco(float x, float y, float largura, float altura) {
  fill(250);
  triangle(x+largura/2, y, x+largura/2, y + altura * 0.7, x + largura * 0.1, y + altura * 0.7);
  fill(200);
  triangle(x+largura/2, y + altura * 0.2, x+largura/2, y + altura * 0.7, x + largura * 0.9, y + altura * 0.7);
  fill(100);
  quad(x, y + altura * 0.7, x + largura, y + altura * 0.7, x + largura * 0.8, y + altura, x + largura * 0.2, y + altura);
}