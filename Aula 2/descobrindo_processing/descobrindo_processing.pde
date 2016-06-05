/**
  * Descrição: Tarefa aula 2
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */
  
PImage img;
String image_url = "imagens/imagem.jpg";
color c; 
int xpos,ypos;

void setup() {
    size(300, 300);
    //Carregando imagem
    img = loadImage(image_url);
    //Definindo cor inicial como 0 (preto)
    c = 0;
    //Definindo posição central relacionado ao tamamho da imagem e da tela
    xpos = ((width/2)-(img.width/2));
    ypos = ((height/2)-(img.height/2));
}

//Evento do Processing
void mouseMoved() {
    //Atualização variável "c" com a o valor da cor do pixel em que o ponteiro do mouse está posicionado
    c = get(mouseX,mouseY);
    println(c);
}

void draw() {
    //Aplicando a cor de fundo
    background(c);
    //Imprimindo a imagem carregada caso ela tenha sido encontrada
    if (img != null) {
        image(img, xpos, ypos, 160, 160);
    }
}