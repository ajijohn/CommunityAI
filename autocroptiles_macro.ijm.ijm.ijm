id = getImageID(); 
title = getTitle(); 
n=8;
getLocationAndSize(locX, locY, sizeW, sizeH); 
width = getWidth(); 
height = getHeight(); 
tileWidth = width / n; 
tileHeight = height / n; 
i=0;
for (y = 0; y < n; y++) { 
offsetY = y * height / n; 
 for (x = 0; x < n; x++) { 
offsetX = x * width / n; 
selectImage(id); 
 call("ij.gui.ImageWindow.setNextLocation", locX + offsetX, locY + offsetY); 
tileTitle = title + " [" + x + "," + y + "]"; 
 run("Duplicate...", "title=" + tileTitle); 
makeRectangle(offsetX, offsetY, tileWidth, tileHeight); 
 run("Crop"); 
 rename("title="+i);
} 
} 
selectImage(id); 
close();