%---------------------------------------------------------------------%
%This function computes the LGL grid and elements.
%Written by F.X. Giraldo on 5/2008
%           Department of Applied Mathematics
%           Naval Postgraduate School 
%           Monterey, CA 93943-5216
%---------------------------------------------------------------------%
function flux = roe_flux(q_l,q_r,diss)

flux=zeros(2,1);

%Left States
U_l=q_l(1);

%Right States
U_r=q_r(1);

%Compute Wave Speeds 
clam=abs(U_l + U_r);

%Momentum Flux
f_l=0.5*U_l^2;
f_r=0.5*U_r^2;
flux(1)=0.5*( f_l + f_r - diss*clam*(U_r - U_l) ); 

