private float lastTime; /**Usado para caclular el deltaTime*/
private Player player;  /**Representa al personaje principal*/
private ImageCache cache;/**Permite cargar los sprites y ejecutar la animación del personaje*/

/**Permite establecer la configuración inicial del juego*/
public void setup(){
  size(800,600);
  this.cache = new ImageCache(this);
  this.player = new Player(new PVector(width/2,height/2),this.cache);
  this.lastTime = millis();
}

/**Implementa el patron Game Loop, ejecuta el lienzo y su actualización usando fPS*/
public void draw(){
  //cálculo del deltaTime
  float currentTime = millis();
  float deltaTime = (currentTime-this.lastTime)/1000f;
  Time.setDeltaTime(deltaTime);
  this.lastTime = currentTime;
  // ejecución del contenido del lienzo
  background(0);
  player.display();
  
}
