/**Usado para implementar la maquina de estados de la animaciones*/
interface IAnimationState{
  /**Visualiza la animación del estado actual*/
  void display(PVector position, int horizontalDirection);
}
