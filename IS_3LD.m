clear all;
close all;

x = [0.1:1/22:1];
y = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;

figure(1);
plot (x,y,'r'); grid on

c1 = 0.19;
c2 = 0.91;
r1 = 0.171;
r2 = 0.172;
w0 = rand(1);
w1 = rand(1);
w2 = rand(1);
n = 0.05;

% SBF atsakai
for i = 1:10000
    for j = 1:length(x)
        ats_1 = exp(-((x(j) - c1)^2)/(2*r1^2));
        ats_2 = exp(-((x(j) - c2)^2)/(2*r2^2));
        
        % Tinklo atsakas
        v = ats_1*w1 + ats_2*w2 + w0;
        yy = v;
        
        e = y(j) - yy  ;
        
        % Svoriu atnaujinimas
        w1 = w1 + n*e*ats_1;
        w2 = w2 + n*e*ats_2;
        w0 = w0 + n*e;
    end
end

% Patikrinimas
hold on
for j = 1:length(x)
    ats_1 = exp(-((x(j) - c1)^2)/(2*(r1)^2));
    ats_2 = exp(-((x(j) - c2)^2)/(2*(r2)^2));
        
    % Tinklo atsakas
    v = ats_1*w1 + ats_2*w2 + w0;

    yy = v;
    plot (x(j), yy, 'b*');
end
