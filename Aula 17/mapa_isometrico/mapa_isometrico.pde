/**
 * Descrição: Tarefa aula 17
 * Disciplina: Matemática Aplicada à Multimida I
 * Curo: Sistemas e Mídias Digitais (Universidade Federal do Ceará)
 * Autor: Felipe ALmeida
 */

//Array com imagens da moldura                
PImage[] tileset = new PImage[56];

//Movimentos
int[][] moviment_map = {
  { 0, 0, 0, 0, 0, 0, 0, 0}, 
  { 0, 1, 1, 1, 1, 1, 1, 0}, 
  { 0, 0, 0, 0, 0, 0, 1, 0}, 
  { 0, 1, 1, 1, 1, 0, 1, 0}, 
  { 0, 1, 0, 0, 0, 0, 1, 0}, 
  { 0, 1, 1, 1, 1, 0, 1, 0}, 
  { 0, 1, 1, 0, 1, 1, 1, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}};

//Terreno
int[][] tiles_map = {
  {14, 6, 6, 6, 6, 6, 6,15}, 
  { 8, 1, 1, 1, 1, 1, 1, 7}, 
  { 8, 3, 3, 3, 3, 3, 1, 7}, 
  { 8, 1, 1, 1, 1, 3, 1, 7}, 
  { 8, 1, 3, 3, 3, 3, 1, 7}, 
  { 8, 1, 1, 1, 1, 3, 1, 7}, 
  { 8, 1, 1, 3, 1, 1, 1, 7},
  {16, 5, 5, 5, 5, 5, 5,13}};
  
//Elementos do terreno
int[][] tiles2_map = {
  {47,52,52,52,52,52,52,44}, 
  {54, 0, 0, 0, 0, 0, 0,50}, 
  {54,52,52,52,52,44, 0,50}, 
  {54, 0, 0, 0, 0,50, 0,50}, 
  {54, 0,52,52,52,46, 0,50}, 
  {54, 0, 0, 0, 0,50, 0,50},
  {54, 0, 0,50, 0, 0, 0,50},
  {42,52,52,52,52,52,52,46}};

//Posição do terreno
int mapa_x, mapa_y;
//Posição do jogador
int player_x, player_y;

void setup () {
  size(560, 480);
  //Carregando imagens tileset
  for (int i = 0; i < tileset.length; i++) {
    tileset[i] = loadImage("imagens/tileset/tileset_" + (i + 1) + ".png");
  }
  //Definindo posição do terreno
  mapa_x = 24;
  mapa_y = 110;
  //Definindo posição inicial do jogador
  player_x = 1;
  player_y = 1;
}

void draw() {
  background(124, 187, 255);
  //Exibir terreno  
  mapeamentoIsometrico(mapa_x, mapa_y, 64, 64, 16, 0, tiles_map, tileset);
  //Exibe personagem na posição atual
  fill(0);
  //losango(player_x * 32 + (player_y * 32), height/2 - (player_x * 16) + (player_y * 16), 64, 32);
  posicionaPersonamge(player_x, player_y, mapa_x, mapa_y);
  //Exibe elementos do terreno
  mapeamentoIsometrico(mapa_x, mapa_y, 64, 64, 16, 1, tiles2_map, tileset);
}

//Scanline para mapeamento do terreno baseado a matriz e nível definido
void mapeamentoIsometrico(float x, float y, float largura, float altura, float vertical_distance, int level, int[][] mapa, PImage[] imagens) {
  for (int i = 0; i < mapa.length; i++) {
    for (int j = mapa[i].length-1; j > -1; j--) {
      if (mapa[i][j] > 0 && mapa[i][j] < imagens.length+1) {
        image(imagens[mapa[i][j]-1], (largura / 2 * j) + (largura / 2 * i) + x, (i * vertical_distance) - (j * vertical_distance) - (level * altura / 2) + (mapa[0].length * vertical_distance) + y, largura, altura);
      }
    }
  }
}

void posicionaPersonamge(int x, int y, int _x, int _y) {
  losango(x * 32 + (y * 32) + _x, (_y+(16*8)) - (x * 16) + (y * 16), 64, 32);
}

void losango(float x, float y, float w, float h) {
  quad(x, h/2+y, w/2+x, y, w+x, h/2+y, w/2+x, h+y);
}

//Movimento do personagem
void keyPressed() {
  if (keyCode == LEFT) {
    if (player_x > 0) {
      if (moviment_map[player_y][player_x-1] == 1) {
        player_x -= 1;
      }
    }
  } else if (keyCode == RIGHT) {
    if (player_x < (moviment_map[player_y].length - 1)) {
      if (moviment_map[player_y][player_x+1] == 1) {
        player_x += 1;
      }
    }
  } else if (keyCode == UP) {
    if (player_y > 0) {
      if (moviment_map[player_y-1][player_x] == 1) {
        player_y -= 1;
      }
    }
  } else if (keyCode == DOWN) {
    if (player_y < (moviment_map.length - 1)) {
      if (moviment_map[player_y+1][player_x] == 1) {
        player_y += 1;
      }
    }
  }
}