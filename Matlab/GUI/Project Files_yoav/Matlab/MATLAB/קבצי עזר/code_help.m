file = fopen( 'frame.txt' ,'wt');
fprintf(file,'%s\n',b);


%fprintf(file,'%s\n',dec2bin(4*(row+col),8));

S = struct('A', [1 2], 'B',[3 4 5]); 
SNames = fieldnames(S);  
for loopIndex = 1:numel(SNames)      
    stuff = S.(SNames{loopIndex});
end 

c = cell(2, 3);
for i = 1:2
    for j = 1:3
     c{i,j} = b;
    end
end 

a=[0 1 2; 3 4 5;6 7 8];
b=dec2bin(a',8);
file = fopen( 'frame.txt' ,'wt');
fprintf(file,'%s\n',b(1,:));
fclose(file);