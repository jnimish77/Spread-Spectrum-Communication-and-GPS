%******************** Generation of the spreading code *********************
 
switch seq
case 1                                             % M-sequence
    code = mseq(stage,ptap1,regi1,user);
  % auto = code
    
case 2                                                              % Gold sequence
    m1   = mseq(stage,ptap1,regi1);
    m2   = mseq(stage,ptap2,regi2);
    code = goldseq(m1,m2,user);
 auto = code;
% code2=goldseq(m1,m2,user);
    
    
case 3                                                              % Orthogonal Gold sequence
    m1   = mseq(stage,ptap1,regi1);
    m2   = mseq(stage,ptap2,regi2);
    code = [goldseq(m1,m2,user),zeros(user,1)];
end
code = code * 2 - 1;
clen = length(code);
.
.
.
.
.
subplot(2, 1, 1)
    plot(auto)
    subplot (2, 1, 2)
    plot(autocorr([auto]))
    
   % subplot(3, 1, 1)
   % plot(auto)
   % subplot (3, 1, 2)
   % plot(code2)
    %(3,1,1)
    
    %plot(crosscorr(auto, code2)
-------------------------------------End------------------------------------
