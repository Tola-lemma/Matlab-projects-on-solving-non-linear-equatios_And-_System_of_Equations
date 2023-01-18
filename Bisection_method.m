clc
%f = @(x) cos(x)+2*sin(x)+x^2;
f = input('Enter your function ');
disp('By try and Error the root are found between [-1,0] and [-2,-1]  Enter the value accordingly');
a = input('Enter the first Initial point '); %first initial pt
b = input('Enter the second initial point '); % second initial pt

%%start of program
while f(a) * f(b) > 0
    disp('Wrong choice of a and b ,no root please try again'); %Recheck points 'a' and 'b'
    a = input('Enter the first Initial point : '); %first initial  point
    b = input('Enter the second initial point') ; % second initial point
end
epsilon = 10^(-4); % maximum Tolerance Error
intermax = 10; % maximum number of iteration performed
c = (a + b) / 2; %compute the new point by mid point
err = inf;%compute the initial error
iter = 1 ; % set the intial iteration Counter
Variables={'Iter', 'a', 'b', 'c', 'f(c)', 'Error'};
HG = [iter a b c f(c) err];
while (iter < intermax && err >= epsilon)
    if f(a) * f(c) < 0 % check itermidiate mean value Propety
        b = c; %Update b
    else
        a = c ; % Update a
    end
    if f(a)*f(c)==0
        break
    end
    Cold=c;
    c = (a+b)/2; %compute new root by Mid point
    cnew =c;
    err = abs((cnew-Cold)/cnew); % Compute Error or f(x) at new root
    HG = [HG; iter+1 a b c f(c) err] ; %for printing purpose
    iter =iter +1 ; %update the iteration Counter
end
clc
% printing
disp('      ==================================================================')
disp('                    Output Table with Iteration Wise               ')

Result = array2table(HG); %convert  Array to Table for Displaying
Result.Properties.VariableNames(1:size(HG,2))=Variables
disp('      ==================================================================')

fprintf('       Converged solution after %d iteration \n',iter);
fprintf('        The Root is %.4f\n',c);
disp('      ==================================================================')