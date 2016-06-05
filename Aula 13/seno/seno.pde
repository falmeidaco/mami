/**
  * Descrição: Tarefa aula 13
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */

int i;
float x, y, barco_x, barco_y, onda_inc;

void setup() {  
  size (480, 320);
  x = 0;
}

void draw() {
  
  background(0,200,255);
  
  //Desenho da onda
  onda_inc = 0; 
  for (i = 0; i < width; i++) {
    stroke(20, 100, 170);
    line(i, 15 * sin(onda_inc) + 170, i, height);
    onda_inc += 0.05;
  }
  
  stroke(0);
  
  //Desenho do barco
  x += 0.05;
  y = sin(x);
  barco_x = 20 * x - 35;
  barco_y = 15 * y + 100;
  desenhaBarco(barco_x, barco_y, 70, 70);
  
  if (barco_x > 480) {
    x = 0;
  }
  
}

//Função para desenho do barco
void desenhaBarco(float x, float y, float largura, float altura) {
  triangle(x+largura/2, y, x+largura/2, y + altura * 0.7, x + largura * 0.1, y + altura * 0.7);
  triangle(x+largura/2, y + altura * 0.2, x+largura/2, y + altura * 0.7, x + largura * 0.9, y + altura * 0.7);
  quad(x, y + altura * 0.7, x + largura, y + altura * 0.7, x + largura * 0.8, y + altura, x + largura * 0.2, y + altura);
}