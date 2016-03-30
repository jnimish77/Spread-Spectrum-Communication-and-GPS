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
 
figure(4)
plot(num1(m,:));
title('code after multiplying with complex sinusoidal to wipe off dopler modulation');
grid on;
figure(5)
plot(code5);
title('regenerated code5');
grid on;
