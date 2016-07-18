/**
  * Descrição: Tarefa aula 18
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */

import controlP5.*;
ControlP5 cp5;
Slider abc;

//Imagens para mamipulação
PImage imagens[], imagem_final;
int imagem_index = 0;

//Variáveis para controle de pixels
float h, s, b, _h, _s, _b;
int pos, x, y;

void setup () {
 
  size(960, 480);
  //Define modo padrão de cor como HSL
  colorMode(HSB);
  //Desabilita desenho de bordas
  noStroke();
 
  imagens = new PImage[3];
  //Carrega imagens para manipulação de pixels
  imagens[0] = loadImage("imagens/imagem1.jpg");
  imagens[1] = loadImage("imagens/imagem2.jpg");
  imagens[2] = loadImage("imagens/imagem3.jpg");
  /*
  imagens[3] = loadImage("imagens/imagem4.jpg");
  imagens[4] = loadImage("imagens/imagem5.jpg");
  imagens[5] = loadImage("imagens/imagem6.jpg");
  */
  
  imagem_final = createImage(640, 480, HSB);
  
  //Ajusta controles 
  cp5 = new ControlP5(this);
  
  //Controla a saturação da imagem
  cp5.addSlider("_s")
     .setPosition(680, 40)
     .setSize(240,20)
     .setRange(-100,100);
  cp5.getController("_s").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("_s").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  //Controla o brilho da imagem
  cp5.addSlider("_b")
     .setPosition(680, 100)
     .setSize(240,20)
     .setRange(-100,100);
  cp5.getController("_b").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("_b").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
 
}

void draw() {
  
  background(100);
  fill(255);
  rect(0, 0, 640, 480);
  
  //Exibe imagem
  image(imagem_final, 0, 0);
  
  textSize(10);
  fill(0);
  text("Imagem " + (imagem_index + 1) + ". Fonte: https://iso.500px.com/", 41, 461);
  fill(255);
  text("Imagem " + (imagem_index + 1) + ". Fonte: https://iso.500px.com/", 40, 460);
  
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
void _s(float value) {
  _s = value;
  modificaPixelsImagem();
}
void _b(float value) {
  _b = value;
  modificaPixelsImagem();
}

void modificaPixelsImagem() {
  imagens[imagem_index].loadPixels();
  imagem_final.loadPixels();
  //Scanline para percorrer pixels da imagem
  for (y = 0; y < 480; y += 1) {
    for (x = 0; x < 640; x += 1) {       
      //Calculando posição no vetor
      pos = y * 640 + x;
      //Resgata cores originais da imagem
      h = hue(imagens[imagem_index].pixels[pos]);
      s = saturation(imagens[imagem_index].pixels[pos]);
      b = brightness(imagens[imagem_index].pixels[pos]);     
      //Cria imagem final com brilho e contraste definido
      imagem_final.pixels[pos] = color(h, s + _s, b + _b);
    }
  }
  imagem_final.updatePixels();
}