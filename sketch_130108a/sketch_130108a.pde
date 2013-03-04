//hello just
size(800,600);

stroke(40,20,220);
line(100,50,100,500);
line(100,500,700,500);

fill(170,10,140);
rect(100,150,50,350);
rect(200,80,50,420);in
rect(300,350,50,150);
rect(400,150,50,350);
rect(500,470,50,30);

PFont myFont;
myFont = loadFont("SansSerif-18.vlw");
fill(0);
textFont(myFont, 18);
text("y axis: hello world",50,40);
textFont(myFont, 18);
text("x axis: bye world",300,530);

