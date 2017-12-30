import processing.serial.*;

/*STEP 1. Depending on which memories you want to embed in your diary, following area can be varied*/

import processing.sound.*;
import processing.video.*;
SoundFile file;
Movie myMovie1;
PImage img1;
PImage img3;
PImage img4;
PImage img6;
PImage img7;
PImage img8;
PImage img10;
PImage img12;

Serial myPort;
String val ;

/*STEP 2. Read your tag’s number in Arduino and name it with your memory*/

String music = "93:38:99:0C";
String video1 = "04:D7:FC:42";
String image = "04:BC:FC:42";
String website4 = "04:7D:FF:42";
String image3 = "04:C2:FC:42";
String image4 = "04:75:FC:42";
String website5 = "04:67:FC:42";
String image6 = "04:5B:FC:42";
String image7 = "04:77:FF:42";
String image8 = "04:D1:FC:42";
String website3 = "04:83:FF:42";
String image10 = "04:6F:FC:42";
String website2 = "04:57:FD:42";
String image12 = "04:6B:FF:42";
String website1 = "04:C9:FC:42";
boolean play = false;


/*STEP 3. Load each tag*/

void setup()
{
  size(1200,1000);
  String portname = Serial.list()[1];
  myPort = new Serial (this, portname, 9600);

  
  //Load soundfile (check each file’s name in your “data” file)
  file = new SoundFile(this, "Seastock.mp3");
  
  //Load video (check each file’s name in your “data” file)
  myMovie1 = new Movie (this, "yoonhee.mov");

  
  //Load image (check each file’s name in your “data” file)
  img1 = loadImage("airport.JPG");
  img1.resize(1200,800);
  img3 = loadImage("cohort.JPG");
  img3.resize(1200,800);
  img4 = loadImage("farewell.JPG");
  img4.resize(1200, 800);
  img6 = loadImage("firstcar.JPG");
  img6.resize(1200, 800);
  img7 = loadImage("sister.JPG");
  img7.resize(1000, 800);
  img8 = loadImage("Family.JPG");
  img8.resize(1200, 800);
  img10 = loadImage("jiyoon.JPG");
  img10.resize(1200, 800);
  img12 = loadImage("Traci.PNG");
  img12.resize(1000, 800);
  
}


/* STEP 4. Connect each memory into each RFID tag*/

void draw ()
{
 if (myPort.available() > 0) 
  {
   val = myPort.readStringUntil('\n'); 
   println(val);
   if(val != null ) {
     if(val.contains(music)) {
     println("Enjoy :-)");  //In the parenthesis, put whatever words you want to see in processing screen 
     play=false;   
     file.play();
   }
     if (val.contains(video1)) {
       println("Best friend and the first road trip"); 
     play=false;

       file.stop();
       play=!play;  

     }
     
   if (val.contains(image)) {
     println("the first day of my transition");
     play=false;
     image(img1, 0, 0);
   }
   if (val.contains(website4)) {
     println("Teaching Philosophy");
     play=false;
     link ("http://leeambrosia1205.wixsite.com/jlee"); //put any online link you want to connect
   }
   if (val.contains(image3)) {
     println("Cohorts");
     play=false;
     image (img3, 0, 0); 
   }
   if (val.contains(image4)) {
     println ("My Farewell party");
     play=false;
     image (img4, 0, 0);
   }
   if (val.contains(website5)) {
     println ("FacebookMe");
     play=false;
     link ("https://www.facebook.com/jeonghyun.lee.505"); 
   }
   if (val.contains(image6)) {
     println ("First car");
     play=false;
     image (img6, 0, 0);
   }
   if (val.contains(image7)) {
     println ("My sister");
     play=false;
     image (img7, 0, 0);
   }
   if (val.contains(image8)) {
     println ("family");
     play=false;
     image (img8, 0, 0);
   }
   if (val.contains(website3)) {
     println ("GoogleNCSUmail");
     play=false;
     link ("https://www.google.com/#q=jlee65@ncsu.edu&start=0&*"); 

   }
   if (val.contains(image10)) {
     println ("Friend_Jiyoon");
     play=false;
     image (img10, 0, 0);
   }
   if (val.contains(website2)) {
     println ("Cyworld");
     play=false;
     link ("http://cy.cyworld.com/home/39981355"); 
   }
   if (val.contains(image12)) {
     println ("Friend_Traci");
     play=false;
     image (img12, 0, 0);
   }
   if (val.contains(website1)) {
     println("NaverMe");
     play=false;
link("https://www.google.com/?client=safari&channel=mac_bm#channel=mac_bm&q=ambrosia125@naver.com&*");
   }
   
   }
   }
   if(play){
   myMovie1.play();
   image (myMovie1, 0, 0);
   }
   else {
     myMovie1.pause();    //When you contact other tag, the video will stop

   }
   
   
   println(play);
}
void movieEvent(Movie m) {
  m.read();
}

