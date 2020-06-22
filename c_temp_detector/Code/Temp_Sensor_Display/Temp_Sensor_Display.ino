#include <OneWire.h>
#include <DallasTemperature.h>
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include <WiFiEsp.h>
#include <WiFiEspClient.h>
#include <PubSubClient.h>
#include "SoftwareSerial.h"


//Conexión a la red wifi: nombre de la red y contraseña
#define WIFI_AP "###"
#define WIFI_PASSWORD "##"

// maximum received message length 
#define MAX_MSG_LEN (128)

//Nombre o IP del servidor mosquitto
char server[50] = "###";


const char *topic = "user/temperature";
const char *topicSend = "user/temperature";
const char *topicRun = "user/temperature/check";

// Pin donde se conecta el bus 1-Wire
const int pinDatosDQ = 9;
float temperature = 0.00;
bool tomarTemperatura = false;

//Contador para el envio de datos
unsigned long lastSend;
int status = WL_IDLE_STATUS;

// Instancia a las clases OneWire y DallasTemperature
OneWire oneWireObjeto(pinDatosDQ);
DallasTemperature sensorDS18B20(&oneWireObjeto);

//Crear el objeto lcd  dirección  0x3F y 16 columnas x 2 filas
LiquidCrystal_I2C lcd(0x27,16,2);

//Inicializamos el objeto de cliente esp
WiFiEspClient espClient;

//Iniciamos el objeto subscriptor del cliente 
//con el objeto del cliente
PubSubClient client(espClient);

//Conexión serial para el esp con una comunicación
//serial, pines 2: rx y 3: tx
SoftwareSerial soft(2, 3);
 
void setup() {
    
    //Iniciamos comunicacion serie
    serialSetup();

    //Setup de la pantalla lcd
    lcdSetup();
    
    //Iniciamos la conexión a la red WiFi
    InitWiFi();
    //connectWifi();
    //Colocamos la referencia del servidor y el puerto
    client.setServer( server, 1883 );
    client.setCallback(mqttCallback);
    lastSend = 0;
    
    
    
    // Iniciamos el bus 1-Wire
    sensorDS18B20.begin(); 

    
}
 
void loop() {

    //Validamos si el modulo WiFi aun esta conectado a la red
    //status = WiFi.status();
    //if(status != WL_CONNECTED) {
        //Si falla la conexión, reconectamos el modulo
    //    reconnectWifi();
    //}

    //Validamos si esta la conexión del servidor
    if(!client.connected() ) {
        //Si falla reintentamos la conexión
        reconnectClient();
    }
    
   client.loop();

   // idle
   delay(500);

   lcd.clear();    
   lcd.setCursor(0,0);
   lcd.print("Aguardando...");
     
}


void serialSetup(){
    // Iniciamos la comunicación serie
    Serial.begin(9600);

}
void lcdSetup(){
    // Inicializar el LCD
    lcd.init();
    
    //Encender la luz de fondo.
    lcd.backlight();
    
    //Borro lo que este
    lcd.clear();
    
    // Escribimos el Mensaje en el LCD.
    lcd.setCursor(0,0);
    lcd.print("Bienvenido");
  
}

void lcdMessage(String mensaje){
  //Borro lo que este
    lcd.clear();    
    // Escribimos el Mensaje en el LCD.
    lcd.setCursor(0,0);
    lcd.print(mensaje.c_str());
    //lcd.print("pepe");
  }

float getTemp(){
    float result = 0.00;
    sensorDS18B20.requestTemperatures();
    result = sensorDS18B20.getTempCByIndex(0);
    return result;    
}

void showTemp(float temp){
    //Borro lo que este
    lcd.clear();
    
    //lcd.noDisplay();
    // Escribimos el Mensaje en el LCD.
    lcd.setCursor(0,0);
    lcd.print("Temperatura:");
    // Ubicamos el cursor en la primera posición(columna:0) de la segunda línea(fila:1)
    lcd.setCursor(0, 1);
     // Escribimos el número de segundos trascurridos
    lcd.print(temp);
    //lcd.print("45");
    lcd.print(" Grados");
    lcd.display();
}

bool countdown(){
  bool result = false;

  for (int i = 10; i >= 1; i--) {
    showCountDown(i);
    delay(1000);
  }
  result = true;
  
  return result;
}

void showCountDown(int seconds){
    //Borro lo que este
    lcd.clear();
    
    //lcd.noDisplay();
    // Escribimos el Mensaje en el LCD.
    lcd.setCursor(0,0);
    lcd.print("Espere");
    // Ubicamos el cursor en la primera posición(columna:0) de la segunda línea(fila:1)
    lcd.setCursor(0, 1);
     // Escribimos el número de segundos trascurridos
    lcd.print(seconds);
    lcd.print(" ...");
    lcd.display();
}

//Inicializamos la conexión a la red wifi
void InitWiFi()
{
    //Inicializamos el puerto serial
    soft.begin(9600);
    //Iniciamos la conexión wifi
    WiFi.init(&soft);
    //Verificamos si se pudo realizar la conexión al wifi
    //si obtenemos un error, lo mostramos por log y denememos el programa
    if (WiFi.status() == WL_NO_SHIELD) {
        Serial.println("El modulo WiFi no esta presente");
        while (true);
    }
    reconnectWifi();
}



void reconnectWifi() {
    //lcdMessage("Conectando WiFi");
    lcd.clear();    
   lcd.setCursor(0,0);
   lcd.print("Conectando WiFi");
    Serial.println("Iniciar conección a la red WIFI");
    while(status != WL_CONNECTED) {
        Serial.print("Intentando conectarse a WPA SSID: ");
        Serial.println(WIFI_AP);
        //Conectar a red WPA/WPA2
        status = WiFi.begin(WIFI_AP, WIFI_PASSWORD);
        delay(500);
    }
    Serial.println("Conectado a la red WIFI");
    //lcdMessage("Conectado");
    lcd.clear();    
   lcd.setCursor(0,0);
   lcd.print("Conectado");
}

void reconnectClient() {
    //lcdMessage("conectando Mqtt");
    lcd.clear();    
   lcd.setCursor(0,0);
   lcd.print("conectando Mqtt");
    //Creamos un loop en donde intentamos hacer la conexión
    while(!client.connected()) {
        Serial.print("Conectando a: ");
        Serial.println(server);
        //Creamos una nueva cadena de conexión para el servidor
        //e intentamos realizar la conexión nueva
        //si requiere usuario y contraseña la enviamos connect(clientId, username, password)
        String clientId = "ESP8266Client-" + String(random(0xffff), HEX);
        if(client.connect(clientId.c_str())) {
            Serial.println("[DONE]");
            client.subscribe(topicRun);
            client.publish(topicRun,"Conectado");
        } else {
            Serial.print( "[FAILED] [ rc = " );
            Serial.print( client.state() );
            Serial.println( " : retrying in 5 seconds]" );
            delay( 5000 );
        }
    }
    //lcdMessage("Conectado");
    lcd.clear();    
   lcd.setCursor(0,0);
   lcd.print("Conectado");
}


void sendDataTemp(char* usuario, float temp)
{

  char str_val[6];
  char payload[64];

  /* 4 is mininum width, 2 is precision; float value is copied onto str_temp*/
  dtostrf(temp, 4, 2, str_val);
  
  sprintf(payload, "%s", ""); // Cleans the payload content 
  sprintf(payload, "%s{\"User\": %s,", payload, usuario); // Pongo usuario
  sprintf(payload, "%s \"Value\": \"%s\"}", payload, str_val); // Agrego temperatura
  
  client.publish( topicSend, payload);

}

void mqttCallback(char *topic, byte *payload, unsigned int length) {
  Serial.println("Entra a callback");
  static char message[MAX_MSG_LEN+1];
  if (length > MAX_MSG_LEN) {
    length = MAX_MSG_LEN;
  }
  strncpy(message, (char *)payload, length);
  message[length] = '\0';


  //if (strcmp(message, "run") == 0) {
  //  mainRoutine();
  //} 
  mainRoutine(message);
}

void mainRoutine(char* usuario){
  Serial.println("Entro en main run" );
  tomarTemperatura = countdown();

  if(tomarTemperatura){
    //Tomamos la temperatura del sensor
    temperature = getTemp();
    // Leemos y mostramos los datos de los sensores DS18B20
    Serial.print("Temperatura sensor: ");
    Serial.print(temperature);
    Serial.println(" C");
  
    //Mostramos la temperatura en la pantalla
    showTemp(temperature);

    //Mando la temp a mqtt
    sendDataTemp(usuario, temperature);
    delay( 5000 );
  }
}
