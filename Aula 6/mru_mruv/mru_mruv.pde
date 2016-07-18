float tAtual = 0;
float vInicial = -100;
float aAtual = 20;
float dAtual;
float vAtual = 60;
float dAtual2 = 0;

void setup(){
  size(600, 600);
  frameRate(60);
}

void draw(){
  fill(255);
  dAtual = MRUV(vInicial, aAtual, tAtual/60);
  dAtual2 = MRU(vAtual, tAtual/60);
  background(255);
  mostraMundo();
  ellipse(dAtual2, dAtual+600, 10, 10);
  
  fill(125, 70, 80, 100);
  text("Tempo :"+(int)tAtual/60, 10, 10);
  text("Posição y: "+((int)dAtual+600), 10, 20);
  text("Posição x: "+(int)dAtual2, 10, 30);
  text("Velocidade Inicial do Lançamento Vertical: "+(int)vInicial, 10, 40);
  text("Aceleração: "+(int)aAtual, 10, 50);
  text("Velocidade do Movimento Horizontal: "+(int)vAtual, 10, 60);
  tAtual++;
}

float MRU(float v, float t){
  float d;
  d = v * t;
  return(d);
}

float MRUV(float v, float a, float t){
  float d = v*t+a*t*t/2;
  return(d);
}

void mostraMundo(){
  for(float i=0; i<12; i++){
    line(i*50, 0, i*50, 600);
    line(0, i*50, 600, i*50);
  }
}