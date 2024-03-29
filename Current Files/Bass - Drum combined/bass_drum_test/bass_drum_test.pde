//New pin values required for Arduino Mega operation

int incomingByte[2] = {0};

int strum_delay = 10; //sets delay for strum bar after notes are depressed
int Bg = 2; //B means bass g is green, r is red, y is yellow, b is blue, o is orange
int Br = 3;
int By = 4;
int Bb = 5;
int Bo = 6;
int Bs = 7; //Bs is bass strum

int Dr = 8; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
int Dy = 9;
int Db = 10;
int Dg = 11;
int Df = 12;

int Gg = 14; //Guitar
int Gr = 15;
int Gy = 16;
int Gb = 17;
int Go = 18;
int Gs = 19; //Gs is guitar strum

void setup()
{
  Serial.begin(9600);
  
  //Bass
  pinMode(Bg, OUTPUT);
  pinMode(Br, OUTPUT);
  pinMode(By, OUTPUT);
  pinMode(Bb, OUTPUT);
  pinMode(Bo, OUTPUT);
  pinMode(Bs, OUTPUT);

  //Drums
  pinMode(Dr, OUTPUT); 
  pinMode(Dy, OUTPUT);
  pinMode(Db, OUTPUT);
  pinMode(Dg, OUTPUT);
  pinMode(Df, OUTPUT);
  
  //Guitar
  pinMode(Gg, OUTPUT);
  pinMode(Gr, OUTPUT);
  pinMode(Gy, OUTPUT);
  pinMode(Gb, OUTPUT);
  pinMode(Go, OUTPUT);
  pinMode(Gs, OUTPUT);
}

void loop()
{
  if(Serial.available() > 1) //checks to see if data is at data port
  { 
   incomingByte[0]=Serial.read(); //read bass first, drum second
   incomingByte[1]=Serial.read(); 
   
   //bass
   digitalWrite(Bg,bitRead(incomingByte[0],0)); //reads the value of the byte and sets the output pin to the value of the bit
   
   digitalWrite(Br,bitRead(incomingByte[0],1));
   
   digitalWrite(By,bitRead(incomingByte[0],2));
   
   digitalWrite(Bb,bitRead(incomingByte[0],3));
  
   digitalWrite(Bo,bitRead(incomingByte[0],4));
  
   delay(strum_delay);
  
   digitalWrite(Bs,(bitRead(incomingByte[0],0) || bitRead(incomingByte[0],1) || bitRead(incomingByte[0],2)|| bitRead(incomingByte[0],3) || bitRead(incomingByte[0],4)));
  
   //drum
   digitalWrite(Df,(bitRead(incomingByte[0],5) && bitRead(incomingByte[0],6) && bitRead(incomingByte[1],0)&& bitRead(incomingByte[0],1)));
   
   digitalWrite(Dr,bitRead(incomingByte[0],5)); 
   
   digitalWrite(Dy,bitRead(incomingByte[0],6));
   
   digitalWrite(Db,bitRead(incomingByte[1],0));
   
   digitalWrite(Dg,bitRead(incomingByte[1],1)); 
   
   //guitar
   digitalWrite(Gg,bitRead(incomingByte[1],2)); //reads the value of the byte and sets the output pin to the value of the bit
   
   digitalWrite(Gr,bitRead(incomingByte[1],3));
   
   digitalWrite(Gy,bitRead(incomingByte[1],4));
   
   digitalWrite(Gb,bitRead(incomingByte[1],5));
  
   digitalWrite(Go,bitRead(incomingByte[1],6));
  
   delay(strum_delay);
  
   digitalWrite(Gs,(bitRead(incomingByte[1],2) || bitRead(incomingByte[1],3) || bitRead(incomingByte[1],4)|| bitRead(incomingByte[1],5) || bitRead(incomingByte[1],6)));
  }
  
  
}
