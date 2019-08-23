%% solve a system of 4 coupled, non-linear equations wrt to time
% time in milliseconds
%%
function fP = HH(t,P)

C = 1;
GK = 36;
GNa = 120;
GL = 0.3;
EK = -72;
ENa = 55;
EL = -49.4;

fP = zeros(4,1);

fP(1) = -1/C*(GK*P(4).^4.*(P(1)-EK)+GNa*P(3).^3.*P(2).*(P(1)-ENa)+GL.*(P(1)-EL));
fP(2) = (1-P(2)).*alphah(P(1))-P(2).*betah(P(1));
fP(3) = (1-P(3)).*alpham(P(1))-P(3).*betam(P(1));
fP(4) = (1-P(4)).*alphan(P(1))-P(4).*betan(P(1));
end