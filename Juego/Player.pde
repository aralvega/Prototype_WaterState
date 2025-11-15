/**Representa al jugador principal del juego*/
class Player {
  private PVector position; /**Vector posisicón*/
  private PVector speed;    /**Vector velocidad*/
  private IAnimationState animationState; /**Representa el estado de animación*/
  private int horizontalDirection; /**Indica si el personaje mira a la derecha o izquierda*/
  private ImageCache cache; /**Permite cargar y/o extraer las animaciones*/
  
  //atributos para físicas
  private float gravity;
  private float groundY;
  private boolean isGrounded;
  private float maxFallSpeed;

  /**Constructor parametrizado
  *  @param vector posición
  *  @param cache que permite cargar las imágenes y conformar las animaciones*/
  public Player(PVector position, ImageCache cache) {
    this.position = position;
    this.cache = cache;
    this.speed = new PVector(0, 0);
    this.horizontalDirection = 1;
    this.animationState = new PlayerIdleState(this.cache);
    //Iniciacilización atributos de fisica
    this.gravity = 1500f;
    this.groundY = 500f;
    this.isGrounded = false;
    this.maxFallSpeed = 2000f;
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
  
  public void updatePosition(){
    applyGravity();
    applyVerticalMovement();
    checkGroundCollision();
  }
  
  private void applyGravity(){
    if(!this.isGrounded){
      this.speed.y+= this.gravity*Time.getDeltaTime();
      this.speed.y = min(this.speed.y,maxFallSpeed);
    }
  }
  
  private void applyVerticalMovement(){
    this.position.y+=this.speed.y*Time.getDeltaTime();
  }
  
  private void checkGroundCollision(){
     if(this.position.y>=this.groundY){
       this.position.y=this.groundY;
       this.speed.y=0;
       this.isGrounded=true;
     }else{
       this.isGrounded=false;
     }
  }
  
}
