%---------------------------------------------------------------------%
%This code scatters the coefficients from parent face to children faces.
% u1,u2 - output vector of coefficients of children edges
%         the convention is that u1 corresponds to [-1,0] child
%         and u2 corresponds to [0,1] child
% u     - input vector of coefficients at the parent edge 
%
%Written by M.A. Kopera on 10/2011
%           Department of Applied Mathematics
%           Naval Postgraduate School 
%           Monterey, CA 93943-5216
%---------------------------------------------------------------------%

function [u,u1,u2]=scatter_gather_l2(uin,u1in,u2in,ngl,P1,P2)

    NP = ngl;
    
    xi = legendre_gauss_lobatto(NP); %get the gll points (possibly stored)
    xi1 = xi*0.5-0.5; % get children gll points
    xi2 = xi*0.5+0.5;   
    uina = zeros(1,ngl);
    for i=1:ngl
        uina(i) = uin(i);
    end
    L1 = lagrange_poly(xi1,xi); %compute projection matrices for children
    L2 = lagrange_poly(xi2,xi);

    u1 = mtimes(uina,L1); %project data onto children
    u2 = mtimes(uina,L2);
    
    %gather
    
    u = u1in*P1+u2in*P2;
    
%     for i=1:NP
%         if(xi(i)<=0.0) % segregate parent gll points corresponding to each child
%             xi1l(i) = xi(i); 
%             j=i;
%         else
%             xi2l(i-j) = xi(i);
%         end
%     end
% 
%     L1l = lagrange_poly(xi1l,xi1); %compute projection matrices (can store them somewhere, they will be the same for all gathers)
%     L2l = lagrange_poly(xi2l,xi2);
%     
%     for i=1:ngl
%        u1ina(i) = u1in(i);
%        u2ina(i) = u2in(i); 
%     end
%     
%     w1l = mtimes(u1ina,L1l); % project
%     w2l = mtimes(u2ina,L2l);
% 
%     for i=1:j
%         u(i) = w1l(i); %construct one output vector
%     end
%     for i=j+1:NP
%         u(i) = w2l(i-j);
%     end
    
end