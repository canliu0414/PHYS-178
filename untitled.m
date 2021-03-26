for i=1:20
    test = reshape(y(5,1:2500),50,50); 
    imagesc(test)
    pause
end

%%
t=[1,100,200,300,500];

%% plot change in h
figure(2)
subplot(1,5,1);
test = reshape(y(t(1),2501:5000),50,50); 
imagesc(test)
title(strcat('t = ', string(t(1)),' ms'))

subplot(1,5,2);
test = reshape(y(t(2),2501:5000),50,50); imagesc(test)
title(strcat('t = ', string(t(2)),' ms'))

subplot(1,5,3);
test = reshape(y(t(3),2501:5000),50,50); imagesc(test)
title(strcat('t = ', string(t(3)),' ms'))

subplot(1,5,4);
test = reshape(y(t(4),2501:5000),50,50); imagesc(test)
title(strcat('t = ', string(t(4)),' ms'))

subplot(1,5,5);
test = reshape(y(t(5),2501:5000),50,50); imagesc(test)
title(strcat('t = ', string(t(5)),' ms'))
%%
rate = zeros(50,50);

for i=1:50
    for j =1:50
        
        rate(i,j) = (randi(2000)-1)/10000;
    end
end
%% plot x over time
figure(1)
subplot(1,5,1);
test = reshape(y(t(1),1:2500),50,50); imagesc(test)
title(strcat('t =  ', string(t(1)),' ms'))

subplot(1,5,2);
test = reshape(y(t(2),1:2500),50,50); imagesc(test)
title(strcat('t =  ', string(t(2)),' ms'))

subplot(1,5,3);
test = reshape(y(t(3),1:2500),50,50); imagesc(test)
title(strcat('t =  ', string(t(3)),' ms'))

subplot(1,5,4);
test = reshape(y(t(4),1:2500),50,50); imagesc(test)
title(strcat('t =  ', string(t(4)),' ms'))

subplot(1,5,5);
test = reshape(y(t(5),1:2500),50,50); imagesc(test)
title(strcat('t =  ', string(t(5)),' ms'))

%%

%testing magnitude of h
%testing version of I
I=[];
for i=1:2500
    I(i) = 1+normrnd(1,1);
end
I=I';

test = J_l*X0 + I;