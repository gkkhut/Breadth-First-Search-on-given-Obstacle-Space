clear all
close all

%% Defining the whole plot from the given coordinates
rectangle ('Position', [55 67.5 50 45],'FaceColor','blue') %55, 67.5 is the initial point and 50&45  is width and length 
hold on
%Ploting Circle
circle = [165 105 30 30];
rectangle('Position',circle,'Curvature',[1 1],'FaceColor','blue')
axis equal

% P = [145 14; 168 14; 188 51; 165 89; 158 51; 120 55];
% polyin = polyshape(P,'Simplify',true)
% plot(polyin)

%Ploting Polygon
pgon = polyshape([145 14; 168 14; 188 51; 165 89; 158 51; 120 55]);
plot(pgon,'FaceColor','blue','FaceAlpha',1)
axis([0 250 0 150])

%% User Input
Flag = false;
disp('')
while ~Flag
xstart = 'Enter X for Start Point (0-250:)'; %define start point (x-axis)
xs = input(xstart);
ystart = 'Enter Y for Start Point (0-150:)'; %define start point (y-axis)
ys = input(ystart);

xgoal = 'Enter X for Goal Point (0-250:)'; %define goal point (x-axis)
xg = input(xgoal);
ygoal = 'Enter Y for Start Point (0-150:)'; %define goal point (y-axis)
yg = input(ygoal);

sNode = [xs,ys]; %Start Node
gNode = [xg,yg]; %Goal Node

instart = constraints(xs,ys);
ingoal = constraints(xg,yg); 
%% Check whether input lies in the constraints space
if instart
Flag = false;%status check
disp('Start point is in the object'); %error display
elseif ingoal
Flag = false;
disp('Goal point is in the object'); %error display
elseif (xs<0 || xs>250) || (ys<0 || ys>150)
Flag = false;
disp('Start point is not in the map') %error display
elseif  (xg<0 || xg>250) || (yg<0 || yg>=250)
Flag = false;
disp('Goal point is not in the map') %error display 
else
Flag = true; %status check
end
end

if Flag
Nodes = []; %Nodes
nInfo = []; %Nodes Info

Nodes(:,:,1) = sNode; %Initial Node
nInfo(:,:,1) = [1,0]; %1st node information

i = 2;
j = 1;

%% Generating Nodes using Breadth first search

while true
cNode = Nodes(:,:,j); %current node
[Flagleft, nNodeleft] = ml(cNode); %initiate move left function
if Flagleft == true
if (any(all(bsxfun(@eq,Nodes,nNodeleft)))) == false
c = nNodeleft(1);
d = nNodeleft(2);
in = constraints(c,d);
if in == false 
Nodes(:,:,i) = nNodeleft;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodeleft(1) == gNode(1) && nNodeleft(2) == gNode(2)
break
end
end
end
end

[Flagright, nNoderight] = mr(cNode); %initiate move right function
if Flagright == true
if (any(all(bsxfun(@eq,Nodes,nNoderight)))) == false
c = nNoderight(1);
d = nNoderight(2);
in = constraints(c,d);
if in == false
Nodes(:,:,i) = nNoderight;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNoderight(1) == gNode(1) && nNoderight(2) == gNode(2)
break
end
end
end
end

[Flagup, nNodeup] = mu(cNode); %initiate move up function
if Flagup == true
if (any(all(bsxfun(@eq,Nodes,nNodeup)))) == false
c = nNodeup(1);
d = nNodeup(2);
in = constraints(c,d);
if in == false
Nodes(:,:,i) = nNodeup;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodeup(1) == gNode(1) && nNodeup(2) == gNode(2)
break
end
end
end
end

[Flagdown, nNodedown] = md(cNode); %initiate move down function
if Flagdown == true
if (any(all(bsxfun(@eq,Nodes,nNodedown)))) == false
c = nNodedown(1);
d = nNodedown(2);
in = constraints(c,d);
if in == false
Nodes(:,:,i) = nNodedown;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodedown(1) == gNode(1) && nNodedown(2) == gNode(2)
break
end
end
end
end
        
[Flagdownleft, nNodedownleft] = mdl(cNode); %initiate move down and left function
if Flagdownleft == true
if (any(all(bsxfun(@eq,Nodes,nNodedownleft)))) == false
c = nNodedownleft(1);
d = nNodedownleft(2);
in = constraints(c,d);
if in == false 
Nodes(:,:,i) = nNodedownleft;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodedownleft(1) == gNode(1) && nNodedownleft(2) == gNode(2)
break
end
end
end
end
        
[Flagdownright, nNodedownright] = mdr(cNode); %initiate move down and right function
if Flagdownright == true
if (any(all(bsxfun(@eq,Nodes,nNodedownright)))) == false
c = nNodedownright(1);
d = nNodedownright(2);
in = constraints(c,d);
if in == false 
Nodes(:,:,i) = nNodedownright;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodedownright(1) == gNode(1) && nNodedownright(2) == gNode(2)
break
end
end
end
end
        
[Flagupleft, nNodeupleft] = mul(cNode); %initiate move up and left function
if Flagupleft == true
if (any(all(bsxfun(@eq,Nodes,nNodeupleft)))) == false
c = nNodeupleft(1);
d = nNodeupleft(2);
in = constraints(c,d);
if in == false 
Nodes(:,:,i) = nNodeupleft;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodeupleft(1) == gNode(1) && nNodeupleft(2) == gNode(2)
break
end
end
end
end
        
[Flagupright, nNodeupright] = mur(cNode); %initiate move up and right function
if Flagupright == true
if (any(all(bsxfun(@eq,Nodes,nNodeupright)))) == false
c = nNodeupright(1);
d = nNodeupright(2);
in = constraints(c,d);
if in == false 
Nodes(:,:,i) = nNodeupright;
nInfo(:,:,i) = [i,j];
i = i+1;
plot(c,d,'.','color','black') %Plot nodes on the image
if nNodeupright(1) == gNode(1) && nNodeupright(2) == gNode(2)
break
end
end
end
end
j = j+1
end

k = i-1;
count = 0;
    
txt1 = '\o Start Node'; %Caption - Start node
txt2 = '\o Goal Node'; %Caption - Goal Node
%Plot the start and end point
plot(sNode(1),sNode(2),'s','color','red','markers',10)
plot(gNode(1),gNode(2),'s','color','red','markers',10)
    
text(sNode(1),sNode(2),txt1)
text(gNode(1),gNode(2),txt2)

%Plotting the path
while k ~= 1 
nInfo(:,:,k);
u = Nodes(1,1,k);
v = Nodes(1,2,k); 
info = nInfo((2*k));
k = info;
count = count+1;
plot(u,v,'.','color','green') %Plot the Path
end
end
