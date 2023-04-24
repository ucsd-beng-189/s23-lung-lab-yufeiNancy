%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
setup_lung
cvsolve
outchecklung
%% TASK 3
% 
% PV = nRT 
% PI=RT*cI!
% cabar=Q' *ca/sum(Q)
% cAbar=VA'*cA/sum(VA)
% PAbar=RT*cAbar!
% Pv=H(cv)!
% Pabar=H(cabar)!
i =0;
for beta = 0:0.1:1
    setup_lung
    cvsolve
    outchecklung
    i = 1+i;
    Beta_vec(i)= beta;
    PI_vec(i) = PI;
    PAbar_vec(i) = PAbar;
    Pabar_vec(i) = Pabar;
    Pv_vec(i) = Pv;
end

figure;
plot(Beta_vec,PI_vec,'c')
hold on
plot(Beta_vec,Pv_vec,'b')
plot(Beta_vec,PAbar_vec,'r')
plot(Beta_vec,Pabar_vec,'g')
hold off
legend('PI','Pv','PAbar','Pabar');
xlabel('beta')
ylabel('Pressures')
title('effect of beta on PI,Pv,Pa,PA')

%% Task 4

%for M = 0.01:



