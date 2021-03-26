function I_noise = noise()

I_noise = zeros(2500,1);
for i = 1:2500
    I_noise(i) = normrnd(1,1);
end