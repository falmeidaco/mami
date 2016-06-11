/**
  * Descrição: Tarefa aula 12
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */
  
//Variáveis globais para propriedade do polígono
float x, y, raio, angulo, angulo_rotacao;
int lados;

void setup() {
  size(560, 480);
  //Iniciando variáveis
  x = width/2;
  y = height/2;
  raio = 100;
  lados = 3;
  angulo_rotacao = 0;
}

void draw() {
  background(255);
  fill(100);
  //Desenha polígono com tamanho baseado na posição do mouse
  poligonoRegular(width/2, height/2, width/2-mouseX, lados);
}

//Ação para aumentar ou diminuir número de lados
void mouseClicked() {
  if (mouseButton == LEFT) {
    lados += 1;
  } else {
    if (lados > 3) {
      lados -= 1;
    }
  }
}

//Ação para modificar a rotação do polígono
void mouseWheel(MouseEvent event) {
  if (event.getCount() > 0) {
    angulo_rotacao += 0.1;
  } else {
    angulo_rotacao -= 0.1;
  }
}

//Função para desenho do polígono regular
void poligonoRegular(float x, float y, float raio, int n_lados) {
  
  int _n_lados;
  //Valida o número de lados
  if (n_lados < 3) {
    _n_lados = 3;
  } else {
    _n_lados = n_lados;
  }
  
  //Encontra o ângulo que será usado para definir a distância entre os pontos
  float angulo = TWO_PI/lados;
  
  //Loop para desenho dos lados
  for (int i = 0; i < _n_lados; i += 1) {
    //Desenha um lado
    line(polarX(raio, (angulo * i) + angulo_rotacao) + x, polarY(raio, (angulo * i) + angulo_rotacao) + y, polarX(raio, (angulo * (i + 1)) + angulo_rotacao) + x, polarY(raio, (angulo * (i + 1)) + angulo_rotacao) + y);
    //Ação para desenho das bolinhas em cada vértice do polígono
    if (keyPressed && keyCode==SHIFT) {
      fill(0);
      ellipse(polarX(raio, (angulo * i) + angulo_rotacao) + x, polarY(raio, (angulo * i) + angulo_rotacao) + y, 5, 5);
    }
  }
  
}

//Função para encontrar a posição X baseado no raio e ângulo
float polarX(float r, float a) {
  return (r * cos(a));
}

//Função para encontrar a posição Y baseado no raio e ângulo
float polarY(float r, float a) {
  return (r * sin(a));
}