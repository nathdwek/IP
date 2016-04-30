function mb = zerocros(x);

[szx, szy] = size(x);

szx1 = szx - 1;

szy1 = szy - 1;

mb=zeros(szx, szy);

for ii=2:szx1

  for jj=2:szy1



	if (x(ii, jj)*x(ii, jj-1) < 0)

               

	    if (x(ii, jj) < 0)

		mb(ii, jj) = 1;

	    else

		mb(ii, jj-1) = 1;

            end;

        end

        if  (x(ii, jj)*x(ii, jj+1) < 0)

            

	     if (x(ii, jj) < 0)

		mb(ii, jj) = 1;

	    else

		mb(ii, jj+1) = 1;

            end; 

        end     

	if  (x(ii-1, jj)*x(ii, jj) < 0)

        

	     if (x(ii, jj) < 0)

		mb(ii, jj) = 1;

	    else

		mb(ii-1, jj) = 1;

            end;

        end

        if (x(ii+1, jj)*x(ii, jj) < 0)

        

	    if (x(ii, jj) < 0)

		mb(ii, jj) = 1;

	    else

		mb(ii+1, jj) = 1;

            end ;

	end   

     end

end  

