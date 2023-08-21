% Exercise 7
% Zhang Yannan
% Mansfield College
% Mini Project: Early Bird gets the Worm

% Window Initialisation
clear; close all; clc

% Define x coordinates of the bird's beak which is the leftmost point of 

% Define chessboard length
  global length 
% Define chesboard width
  global width


  length = 100; 
  width = 100;
% Use coordinates to draw a bird

figure

% Adjust the grid such that it is squared with integer side length

bird =[0 8 10 10 22 23 26 24 30 28 27 25 22 20 19 20 17 14 16 19 18 16 15 16 12 10 12 14 14 13 12 9 7 5 5 4 0;
       26 26 24 20 14 13 11 11 6 7 8 8 9 9 8 6 0 0 1 5 7 8 8 5 1 1 2 4 5 8 9 10 12 16 22 24 26];
xbeak = bird (1,1);
ybeak = bird (2,1);
sign = -1;
%Plot Arrows
axis square 
axis equal

axis([0.6,length+0.6,0.6,width+0.6]) % a little bit of extra room
% Adjust the scale of the axes
set(gca,'XTick',(0:1:length));
set(gca,'YTick',(0:1:width));

% Hide the coordinates
set(gca,'XColor','none','YColor','none')
graph = drawshape1(bird,'k');
% Mouse controlling

[x,y,button] = ginput(1); %find coordinates of pointer
xtranslate = x - xbeak;
ytranslate = y - ybeak;
condition = xtranslate/abs(xtranslate); %translate to left: condition = -1, translate to right: condition = 1

while (button == 1) % While left mouse button is used
    bird = translateShape1(bird,x,y);
      if condition == -sign
           sign = -sign;
           bird = reflecty1(sign,bird);
           drawshape1(bird,'k')
      else
          drawshape1(bird,'k')
      end
       % Move shape to pointer
      
       % draw shape
      [x,y,button] = ginput(1); % (x,y) is the coordinate that has been clicked
disp(condition)
disp(sign)
end

 