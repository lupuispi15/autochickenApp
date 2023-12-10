#include <WiFi.h>
#include <FirebaseESP32.h>
#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>
#include <DHT.h>
#define WIFI_SSID "VIVA"
#define WIFI_PASSWORD "123456789"
#define API_KEY "AIzaSyBa7AWSeMeelYs6mfYlozLmGzjECznSvJk"
#define DATABASE_URL "https://gallinero-cc4c2-default-rtdb.firebaseio.com/" //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app
#define DHTPIN 27
#define DHTTYPE  DHT11

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;
float valorMaximo;
const int triggerPin = 12;
const int echoPin = 14;
const int triggerPin2 = 26;
const int echoPin2 = 25;

int a, b, x, y;
int valorlimite = 800;
double resultado;
int numerodeboton = 2;
long durationoriginal;
float distanceoriginal;
long durationoriginal2;
float distanceoriginal2;

// currentime
unsigned long previousMillis = 0;  // Guardará la última vez que se actualizó el evento.
const long interval = 30000;       // Intervalo en el que quieres ejecutar la función (30 segundos).

DHT dht(DHTPIN, DHTTYPE);
void setup()
{
  Serial.begin(115200);
  pinMode(triggerPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(triggerPin2, OUTPUT);
  pinMode(echoPin2, INPUT);
  delay(2000);
  dht.begin();
  WiFi.disconnect();  
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  config.database_url = DATABASE_URL;

  Firebase.begin(DATABASE_URL, API_KEY);

  Firebase.setDoubleDigits(2);

}
  void loop()
  { 
    delay(5000);
    float h = dht.readHumidity();
    float t = dht.readTemperature();
    unsigned long currentMillis = millis();
   
    if (numerodeboton == 2) {
      Firebase.setDouble(fbdo, "/Sensores/temp", t);
      Firebase.setDouble(fbdo, "/Sensores/hum", h);
      digitalWrite(triggerPin, LOW);
      delayMicroseconds(2);
      digitalWrite(triggerPin, HIGH);
      delayMicroseconds(10);
      digitalWrite(triggerPin, LOW);
      durationoriginal = pulseIn(echoPin, HIGH);
      distanceoriginal = (durationoriginal / 2) * 0.0344;
      digitalWrite(triggerPin2, LOW);
      delayMicroseconds(2);
      digitalWrite(triggerPin2, HIGH);
      delayMicroseconds(10);
      digitalWrite(triggerPin2, LOW);
      durationoriginal2 = pulseIn(echoPin2, HIGH);
      distanceoriginal2 = (durationoriginal2 / 2) * 0.0344;

      Serial.print("distancio normal: ");
      Serial.println(distanceoriginal);
//      distanceoriginal = distanceoriginal - 4.0;
      Serial.print("distancia reducida : ");
      Serial.println(distanceoriginal);

      distanceoriginal2 = distanceoriginal2 - 4.0;
      numerodeboton = 1;
    } else if (distanceoriginal != 0 && distanceoriginal2 != 0) {
      long duration;
      float distance;
      long duration2;
      float distance2;
      digitalWrite(triggerPin, LOW);
      delayMicroseconds(2);
      digitalWrite(triggerPin, HIGH);
      delayMicroseconds(10);
      digitalWrite(triggerPin, LOW);
      duration = pulseIn(echoPin, HIGH);
      distance = (duration / 2) * 0.0344;
      digitalWrite(triggerPin2, LOW);
      delayMicroseconds(2);
      digitalWrite(triggerPin2, HIGH);
      delayMicroseconds(10);
      digitalWrite(triggerPin2, LOW);
      duration2 = pulseIn(echoPin2, HIGH);
      distance2 = (duration2 / 2) * 0.0344;
      //Serial.print(F("Humidity: "));
      //Serial.print(h);
      //Serial.print(F("%  Temperature: "));
      //Serial.print(t);
      //Serial.print(F("°C "));
   
        if (currentMillis - previousMillis >= interval) {
            // Guarda la última vez que ejecutaste la acción.
            previousMillis = currentMillis;
            // Ejecuta el método que quieres llamar cada 30 segundos.
            updateFirebase(duration, distance, duration2, distance2);
        }
      
    }

    void updateFirebase(long duration, float distance, long duration2, float distance2) {
        if (Firebase.ready()) {
            //Serial.println(distance);
            //Serial.println(distance2);
            float valorNormalizado = distance/distanceoriginal;
            float valorInvertido = 1.0 - valorNormalizado;
            float rangoAjustado = valorInvertido * 0.9;
            double porcentaje = static_cast<double>(rangoAjustado) + 0.1;
            float valorNormalizado2 = distance2/distanceoriginal2;
            float valorInvertido2 = 1.0 - valorNormalizado2;
            float rangoAjustado2 = valorInvertido2 * 0.9;
            double porcentaje2 = static_cast<double>(rangoAjustado2) + 0.1;
            Firebase.setDouble(fbdo, "/Sensores/food", porcentaje);
            Firebase.setDouble(fbdo, "/Sensores/water", porcentaje2);
            Firebase.setDouble(fbdo, "/Sensores/temp", t);
            Firebase.setDouble(fbdo, "/Sensores/hum", h);
        }
    }
}
