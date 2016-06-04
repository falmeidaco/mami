//Variáveis necessára para interatividade com o mouse
int lastX,lastY;

void setup() {
  size(800, 600);
  //Preenchendo o fundo de branco
  background(255);
  //Exibindo a bandeira no centro da tela com largura especificada no método criado
  mostraBandeiraBrasil(width/2,height/2,550);
}

void draw() {
  //Interatividade com o mouse
  if (mousePressed){
    background(255);
    //Ao clicar e arrastar o mouse, a bandeira é desenhada com a largura desejada pelo usuário
    mostraBandeiraBrasil(
      lastX+float((mouseX-lastX)/2),
      (((float(mouseX-lastX)/20)*14)/2)+lastY,
      float(mouseX-lastX));    
  }
}

//Método para exibição da bandeira do Brasil baseado no padrão definodo na Lei Federal 5700, S. II, A. 5 - 01/09/1971
void mostraBandeiraBrasil(float x, float y, float l) 
{
  //Descobrindo o tamanho do módulo baseado na largura especificada
  float modulo = l/20;
  //Descobrindo a altura baseado no tamanho do módulo encontrado
  float altura = 14*modulo;
  //Descobrindo o raio do círculo central baseado no tamanho do módulo encontrado
  float raio = modulo*3.5;
  //Descobrindo a distância dos vértices do losando com o retângulo externo baseado no tamanho do módulo encontrado
  float distanciaVerticeLosango = modulo*1.7;
  
  fill(0, 168, 89);
  //Desenhando e posicionado o retângulo de acordo com os parâmetro informados.
  rect(x-l/2, y-altura/2, l, altura);
  
  fill(255, 204, 41);
  //Desenhando o losango utilizando o método auxiliar criado
  losango(x,y,l-(distanciaVerticeLosango*2), altura-(distanciaVerticeLosango*2));
  
  fill(62, 64, 149);
  //Desenhando o circulo central da bandeira
  ellipse(x, y, raio*2, raio*2);
  
  //Mostra a marcação dos módulos na baneira se a tecla shift estiver pressionada
  if (keyPressed && keyCode==SHIFT) {
    for (int i = 0; i<20; i++) {
      line((modulo*i)+x-l/2, y-(altura/2), (modulo*i)+x-l/2, y+(altura/2));
    }
    for (int i = 0; i<14; i++) {
      line(x-(l/2), modulo*i+y-altura/2, x+(l/2), modulo*i+y-altura/2);
    }
  } 
}

//Método auxiliar para desenho de um losango, recebendo os parâmetros x e y para posição, l e a para largura e altura respectivamente
void losango(float x, float y, float l, float a) {
  quad(x-(l/2),y, x,y-(a/2), x+(l/2),y, x,y+(a/2));
}

//Evento necessário para interatividade com o mouse
void mousePressed() {
  lastX = mouseX;
  lastY = mouseY;
}