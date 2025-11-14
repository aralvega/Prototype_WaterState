/**Estado que representa la animación del estado en reposo*/
class PlayerIdleState implements IAnimationState{
  private float timerAnimation; /**contador para indicar cuanto tiempo se está ejecutando un frame*/
  private float frameDuration;  /**duración establecida para la ejecución de un frame*/
  private int indexImages;      /**índice para elegir el frame del arreglo de animación*/
  private ImageCache cache;     /**Permite acceder a los arreglos de animación*/
  
  /**Constructor parametrizado*/
  public PlayerIdleState(ImageCache cache){
    this.cache = cache;
    this.frameDuration = 0.15f;
    this.timerAnimation = 0f;
  }
  
  /**Visualiza la animación del estado en reposo del personaje*/
  public void display(PVector position, int horizontalDirection){
    PImage currentAnim[] = (horizontalDirection==1)
          ? cache.getIdleRight() : cache.getIdleLeft();

        this.timerAnimation += Time.getDeltaTime();
        if (timerAnimation > this.frameDuration) {
          this.timerAnimation = 0f;
          this.indexImages++;
        }

        if (this.indexImages >= currentAnim.length)
          this.indexImages = 0;

        imageMode(CENTER);
        image(currentAnim[this.indexImages],
          position.x, position.y);
  }
}
