/**
  * Descrição: Tarefa aula 3
  * Disciplina: Matemática Aplicada à Multimida I
  * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
  * Autor: Felipe ALmeida
  */

//Iniciando variável que armazena as dimensões da figura
int quadradoLargura, quadradoAltura;

void setup() {
  //Iniciando tela com tamanho predefinido
  size(180,200);
  //Defindo dimensões da figura
  quadradoLargura = 20;
  quadradoAltura = 30;
}

void draw() {
  //Resetando o desenho
  background(255);
  //Desenhando as figuras (n figuras horizontais, n figuras verticais)
  distribuir(2,3);
}

/**
  * Função para organizar horizontalmente as imagens na tela de acordo
  * com os parametros passados (figuras horizontais e verticais) e com
  * a distancia igual entre elas e os limites da tela;
  */
void distribuir(int h, int v) {
  
  //Número de figuras a serem exibidas na tela
  int numQuadrado = h+v;
  //Resgatando o tamanho do lado maior da figura
  int ladoMaior = Math.max(quadradoLargura, quadradoAltura);
  //Resgatando o tamanho do lado menor da figura
  int ladoMenor = Math.min(quadradoLargura, quadradoAltura);
  //Calculando a largura total das figuras na horizontal
  int totalLarguraHorizontal = h*ladoMaior;
  //Calculando a largura total das figuras na vertical
  int totalLarguraVertical = v*ladoMenor;
  //Calculando a distância entre as figuras considerando a área livre resultante das somas das larguras 
  int distanciaFiguras = (width-(totalLarguraHorizontal+totalLarguraVertical))/(numQuadrado+1);
  //println(distanciaFiguras);
  
  //Defindo o preenchimento das figuras
  fill(0);
  
  //Variável auxilidar para defnir posição x das figuras
  int proxPosicao = 0;
  
  //Repetição relacionada ao número de figuras
  for (int i = 0; i < numQuadrado; i++) {
    //Verifica se existe figuras para ser exibidas na horizontal
    if (i<h) {
      //Desenhando figura horizontal
      rect(proxPosicao+distanciaFiguras, 20, ladoMaior,ladoMenor);
      //Atualizando variável auxiliar para ser usada na posição da próxima figura
      proxPosicao += ladoMaior+distanciaFiguras;
    //Caso não existam mais imagens na horizontal, exibir imagens na vertical
    } else {
      //Desenhando figura vertical
      rect(proxPosicao+distanciaFiguras, 20, ladoMenor,ladoMaior);
      //Atualizando variável auxiliar para ser usada na posição da próxima figura
      proxPosicao += ladoMenor+distanciaFiguras;
    }
  }
  
}