/**Permite almacenar y acceder el deltaTime*/
static class Time{
  private static float deltaTime;
  
  public static void setDeltaTime(float dt){
    deltaTime = dt;
  }
  public static float getDeltaTime(){
    return deltaTime;
  }
}
