% Inclass11
%Sanjana Srinivasan

% You can find a multilayered .tif file with some data on stem cells here:
% https://www.dropbox.com/s/83vjkkj3np4ehu3/011917-wntDose-esi017-RI_f0016.tif?dl=0

% 1. Find out (without reading  the entire file) -  (a) the size of the image in
% x and y, (b) the number of z-slices, (c) the number of time points, and (d) the number of
% channels.
image1=('011917-wntDose-esi017-RI_f0016.tif');
reader=bfGetReader(image1);
[reader.getSizeX, reader.getSizeY];
reader.getSizeZ;
image_time=reader.getSizeT;
image_chan=reader.getSizeC;

% 2. Write code which reads in all the channels from the 30th time point
% and displays them as a multicolor image.
time = 30;
iplane=reader.getIndex(0,0,29)+1;
img=bfGetPlane(reader, iplane);
imshow(img, [500 5000])


iplane=reader.getIndex(0,1,29)+1;
img2=bfGetPlane(reader, iplane);
imshow(img2, [500 5000])

img2show=cat(3, imadjust(img), imadjust(img2), zeros(size(img)));
imshow(img2show);

% 3. Use the images from part (2). In one of the channels, the membrane is
% prominently marked. Determine the best threshold and make a binary
% mask which marks the membranes and displays this mask. 

img_bw=img > 900;
imshow(img_bw);


% 4. Run and display both an erosion and a dilation on your mask from part
% (3) with a structuring element which is a disk of radius 3. Explain the
% results.
imshow(imerode(img_bw,strel('disk',3)));
imshow(imdilate(img_bw,strel('disk',3)));

%when the image is run through erosion with a disk radius of 3, most of the
%white portions of the membrane are no longer visible as any pixel within
%three spaces of the white pixel, including other white pixels, are eroded
%to black pixels. Thus, white pixels that are not generally surrounded by
%many other white pixels are no longer marked. 

%when the image is run through dilation with a disk radius of 3, the white
%portions of the membrane are much more pronounced as every white pixel on
%the image is then surrounded by white pixels in a disk shape within three
%spaces of it. 
