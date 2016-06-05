/**
  * Descrição: Tarefa aula 19
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */
  
void setup() {
  size(360, 240);  
}

void draw() {
  background(255);
  //Desenha botão 1
  botao_quadrado(30, 30, 180, 60, color(0), color(200, 230, 30), color(255, 40, 40));
  //Desenha botão 2
  botao_quadrado(240, 30, 90, 60, color(100), color(200, 230, 30), color(255, 40, 40));
  //Desenha botão 3
  botao_redondo(180, 160, 100, color(160), color(200, 230, 30), color(255, 40, 40));
}

//Função para desenho do botão
void botao_quadrado(float x, float y, float largura, float altura, color c, color c_hover, color c_clicked) {
  fill(c);
  //Verifica se a posição do mouse está na área do quadrado
  if ((mouseX > x && mouseX < x + largura) && (mouseY > y && mouseY < y + altura)) {
    //Se o botão estiver na área de quadrado e o mouse estiver pressionado, definir cor do botão diferente da original
    if (mousePressed) {
      fill(c_clicked);
    } else {
      fill(c_hover);
    }
  }
  rect(x, y, largura, altura);
}

void botao_redondo(float x, float y, float raio, color c, color c_hover, color c_clicked) {
  fill(c);
  //Verifica se a posição do mouse está na área do quadrado
  if ( (Math.sqrt((x-mouseX)*(x-mouseX) + (y-mouseY)*(y-mouseY))) < raio/2) {
    //Se o botão estiver na área de quadrado e o mouse estiver pressionado, definir cor do botão diferente da original
    if (mousePressed) {
      fill(c_clicked);
    } else {
      fill(c_hover);
    }
  }
  ellipse(x, y, raio, raio);
}