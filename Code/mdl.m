%% function Move down and left
function [Flagupdown, nNodeupdown] = mdl(cNode)
     x = cNode(1);
     y = cNode(2);
if x == 0 || y == 0
    Flagupdown = false;
    nNodeupdown = [];
else
    X1 = x-1;
    Y1 = y-1;
    Flagupdown = true;
    nNodeupdown = [X1, Y1];
end