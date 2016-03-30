% Project_golad sequece.m
%********************** Spreading code initialization **********************
IPOINT = 5;
n=1023;
user  = 1;                                         % number of users
stage = 10;                                      % number of stages
ptap1 = [3 10];                              % position of taps for 1st
ptap2 = [2 3 6 8 9 10];                         % position of taps for 2nd
regi1 = [1 1 1 1 1 1 1 1 1 1];            % initial value of register for 1st
regi2 = [1 1 1 1 1 1 1 1 1 1];      % initial value of register for 2nd
 
%******************** Generation of the spreading code *********************
 
 
    m1   = mseq(stage,ptap1,regi1);
    m2   = mseq(stage,ptap2,regi2);
    code = goldseq(m1,m2,user);
       code= code*2-1;  
       y=interp(code,4);
  out=oversamp(code);
  figure
  plot(out)
  
  Z=exp(2*pi*1i*n*f*ts);
  figure
  plot(z);
  comp = y*z;
  figure
  plot(comp);
  
  
    
figure
plot(y)
figure
plot(autocorr(y));
vals = unique(autocorr(y));
plot(vals);
disp('the autocorrelation values are: ');
disp(vals);
