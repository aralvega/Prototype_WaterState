/**Permite cargar el tileSheet y extraer los sprites para agruparlos
*  y generar una colección de animaciones disponibles para ser utilziadas
*  en la visualización de animaciones*/
class ImageCache {
  private PApplet app; /**Permite acceder al lienzo*/
  /**Estrcutura de datos para almacenar los arreglos de animaciones*/
  private HashMap<String, PImage[]> animations = new HashMap<>();

  /**Constructor parametrizado*/
  public ImageCache(PApplet app){
    this.app = app;
  }
  
  /**Permite acceder al arreglo de animaciones en reposo
  *  con el personaje mirando a la derecha. En caso de no
  *  estar cargado, los carga de forma previa
  *  @return arreglo de imagenes*/
  public PImage[] getIdleRight(){
    if (!animations.containsKey("idleRight")){
      loadIdle();
    }
    return animations.get("idleRight");
  }

  /**Permite acceder al arreglo de animaciones en reposo
  *  con el personaje mirando a la izquierda. En caso de no
  *  estar cargado, los carga de forma previa
  *  @return arreglo de imagenes*/
  public PImage[] getIdleLeft(){
    if (!animations.containsKey("idleLeft")){
      loadIdle();
    }
    return animations.get("idleLeft");
  }
  
  /**Carga el tileSheet para extraer los sprites que conforman
  *  animaciones, almacenándolos en arreglos*/
  private void loadIdle(){
    PImage sheet = app.loadImage("images/Gotita.png");

    PImage[] idleRight = new PImage[2];
    PImage[] idleLeft = new PImage[2];

    idleRight[0] = sheet.get(0, 0, 50, 41);
    idleRight[1] = sheet.get(50, 0, 50, 41);

    idleLeft[0] = sheet.get(0, 246, 50, 41);
    idleLeft[1] = sheet.get(50, 246, 50, 41);

    for(int i=0; i<2; i++){
      idleRight[i].resize(idleRight[i].width*2, idleRight[i].height*2);
      idleLeft[i].resize(idleLeft[i].width*2, idleLeft[i].height*2);
    }

    animations.put("idleRight", idleRight);
    animations.put("idleLeft", idleLeft);
  }
}
