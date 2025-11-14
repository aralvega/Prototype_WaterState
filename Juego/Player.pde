/**Representa al jugador principal del juego*/
class Player {
  private PVector position; /**Vector posisicón*/
  private PVector speed;    /**Vector velocidad*/
  private IAnimationState animationState; /**Representa el estado de animación*/
  private int horizontalDirection; /**Indica si el personaje mira a la derecha o izquierda*/
  private ImageCache cache; /**Permite cargar y/o extraer las animaciones*/

  /**Constructor parametrizado
  *  @param vector posición
  *  @param cache que permite cargar las imágenes y conformar las animaciones*/
  public Player(PVector position, ImageCache cache) {
    this.position = position;
    this.cache = cache;
    this.speed = new PVector(0, 0);
    this.horizontalDirection = 1;
    this.animationState = new PlayerIdleState(this.cache);
  }
  
  /**Cambia el estado de animación
  *  @param representa la animación de estado*/
  public void changeAnimationState(IAnimationState animationState){
    this.animationState = animationState;
  }

  /**Ejecuta una acción del estado*/
  public void display() {
    animationState.display(this.position,this.horizontalDirection);
  }
}
