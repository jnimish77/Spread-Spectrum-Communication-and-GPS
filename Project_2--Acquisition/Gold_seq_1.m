% Program*
%
% Project_gold sequece.m
%********************** Spreading code initialization **********************
IPOINT = 5;
n=1023;
user  = 1;                                                       % number of users
stage = 10;                                                     % number of stages
ptap1 = [3 10];                                        % position of taps for 1st
ptap2 = [2 3 6 8 9 10];                                % position of taps for 2nd
regi1 = [1 1 1 1 1 1 1 1 1 1];                 % initial value of register for 1st
regi2 = [1 1 1 1 1 1 1 1 1 1];         % initial value of register for 2nd
 
%******************** Generation of the gold code *********************
 
 
    m1   = mseq(stage,ptap1,regi1);
    m2   = mseq(stage,ptap2,regi2);
    code = goldseq(m1,m2,user);
       code= code*2-1;  
%********************end of gold sequence generation********************
 
%Perform hard decision coding
new_code=code;
new_code =repmat(new_code,4,1); % Oversample signal(4sample per chip)
 
% Now input through the impulse response
new_code = [new_code,new_code,new_code,new_code,new_code];
new_code=new_code*2-1;
 
%Pass the signal through correlator and doppler effect
 
ts=0:2.5e-7:5e-3;
 
 
ts=0:2.44e-7:5e-3;
f=1000;                  % frequency=1KHZ %
 
dop=exp(2*pi*i*ts*f);   %Doppler Sinusoidal
for n=1:length(new_code)
    sampled_code(n)=new_code(n).*dop(n);
end
 
code_new=[sampled_code(556:556+4092-1)];   %setting code phase to 556 %
code_new=[code_new code_new code_new code_new code_new];
figure(1)
plot(code_new);
title('setting code phase to 556');
whitebg('w')
grid on;
 
% Now adding AWGN noise to the code %
code2=awgn(code_new,-40);
figure(2)
plot(code2);
title('code with AWGN noise');
whitebg('c');
grid on;
 
code5=new_code(1:4*4092); % multiplying code with 4092 for 4 sample per chip
figure(3)
plot(code5);
whitebg('w');
grid on;

