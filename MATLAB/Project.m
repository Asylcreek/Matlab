tHotIn = 400;
tHotOut = 170;
tColdIn = 110;
tColdOut = 190;
massFlowRateHot = 0.2;
massFlowRateCold = 0.5;
cpHot = 2.546;
cpCold = 1.444;
hIn = 50;
hOut = 60;
dIn = 22;
dOut = 23;
coldFluidViscosity = 0.5;
prandtlNumber = 0.02;
k = 44;
l = 100;
N = 2;


q_hot = massFlowRateHot * cpHot * (tHotIn - tHotOut);
q_cold = massFlowRateCold * cpCold * (tColdOut - tColdIn);

P = (tColdOut - tColdIn)/(tHotIn - tColdIn);
R = (tHotIn - tHotOut)/(tColdOut - tColdIn);

%to get coefficient X for the correction factor
aa = 1 - (((R*P) - 1)/(P-1))^(1/N); %numerator
bb = R - (((R*P) - 1)/(P-1))^(1/N); %denominator
X = aa/bb;

%to get the correction factor
a = ((sqrt((R*R) + 1)/(R-1)*reallog((1-X)/(1-R*X)))); %numerator
b = reallog(((2/X) - 1 - R + sqrt(R*R +1))/((2/X) - 1 - R - sqrt(R*R +1))); %denominator
F = a/b;

%the LMTD
LMTD = ((tHotOut - tColdIn) - (tHotIn - tColdOut))/reallog((tHotOut - tColdIn)/(tHotIn - tColdOut));
Corrected_LMTD = F * LMTD;

rateOfHeatTransfer = (1/hIn + reallog(dOut/dIn)/2*pi*k*l + 1/hOut);

%for tube side
reynoldsNumber = (4*massFlowRateCold)/(pi*dIn*coldFluidViscosity);
nusseltNumber = 0.023*(reynoldsNumber^(4/5))*(prandtlNumber^0.4);