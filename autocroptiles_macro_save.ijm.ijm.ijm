processed_dir_name = "/Volumes/eth/VegtoSlice/2020/AreXX.01/Are01.01/Sliced/"
processed_file_suffix = "_Crop.tif"
id = getImageID(); 
title = getTitle(); 
n=8;
getLocationAndSize(locX, locY, sizeW, sizeH); 
width = getWidth(); 
height = getHeight(); 
tileWidth = width / n; 
tileHeight = height / n; 

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
//saveAs("jpeg", tileTitle);
//select cropped image and save
saveAs("Tiff", processed_dir_name+tileTitle+processed_file_suffix);
} 
} 
selectImage(id); 
close();
