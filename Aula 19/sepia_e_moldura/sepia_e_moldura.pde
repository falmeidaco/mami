/**
  * Descrição: Tarefa aula 19
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */

import controlP5.*;
ControlP5 cp5;
Slider abc;

//Array com imagens da moldura                
PImage[] moldura = new PImage[16];
//Array multidimensional para mapeamento da moldura
int[][] mapa_moldura = {{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        { 0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 0},
                        { 0,16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0},
                        { 0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0},
                        { 0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0},
                        { 0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0},
                        { 0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0},
                        { 0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0},
                        { 0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0},
                        { 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0},
                        { 0,13,12,11,11,11,11,11,11,11,11,11,11,10, 9, 0},
                        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}};

//Imagens para mamipulação
PImage imagens[], imagem_aux1, imagem_aux2, imagem_final;
int imagem_index = 0;

//Variáveis para controle de pixels
float r, g, b, media_pb;
int pos, x, y;

//Variáveis de ajustes dos pixels
float _ruido = 0, 
      _pb = 0, 
      _vermelho = 0, 
      _verde = 0;

void setup () {
  
  size(960, 480);
  
  //Desabilita desenho de bordas
  noStroke();
  
  //Carregando imagens da moldura
  for (int i = 0; i < moldura.length; i++) {
    moldura[i] = loadImage("imagens/moldura/" + (i + 1) + ".png"); 
  }
  
  imagens = new PImage[6];
  //Carrega imagens para manipulação de pixels
  imagens[0] = loadImage("imagens/imagem1.jpg");
  imagens[1] = loadImage("imagens/imagem2.jpg");
  imagens[2] = loadImage("imagens/imagem3.jpg");
  imagens[3] = loadImage("imagens/imagem4.jpg");
  imagens[4] = loadImage("imagens/imagem5.jpg");
  imagens[5] = loadImage("imagens/imagem6.jpg");
  
  //Cria uma nova imagem auxiliar para aplicar o ruido
  imagem_aux1 = createImage(560, 400, RGB);
  //Cria uma nova imagem auxiliar para aplicar a escala de cinza
  imagem_aux2 = createImage(560, 400, RGB);
  //Cria uma nova imagem como o resultado da manipulação dos pixels
  imagem_final = createImage(560, 400, RGB);
  
  //Ajusta controles 
  cp5 = new ControlP5(this);
  
  //Controle ruido
  cp5.addSlider("_ruido")
     .setPosition(680, 40)
     .setSize(240,20)
     .setRange(0,1);
  cp5.getController("_ruido").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("_ruido").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  //Controle preto e branco
  cp5.addSlider("_pb")
     .setPosition(680, 100)
     .setSize(240,20)
     .setRange(0,1);
  cp5.getController("_pb").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("_pb").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  //Controla vermelho
  cp5.addSlider("_vermelho")
     .setPosition(680, 160)
     .setSize(240,20)
     .setRange(0,1);
  cp5.getController("_vermelho").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("_vermelho").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  //Controla verde
  cp5.addSlider("_verde")
     .setPosition(680, 220)
     .setSize(240,20)
     .setRange(0,1);
  cp5.getController("_verde").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("_verde").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
 
}

void draw() {
  
  background(100);
  fill(255);
  rect(0, 0, 640, 480);
  
  //Exibe imagem
  image(imagem_final, 40, 40);
  
  //Exibe moldura
  mostraMoldura(0, 0, 16, 12, 640, 480, mapa_moldura, moldura);
  
  textSize(10);
  fill(0);
  text("Imagem " + (imagem_index + 1) + ". Fonte: https://www.bostonglobe.com/news/bigpicture", 40, 460);
  
}

//Evento para mudar de imagem
void mouseClicked() {
  if ((mouseX > 40 && mouseX < 600) && (mouseY > 40 && mouseY < 440)) {
    if (imagem_index < imagens.length-1) {
      imagem_index++;
    } else {
      imagem_index = 0;
    }
  }
  modificaPixelsImagem();
}

//Eventos do slider
void _ruido(float value) {
  _ruido = value;
  modificaPixelsImagem();
}
void _pb(float value) {
  _pb = value;
  modificaPixelsImagem();
}
void _vermelho(float value) {
  _vermelho = value;
  modificaPixelsImagem();
}
void _verde(float value) {
  _verde = value;
  modificaPixelsImagem();
}

void modificaPixelsImagem() {
  imagens[imagem_index].loadPixels();
  imagem_aux1.loadPixels();
  imagem_aux2.loadPixels();
  imagem_final.loadPixels();
  //Scanline para percorrer pixels da imagem
  for (y = 0; y < 400; y += 1) {
    for (x = 0; x < 560; x += 1) {       
      //Calculando posição no vetor    
      pos = y * 560 + x;
      //Resgata cores originais da imagem
      r = red(imagens[imagem_index].pixels[pos]);
      g = green(imagens[imagem_index].pixels[pos]);
      b = blue(imagens[imagem_index].pixels[pos]);
      
      //Adiciona ruido à nova imagem
      imagem_aux1.pixels[pos] = color(r + random(100 * _ruido), g + random(100 * _ruido), b + random(100 * _ruido));
      
      //Carrega imagem auxiliar com escala de cinza
      r = red(imagem_aux1.pixels[pos]);
      g = green(imagem_aux1.pixels[pos]);
      b = blue(imagem_aux1.pixels[pos]);
      media_pb = 0.3 * r + 0.59 * g + 0.11 * b;
      imagem_aux2.pixels[pos] = color(media_pb);
      
      //Adiciona nível de escala de cinza utilizando técnica cross fade
      r = red(imagem_aux1.pixels[pos]) * (1 - _pb) + red(imagem_aux2.pixels[pos]) * _pb ;
      g = green(imagem_aux1.pixels[pos]) * (1 - _pb) + green(imagem_aux2.pixels[pos]) * _pb ;
      b = blue(imagem_aux1.pixels[pos]) * (1 - _pb) + blue(imagem_aux2.pixels[pos]) * _pb ;
      //Atualiza pixels da imagem final considerando modificações das cores vermelho e verde
      imagem_final.pixels[pos] = color(r + (255 * _vermelho), g + (255 * _verde), b);
    }
  }
  imagem_final.updatePixels();
}

//Scanline para exibir moldura baseado no mapeamento definido
void mostraMoldura(int x, int y, int colunas, int linhas, int largura, int altura, int[][] mapa, PImage[] imagens) {
 for (int i = 0; i < colunas; i++) {
   for (int j = 0; j < linhas; j++) {
     if (mapa[j][i] > 0 && mapa[j][i] < imagens.length+1) {
       image(imagens[mapa[j][i]-1], i * (largura/colunas) + x, j * (altura/linhas) + y, (largura/colunas), (altura/linhas)); 
     }
   }
 }
}