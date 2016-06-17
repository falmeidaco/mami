/**
  * Descrição: Tarefa aula 15
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */
  
//Iniciando variáveis
int _n;
float[][] olhos;
boolean animado;

void setup() {
  size(560, 480);
  //Define o número de imagens a serem exibidas na tela
  _n = 33;
  //Cria e Preenche array com propriedades randômicas das imagens a serem exibidas
  olhos = new float[_n][];
  for (int i = 0; i < olhos.length; i += 1) {
    olhos[i] = new float[5];
    olhos[i][0] = random(width); //Posição X
    olhos[i][1] = random(height); //Posição Y
    olhos[i][2] = random(30, 70); // Tamamho
    olhos[i][3] = (random(1) < 0.5) ? 1 : -1; //Movimento X
    olhos[i][4] = (random(1) < 0.5) ? 1 : -1; //Movimento Y
  }
  animado = true;
}

void draw() {
  background(255, 0, 100);
  for (int i = 0; i < olhos.length; i +=1 ) {
    //Desenha a imagem de cada ítem do array
    desenhaOlho(olhos[i][0], olhos[i][1],  olhos[i][2]);
    //Anima as imagens na tela
    if (animado) {
      olhos[i][0] += olhos[i][3];
      olhos[i][1] += olhos[i][4];
      if (olhos[i][0] < 0 || olhos[i][0] > width) 
        olhos[i][3] = -olhos[i][3];
      if (olhos[i][1] < 0 || olhos[i][1] > height) 
        olhos[i][4] = -olhos[i][4];
    }
  }
  desenhaOlho(width/2, height/2,  200);
}

//Função para desenho do olho
void desenhaOlho(float x, float y, float tamanho) {
  //Desenha limites do olho
  strokeWeight(4);
  stroke(0);
  fill(255);
  ellipse(x, y, tamanho, tamanho);
  //Desenha pupila
  desenhaPupila(x, y, tamanho * 0.3, tamanho * 0.6);
}
//Função para desenho da pupila dinâmica
void desenhaPupila(float x, float y, float tamanho, float limite) {
  
  //Define as variáveis
  float tg = 0;
  float arc_tg = 0;
  float _mx = mouseX - x;
  float _my = mouseY - y;
  float _x = 0;
  float _y = 0;
  
  if (_mx != 0) {
    //Calcula tangente
    tg = _my/_mx;
    //Calcula arco-tangente
    arc_tg = atan(tg);
    if (_mx < 0) {
      //Ajusta valor do arco-tangente
      arc_tg += PI;
    } else if (_my < 0) {
      //Ajusta valor do arco-tangente
      arc_tg += PI * 2;
    }
    //Encontra posição correta da pupila 
    _x = polarX(arc_tg, limite/2);
    _y = polarY(arc_tg, limite/2);
  } 
  noStroke();
  fill(0);
  //Se a posição do mouse estiver dentro da área do olho menos a área limite definido
  if (calculaDistancia(x, y, mouseX, mouseY) < limite/2) {
    //Desenha a pupila baseado na posição X
    ellipse(mouseX, mouseY, tamanho, tamanho);
    fill(255);
    ellipse(mouseX - (tamanho * 0.2), mouseY - (tamanho * 0.2), (tamanho * 0.3), (tamanho * 0.3));
  //Se não, desenha baseado na posição _x e _y encontrado, relativo à posição do olho
  } else {
    ellipse(x + _x, y + _y, tamanho, tamanho);
    fill(255);
    ellipse(_x - (tamanho * 0.2) + x, _y - (tamanho * 0.2) + y, (tamanho * 0.3), (tamanho * 0.3));
  }  
}

//Encontra posição x baseado no ângulo e raio
float polarX(float ang, float r) {
  return cos(ang) * r;
}
//Encontra posição y baseado no ângulo e raio
float polarY(float ang, float r) {
  return sin(ang) * r;
}

//Calcula distância entre 2 pontos
float calculaDistancia(float x1, float y1, float x2, float y2) {
  float b = x2 - x1;
  float c = y2 - y1;
  float distancia = sqrt((b*b) + (c*c));
  return distancia;
}