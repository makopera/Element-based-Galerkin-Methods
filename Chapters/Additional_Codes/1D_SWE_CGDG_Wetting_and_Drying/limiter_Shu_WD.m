%-------------------------------------------------------
%This code applies a positivity limiter initially proposed
%by Xing, Zhang, and Shu in ?Positivity preserving high 
%order well balanced discontinuous Galerkin methods for 
%the shallow water equations? (2010)
%
%Written by Haley Lane (NREIP) 6/2013-8/2013
%           Department of Applied Mathemcatics
%           Naval Postgraduate School
%           Monterey, CA 93943-5216
%-------------------------------------------------------
function [qpmod] = limiter_Shu_WD(qp, nelem, psi,ngl,nq,wnq,qb)
qpmod = zeros(2,ngl,nelem);
test = zeros(5,1,nelem);
epsil=1e-15;
%epsil=0;

for ie=1:nelem
    Uq = zeros(2,nq); %U for quad points
    Ub = zeros(2,1);  %average U
    Ux = zeros(2,ngl); %U(x)
    TVB= 0;
    
    %Calculate water height
    qpmod(1,:,ie) = qp(1,:,ie)+qb(:,ie)';
    qpmod(2,:,ie) = qp(2,:,ie);
    
    %--------------evaluate mj--------------------------
    Uq = qpmod(:,:,ie)*psi;
    m  = min(Uq(1,:));
    %--------------evaluate mj--------------------------
    
    %Calculate Integral for Ub
    for i=1:nq
        Ub(1) = Ub(1) +Uq(1,i)*wnq(i);
        Ub(2) = Ub(2) +Uq(2,i)*wnq(i);
    end
    Ub=Ub/2;
    
    %Calculate Theta
    theta = min(1, Ub(1)/(abs(Ub(1)-m)+epsil));

    %Totally dry element
    %if (Ub(1) < 0) 
    %      qpmod(:,:,ie) = 0;
    %Partially wet element
   % else
        for i=1:ngl
            qpmod(:,i,ie) = (theta*(qpmod(:,i,ie)-Ub))+Ub;
            if (m == 0 & m == Ub(1))
           %if (qpmod(1,i,ie) == 0)
                qpmod(:,i,ie)= 0;
            end
        end
   % end

    %Convert back to mean height
    qpmod(1,:,ie) = qpmod(1,:,ie)-qb(:,ie)'; 

end

end

