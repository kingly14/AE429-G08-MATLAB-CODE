clear
clc

U = 34.75;

max = 0;
maxAlt = 0;
for alt = 0:1:6580
    [t, a, Pinf, p] = atmosisa(alt);
    P = @(theta,Pinf_,p_,U_) Pinf_ + .5*p_*(U_.^2-4*U_.^2*sin(theta).^2);
    tp = integral(@(theta)P(theta, Pinf, p, U), 0, 2*pi);
    if tp > max
        max = tp;
        maxAlt = alt;
    end
end

disp(maxAlt)




