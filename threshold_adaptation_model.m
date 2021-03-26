function dydt = threshold_adapation_model(t, y, J_l,I_ext)
%RingModel - Differential equations of a ring network with N coupled units.
%
%   dRdt = RingModel(t, R, W, N, I_ext) returns the time differential of variables of R.
%
%   Example:
%
%   N = 500;                    % Number of neurons in the ring network, N.
%   theta_i  = linspace(2*pi/N, 2*pi, N)';
%   theta_ij = theta_i - theta_i';
%
%   W = 10.*(cos(theta_ij) - 1);
%
%   I1      = @(t) 1;               % Input intensity
%   theta_0 = @(t) pi/3;            % External angle input
%   I_ext   = @(t) I1(t).*cos(theta_i - theta_0(t)); % Input for each neuron.
%
%   tspan = [1 200];
%   R0 = zeros(N, 1);   % Initial activity of each neuron.
%   [t, R] = ode45(@(t, R) RingModel(t, R, W, N, I_ext), tspan, R0);


% constants
tau_m = 30; % membrane time const (ms)
tau_a = 2; % threshold adaptation time const; time scale with which threshold recovers in abscence of firing
T = 20000; % time length of simulations
c = 0.5; % control strehgth of activity-dependent adaptation

%print(length(y))
%X = y(1:2500); 
%h = y(2501:5000);
%disp(t)

%I = feval(I_ext, t);
%I = ones(2500,1);

% I0 = ones(2500,1);
% I_noise = noise(); %mu and sigma equals 1
% %I = @(t) I0 + I_noise;
% %I = @(t) I0 + I_noise;
% I = I0 + I_noise;

idx = randi(20);
I = I_ext(idx);
dxdt = (-y(1:2500) + threshold_linear(J_l*y(1:2500) + I - y(2501:5000)))/tau_m;

% J has 0 on the diagonal

dhdt = (-y(2501:5000) + c*y(1:2500))/tau_a;

dydt = [dxdt;dhdt]; % 1d vector


end