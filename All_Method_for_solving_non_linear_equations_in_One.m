
clc
clear all
close all

syms x

disp('=========================================================================');
disp('==                                                                     ==');
disp('==   WELCOME TO SOLVE NON-LINEAR EQUATIONS USING MATLAB                ==');
disp('==                                                                     ==');
disp('=========================================================================');


% INPUT SECTION

f = input("Enter your function: ");
e = input("Enter the tolerance: ");
n = input("Enter the no of iteration: ");

df = inline(diff(f(x)),'x');

disp('====================================================================================')

%BISECTION METHOD

disp('=========================================================================');
disp('==                                                                     ==');
disp('==   WELCOME TO SOLVE NON-LINEAR EQUATIONS USING BISECTION METHOD      ==');
disp('==                                                                     ==');
disp('=========================================================================');



a = input('Enter the first Initial point '); %first initial pt
b = input('Enter the second initial point '); % second initial pt

%%start of program

stop=false;

while(~stop)
   while f(a) * f(b) > 0
       disp('Wrong choice of a and b ,no root please try again'); %Recheck points 'a' and 'b'
       a = input('Enter the first Initial point : '); %first initial  point
       b = input('Enter the second initial point') ; % second initial point
   end
 
   c = (a + b) / 2; %compute the new point by mid point
   err = inf;%compute the initial error
iter = 1 ; % set the intial iteration Counter
Variables={'Iter', 'a', 'b', 'c', 'f(c)', 'Error'};
HG = [iter a b c f(c) err];
while (iter < n && err >= e)
    if f(a) * f(c) < 0 % check itermidiate mean value Propety
        b = c; %Update b
    else
        a = c ; % Update a
    end
    c_old=c;
    c = (a+b)/2; %compute new root by Mid point
    c_new =c;
    err = abs((c_new-c_old)/c_new); % Compute Error or f(x) at new root
    HG = [HG; iter+1 a b c f(c) err] ; %for printing purpose
    iter =iter +1 ; %update the iteration Counter
end

% printing
disp('      ==================================================================')
disp('                    Output Table with Iteration Wise               ')

Result = array2table(HG); %convert  Array to Table for Displaying
Result.Properties.VariableNames(1:size(HG,2))=Variables
disp('      ==================================================================')

fprintf('       Converged solution after %d iteration \n',iter);
fprintf('        The Root is %.4f\n',c);
disp('      ==================================================================')


disp('======================================================================================')

 stop = input('Enter your choice 0 to continue other number to stop');
  if stop == 0
     a = input('Enter the first Initial point : '); %first initial  point
     b = input('Enter the second initial point') ; % second initial point
  else
     stop = true;
  end

end


%FALSE POSITION METHOD


disp('=========================================================================');
disp('==                                                                     ==');
disp('==   WELCOME TO SOLVE NON-LINEAR EQUATIONS BY FALSE-POSITION METHOD    ==');
disp('==                                                                     ==');
disp('=========================================================================');


% start of program

stop=false;
while(~stop)
    m=1;
    while m>0
        a = input('Enter lower bound: ');
        b = input('Enter upper bound: ');
        m=f(a)*f(b);
        c=(a*f(b)-b*f(a))/(f(b)-f(a));
        if m>1
           disp('your guess is incorrect guess more');
        end
     end
      fprintf('\n\n\t\ta\t\t\tb\t\t\tc\t\t\tf(c)\n');
      y=1;
      while y<=n
         fprintf('\t\t%f\t\t%f\t\t%f\t\t%f\n\n\n',a,b,c,f(c));
         y=y+1;
         d=c;
         if f(a)*f(c)<0
            b=c;
         else
            a=c;        
         end
         c=(a*f(b)-b*f(a))/(f(b)-f(a));
         if  abs(c-d)<e
            break;           
         end
       end

       fprintf("\n The root is %.4f \n",c);


       stop = input('Enter your choice 0 to continue other number to stop');
  if stop == 0
     continue;
  else
     stop = true;
  end
end
  disp('==============================================================================================')

  
%ITERATION METHOD


disp('=========================================================================');
disp('==                                                                     ==');
disp('==   WELCOME TO SOLVE NON-LINEAR EQUATIONS BY ITERATION METHOD         ==');
disp('==                                                                     ==');
disp('=========================================================================');


% start of program

x0=input("\n Enter the intial guess");
gn=@(x) x-(f(x)/df(x));
stop=false;
while (~stop)
    
    fprintf("\n##################################################");
    fprintf("\n## Iter \t x0 \t      x1      \t |x0-x1|##");
for i=1 : n
    x1=gn(x0);
    err=abs(x0-x1);
    if err<e
        fprintf("\n## The approximation solution is:   %.4f     ##" ,x1);
        fprintf("\n##################################################");
        break;
    else
        fprintf("\n## %d \t  %.8f \t %.8f \t %.4f ##",i,x0,x1,err);

    end
    x0=x1;
end

 stop = input('Enter your choice 0 to continue other number to stop');
  if stop == 0
     x0=input("\n Enter the intial guess");
  else
     stop = true;
  end

end



disp('==============================================================================================')

%NEWTON RAPHSON METHOD




disp('=========================================================================');
disp('==                                                                     ==');
disp('==   WELCOME TO SOLVE NON-LINEAR EQUATIONS BY NEWTON-RAPHSON METHOD    ==');
disp('==                                                                     ==');
disp('=========================================================================');


% start of program

x0 = input("Enter the initial guess: ");

  stop = false;
while(~stop)
    fprintf('\n n \t Xn \t\t f(x0) \t\t f`(x0) \t Xn+1 \t\t |Xn+1-Xn|\n\n');
    if df(x0) ~= 0
    for i=1:n
        x1 = x0 - f(x0)/df(x0);
        fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f \t %.6f\n\n',i-1,x0,f(x0),df(x0),x1,abs(x1-x0));
        if abs(x1-x0)<e
            break;
        end
        
        
        if df(x1)==0
            disp('Newton Raphson Method failed!');
        end  
        x0 = x1;

         
    end
    else
       disp('Newton Raphson failed!');
    end



  fprintf("\n The root is %.4f \n",x0);

  stop = input('Enter your choice 0 to continue other number to stop');
  if stop == 0
     x0 = input("Enter the initial guess: ");
  else
     stop = true;
  end
end


fprintf('\n \n \t THANKS !!! ');



disp('==============================================================================================')




%SECANT METHOD


disp('=========================================================================');
disp('==                                                                     ==');
disp('==   WELCOME TO SOLVE NON-LINEAR EQUATIONS BY SECANT METHOD            ==');
disp('==                                                                     ==');
disp('=========================================================================');


% start of program
xo = input('Enter the first Initial point '); %first initial pt
x1 = input('Enter the second initial point '); % second initial pt

stop=false;
while(~stop)

  while f(xo) * f(x1) > 0
    disp('Wrong choice of a and b ,no root please try again'); %Recheck points 'a' and 'b'
    xo = input('Enter the first Initial guess : '); %initail first point
    x1 = input('Enter the second initial guess') ; % second initial point
  end 



  disp('no itr         xo             x1           solution        errors')
  disp('----------------------------------------------------------------')
  figure('color','white')

  Variables={'i', 'x0', 'x1', 'f(x1)'};
  HG = [i xo x1 f(x1)];
  for i=1:n
    x2 = (xo*f(x1) - x1*f(xo))/(f(x1) - f(xo));
    errors=round(abs((x2-x1)/x1),4);
 
    if  abs(errors)< e
        break
    end 
     HG = [HG; i xo x1  f(x1)];
    fprintf('%3i %15.4f %15.4f %15.4f %15.4f\n', i,xo,x1,x2,errors);
    
    
    xo = x1; 
    x1 = x2;
    
 end
Result = array2table(HG); %convert  Array to Table for Displaying
Result.Properties.VariableNames(1:size(HG,2))=Variables
disp('      ==================================================================')
fprintf('       Converged solution after %d iteration \n',n);
fprintf('        The Root is %2.5f\n',x1);
disp('      ==================================================================');


stop = input('Enter your choice 0 to continue other number to stop');
  if stop == 0
     xo = input('Enter the first Initial point '); %first initial pt
     x1 = input('Enter the second initial point '); % second initial pt
  else
     stop = true;
  end

end

disp('==============================================================================================')


% plotting


x= -2:0.25:2;
y= cos(x)+2*sin(x)+x.^2;

plot(x,y);
grid on;
xlabel("x");
ylabel("y=f(x)=cos(x)+2*sin(x)+x^2");

disp('==============================================================================================')






