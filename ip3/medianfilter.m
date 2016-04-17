function result=medianfilter(image)
sz=size(image);
width=sz(1,2);
height=sz(1,1);
block=zeros(1,9);
blockcounter=1;
%add border
bordered=zeros(height+2,width+2);
bordered(2:height+1,2:width+1)=image(1:height,1:width);
target=zeros(height,width);
for i=2:width+1
   for j=2:height+1
      %copy relevant pixels to block
      blockcounter=1;
      for x=i-1:i+1
         for y=j-1:j+1
            block(1,blockcounter)=bordered(y,x);
            blockcounter=blockcounter+1;
         end
      end
      %calculate median
      target(j-1,i-1)=median(block);
   end
end
result=target;
