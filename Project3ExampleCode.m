%Define Example problem
f1 = 15*2*pi;
f2 = 12*2*pi;
alpha1 =-0.2;
t = 0:0.001:3;
sigma = 0.3;
y=exp(alpha1*t).*sin(f1*t)+sin(f2*t)+sigma*randn(size(t));
ori = y;
figure(),plot(t,y);
hold on

A =@(params) sum((y - (params(1)*exp(alpha1*t).*sin(params(3)*t) + params(2)*sin(params(4)*t))).^2);

% Initial guess for the parameters [A1, A2, f1, f2]
init_guess = [rand(1), rand(1), (90+rand(1)), (75+rand(1))];

% Find the parameters that minimize the error function
options = optimset('Display','iter');
opt_params = fminsearch(A, init_guess,options);

% Display the estimated parameters
fprintf('Estimated parameters: A1 = %.2f, A2 = %.2f\n', opt_params);
params = opt_params;
y = (params(1)*exp(alpha1*t).*sin(params(3)*t) + params(2)*sin(params(4)*t));
estimate = y;

plot(t,y,'LineWidth',1.5,'LineStyle','-');
ori_params = [1 1 f1 f2];
hold off


%plot diagnostic plot of curve
figure(); plot(ori,estimate,'.');
hold on
plot(-2.5:2.5,-2.5:2.5,'LineWidth',2,'Color','r')
















