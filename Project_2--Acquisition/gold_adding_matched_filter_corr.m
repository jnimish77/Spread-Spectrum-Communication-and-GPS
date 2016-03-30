% Program*
%
% Project_gold sequece.m
%********************** Spreading code initialization **********************
clc;
close all;
clear all;
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
% figure(1)
% plot(code_new);
% title('setting code phase to 556');
% whitebg('w')
% grid on;
 
% Now adding AWGN noise to the code %
code2=awgn(code_new,0);
% figure(2)
% plot(code2);
% title('code with AWGN noise');
% whitebg('c');
% grid on;
 
code5=new_code(1:4*4092); % multiplying code with 4092 for 4 sample per chip
% figure(3)
% plot(code5);
% title('Code5');
% whitebg('w');
% grid on;
 
 
% adding different frequencies and for loop below %
 
f=[-2000,-1500,-1000,-500,0,500,1000,1500,2000];
 
for m=1:9;
    code_dop(m,:)=exp(-2*pi*i*ts*f(m));
    
    code1(m,:)=(code2(1:16368).*code_dop(m,1:16368))*2-1;
    
        
    for count2 = 1:4092
        num1(m,:)=(code5.*code1(m,:));
        
        counter1=0;
        for count = 1:8184
            counter1=counter1+num1(m,count);
        end
        counter2=0;
        for count = 8185:16368
            counter2=counter2+num1(m,count);
        end
        
        counter(m,count2)=counter1*conj(counter1)+counter2*conj(counter2);
        code5=new_code(count2+1:count2+4*4092);
        
    end
    
end
 
% figure(4)
% plot(num1(m,:));
% title('code after multiplying with complex sinusoidal to wipe off dopler modulation');
% grid on;
% figure(5)
% plot(code5);
% title('regenerated code5');
% grid on;
 
figure;
  n = 1:4092;
 f =-2000:500:2000;
 
 [N,F]=meshgrid(n,f);
  surf(N,F,abs(counter))
  title('Parallel filter  Peak');
  
  
% 
% 
% 
% 
% for f=-2000:500:2000
%      dop=exp(2*pi*1i*ts*f);
%  for n=1:556
%     sampled_code(n)=new_code(n)*dop(n);
%     
% end
% end
% 
% new_code2=sampled_code(128:512);
%     new_code3=awgn(new_code2,10);
%     parallel_corr=abs(crosscorr(new_code(1:256),new_code2(1:256)));
% figure(1)
% %plot the 3D graph
% plot3(n,f,parallel_corr)
% 
% %matched filter
% ts=0:2.5e-7:5e-3;
% for f=-2000:500:2000
%      dop=exp(2*pi*1i*ts*f);
%  for n=1:556
%     sampled_code(n)=new_code(n)*dop(n);
%     
% end
% end
% new_code2=sampled_code(128:512);
%     new_code3=awgn(new_code2,10);
%     matched_corr=compconv2(new_code(1:256),new_code2(1:256),new_code2(1:256));
% figure(2)
% %plot the 3D graph
% plot3(n,f,matched_corr)
 
 
 
 
f=[-2000,-1500,-1000,-500,0,500,1000,1500,2000];
 
for m=1:9;
    code_dop(m,:)=exp(-2*pi*i*ts*f(m));
    
    code1(m,:)=(code2(1:16368).*code_dop(m,1:16368))*2-1;
    
        
   code5=fliplr(new_code(1:4092));
    
    num1=conv(code1(m,:),code5);
    sum1=num1(1:4092)+num1(4093:8184);
    change2=num1(8185:12276)+num1(12277:16368);
    count7(m,:)=abs((sum1.*conj(sum1))+(change2.*conj(change2)));
end
 
figure(7)
plot(code1(m,:));
figure(8)
plot(num1);
figure(9)
plot(sum1);
 
figure(10)
plot(change2);
figure(11)
plot(count7(m,:));
countfinal=fliplr(count7);
 
figure;
  n = 1:4092;
 f =-2000:500:2000;
 
 [N,F]=meshgrid(n,f);
  surf(N,F,abs(countfinal));

%********************end of the file****************************%