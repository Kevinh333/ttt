% 定义波长和有效模式折射率数据
lambda = [4300:5:4700]*1e-9; % 波长数据，单位是米（m）
neff = [1.1069 1.1033 1.0997 1.0961 1.0925 1.0889 1.0853 1.0817 1.0781 1.0744 1.0708 ...
1.0671 1.0634 1.0597 1.056 1.0523 1.0486 1.0449 1.0412 1.0374 1.0336 1.2465 1.2438 ...
1.2411 1.2385 1.2358 1.2331 1.2304 1.2277 1.225 1.2222 1.2195 1.2168 1.214 1.2113 ...
1.2086 1.2058 1.2031 1.2003 1.1975 1.1947 1.1919 1.1891 1.1863 1.1835 1.1807 0.99254 ...
0.98872 0.98489 0.98105 0.97719 0.97332 0.96943 0.96553 1.155 1.1521 1.1491 1.1462 ...
1.1433 1.1404 1.1374 1.1345 1.1315 1.1286 1.1256 1.1226 1.1196 1.1167 1.1137 1.1106 ...
1.1076 1.1046 1.1016 1.0985 1.0955 1.0924 1.0893 1.0862 1.0831 1.0801 1.077]; % 有效模式折射率数据

c = 299792458; % 光速，单位是 m/s

% 计算角频率
omega = 2 * pi * c ./ lambda;

% 计算波数 beta
beta = neff .* omega / c;

% 计算中心角频率和波长
lambda0 = 4670e-9; %mean(lambda); % 中心波长
omega0 = 2 * pi * c / lambda0;

% 一阶导数
beta1 = diff(beta) ./ diff(omega);
beta1_at_omega0 = interp1(omega(1:end-1), beta1, omega0, 'linear');
dispersion_coefficients_1 = beta1_at_omega0;% * (lambda0^1) / omega0^1;

% 二阶导数
beta2 = diff(beta1) ./ diff(omega(1:end-1));
beta2_at_omega0 = interp1(omega(1:end-2), beta2, omega0, 'linear');
dispersion_coefficients_2 = beta2_at_omega0;% * (lambda0^2) / omega0^2;

% 三阶导数
beta3 = diff(beta2) ./ diff(omega(1:end-2));
beta3_at_omega0 = interp1(omega(1:end-3), beta3, omega0, 'linear');
dispersion_coefficients_3 = beta3_at_omega0;% * (lambda0^3) / omega0^3;

% 四阶导数
beta4 = diff(beta3) ./ diff(omega(1:end-3));
beta4_at_omega0 = interp1(omega(1:end-4), beta4, omega0, 'linear');
dispersion_coefficients_4 = beta4_at_omega0;% * (lambda0^4) / omega0^4;

% 五阶导数
beta5 = diff(beta4) ./ diff(omega(1:end-4));
beta5_at_omega0 = interp1(omega(1:end-5), beta5, omega0, 'linear');
dispersion_coefficients_5 = beta5_at_omega0;% * (lambda0^5) / omega0^5;

% 六阶导数
beta6 = diff(beta5) ./ diff(omega(1:end-5));
beta6_at_omega0 = interp1(omega(1:end-6), beta6, omega0, 'linear');
dispersion_coefficients_6 = beta6_at_omega0;% * (lambda0^6) / omega0^6;

% 七阶导数
beta7 = diff(beta6) ./ diff(omega(1:end-6));
beta7_at_omega0 = interp1(omega(1:end-7), beta7, omega0, 'linear');
dispersion_coefficients_7 = beta7_at_omega0;% * (lambda0^7) / omega0^7;

% 八阶导数
beta8 = diff(beta7) ./ diff(omega(1:end-7));
beta8_at_omega0 = interp1(omega(1:end-8), beta8, omega0, 'linear');
dispersion_coefficients_8 = beta8_at_omega0;% * (lambda0^8) / omega0^8;

% 九阶导数
beta9 = diff(beta8) ./ diff(omega(1:end-8));
beta9_at_omega0 = interp1(omega(1:end-9), beta9, omega0, 'linear');
dispersion_coefficients_9 = beta9_at_omega0;% * (lambda0^9) / omega0^9;

% 十阶导数
beta10 = diff(beta9) ./ diff(omega(1:end-9));
beta10_at_omega0 = interp1(omega(1:end-10), beta10, omega0, 'linear');
dispersion_coefficients_10 = beta10_at_omega0;% * (lambda0^10) / omega0^10;

% 输出结果
fprintf('一阶色散系数 beta1: %e s/m at lambda0 = %e m\n', dispersion_coefficients_1, lambda0);
fprintf('二阶色散系数 beta2: %e s^2/m at lambda0 = %e m\n', dispersion_coefficients_2, lambda0);
fprintf('三阶色散系数 beta3: %e s^3/m at lambda0 = %e m\n', dispersion_coefficients_3, lambda0);
fprintf('四阶色散系数 beta4: %e s^4/m at lambda0 = %e m\n', dispersion_coefficients_4, lambda0);
fprintf('五阶色散系数 beta5: %e s^5/m at lambda0 = %e m\n', dispersion_coefficients_5, lambda0);
fprintf('六阶色散系数 beta6: %e s^6/m at lambda0 = %e m\n', dispersion_coefficients_6, lambda0);
fprintf('七阶色散系数 beta7: %e s^7/m at lambda0 = %e m\n', dispersion_coefficients_7, lambda0);
fprintf('八阶色散系数 beta8: %e s^8/m at lambda0 = %e m\n', dispersion_coefficients_8, lambda0);
fprintf('九阶色散系数 beta9: %e s^9/m at lambda0 = %e m\n', dispersion_coefficients_9, lambda0);
fprintf('十阶色散系数 beta10: %e s^10/m at lambda0 = %e m\n', dispersion_coefficients_10, lambda0);