%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
% setup_lungc
% cvsolve
% outchecklung
% %% TASK 3
% % 
% % PV = nRT 
% % PI=RT*cI!
% % cabar=Q' *ca/sum(Q)
% % cAbar=VA'*cA/sum(VA)
% % PAbar=RT*cAbar!
% % Pv=H(cv)!
% % Pabar=H(cabar)!
% i =0;
% for beta = 0:0.1:1
%     setup_lung
%     cvsolve
%     outchecklung
%     i = 1+i;
%     Beta_vec(i)= beta;
%     PI_vec(i) = PI;
%     PAbar_vec(i) = PAbar;
%     Pabar_vec(i) = Pabar;
%     Pv_vec(i) = Pv;
% end
% 
% figure;
% plot(Beta_vec,PI_vec,'c')
% hold on
% plot(Beta_vec,Pv_vec,'b')
% plot(Beta_vec,PAbar_vec,'r')
% plot(Beta_vec,Pabar_vec,'g')
% hold off
% legend('PI','Pv','PAbar','Pabar');
% xlabel('beta')
% ylabel('Pressures')
% title('effect of beta on PI,Pv,Pa,PA')

%%% Task 4
% clear all
% clf
% global Pstar cstar n maxcount M Q camax RT cI;
% beta = 0.7;%check the M at different manually changed beta value
% for M = 0.01:0.01:1
%     setup_lung
%     cvsolve
%     outchecklung
% end

%%% Task 4 plot
% beta = 0:0.1:1;
% M = [0.04
% 0.04
% 0.04
% 0.04
% 0.04
% 0.04
% 0.03
% 0.03
% 0.03
% 0.03
% 0.02]
% plot(beta,M,'-*');
% xlabel('beta')
% ylabel('M')

% %% Task 5
% cref=0.2/(22.4*(310/273));
% i =0;
% for cI = 0.005:0.0001:cref
%     setup_lung
%     cvsolve
%     outchecklung
%     i = 1+i;
%     cI_vec(i) = cI;
%     PAbar_vec(i) = PAbar;
%     Pabar_vec(i) = Pabar;
%     Pv_vec(i) = Pv;
%     cAbar_vec(i) = cAbar;
%     cabar_vec(i) = cabar;
%     cv_vec(i) = cv;
% end


% %% Task 5 graph
% figure;
% plot(cI_vec,PAbar_vec);
% hold on
% plot(cI_vec,Pabar_vec);
% plot(cI_vec,Pv_vec);
% hold off
% legend('PAbar' ,'Pabar', 'Pv' );
% xlabel('cI/O2 conc.(moles/liter）')
% ylabel('pressures(mmHg)')
% title('inspired oxyen conc. vs PAbar ,Pabar, Pv, ')
% 
% figure;
% plot(cI_vec,cAbar_vec);
% hold on
% plot(cI_vec,cabar_vec);
% plot(cI_vec,cv_vec);
% hold off
% legend('PAbar' ,'Pabar', 'Pv' );
% xlabel('cI/O2 conc.(moles/liter）')
% ylabel('conc.(mol/L)')
% title('inspired oxyen conc. vs cAbar, cabar, cv')
% legend('cAbar' ,'cabar', 'cv' );


%%Task 6&7
%blood oxygen 
oxygen_h = 22.4;
i =0;
for Altitude = 0:1:124
    i = i+1;
    cref = 0.2/((oxygen_h+ Altitude)*(310/273));
    setup_lung
    cvsolve
    outchecklung

    PAbar_vec(i) = PAbar;
    Pabar_vec(i) = Pabar;
    Pv_vec(i) = Pv;
    cAbar_vec(i) = cAbar;
    cabar_vec(i) = cabar;
    cv_vec(i) = cv;
    
    Altitude_vec(i) = Altitude;
end



%% Task 6 graph
figure;
plot(Altitude_vec,PAbar_vec);
hold on
plot(Altitude_vec,Pabar_vec);
plot(Altitude_vec,Pv_vec);
hold off
legend('PAbar' ,'Pabar', 'Pv' );
xlabel('Altitude(m）')
ylabel('pressures(mmHg)')
title('inspired oxyen conc. vs PAbar ,Pabar, Pv, ')

figure;
plot(Altitude_vec,cAbar_vec);
hold on
plot(Altitude_vec,cabar_vec);
plot(Altitude_vec,cv_vec);
hold off
legend('PAbar' ,'Pabar', 'Pv' );
xlabel('Altitude(m）')
ylabel('conc.(mol/L')
title('inspired oxyen conc. vs cAbar, cabar, cv')
legend('cAbar' ,'cabar', 'cv' );


