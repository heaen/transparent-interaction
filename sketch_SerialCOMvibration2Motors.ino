int Pin[] = {0,2,3,4,5,6,7,8,9};  
int value = 0;  // variable to keep the actual value
void setup() 
{ 
 //Initialize pins as OUTPUTS and begin serial connection
 for(int i=1; i<9 ; i++){
  pinMode(Pin[i], OUTPUT); 
 }
 Serial.begin(9600);
} 
 
void loop() 
{
  int input = Serial.read();  // read serial 
  switch (input){
    case 1:  
    //erschrocken
      if(input == 1){ //If Processing passes a '1' do case one
        
        delay(1000);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(2000);
        
       }
       break;
       
    case 2:
    //wuetend
      if(input == 2){  //If Processing passes a '2' do case two
        digitalWrite(Pin[2],HIGH);
        digitalWrite(Pin[3],HIGH);
        delay(3000);
        digitalWrite(Pin[2],LOW);
        digitalWrite(Pin[3],LOW);
        delay(2000);
        
       }
       break;
       
    case 3:
    //erstaunt
      if(input == 3){  //If Processing passes a '3' do case three
      
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(300);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(500);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1000);
       
       }
       break;
       
    case 4:
    //achtsam
      if(input == 4){  //If Processing passes a '4' do case four
      
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(100);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(700);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(100);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(100);
      
       }
       break;
       
    case 5:
    //angewidert
      if(input == 5){  //If Processing passes a '5' do case five
        
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(100);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(100);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(100);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(1000);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1000);
        
       }
       break;
       
   case 6:
   //bewundernd
      if(input == 6){  //If Processing passes a '6' do case six
        
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(250);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1000);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(250);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1000);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(250);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(100);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1000);
        
       }
       break;
       
    case 7:
    //begeistert
      if(input == 7){  //If Processing passes a '7' do case seven
        
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(50);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(2000);
        
       }
       break;
       
    case 8:
    //betruebt
      if(input == 8){  //If Processing passes a '8' do case eight
        
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(500);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(200);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1000);
        digitalWrite(Pin[2], HIGH);
        digitalWrite(Pin[3], HIGH);
        delay(500);
        digitalWrite(Pin[2], LOW);
        digitalWrite(Pin[3], LOW);
        delay(1500);
              
       }
       break;
  }
} 
