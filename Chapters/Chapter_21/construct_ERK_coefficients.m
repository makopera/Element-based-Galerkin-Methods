function [alpha,beta,stages] = construct_ERK_coefficients(ti_method)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%IRK2
if (ti_method == 1)
    stages=2;
    alpha=zeros(stages,stages);
    beta=zeros(stages,1);
    alpha(2,1)=1;
    beta(:)=alpha(stages,:);
elseif (ti_method == 2)
    stages=3;
    alpha=zeros(stages,stages);
    beta=zeros(stages,1);
    alpha(2,1)=0.5857864376269049511983112757903019214303281246230519;
    alpha(3,1)=0.02859547920896831706610375859676730714344270820768398;
    alpha(3,2)=0.9714045207910316829338962414032326928565572917923160;
    beta(1)=0.3535533905932737622004221810524245196424179688442370;
    beta(2)=0.3535533905932737622004221810524245196424179688442370;
    beta(3)=0.2928932188134524755991556378951509607151640623115260;
elseif (ti_method == 3)
    stages=4;
    alpha=zeros(stages,stages);
    beta=zeros(stages,1);
    alpha(2,1)=1767732205903/2027836641118;
    alpha(3,1)=5535828885825/10492691773637;
    alpha(3,2)=788022342437/10882634858940;
    alpha(4,1)=6485989280629/16251701735622;
    alpha(4,2)=-4246266847089/9704473918619;
    alpha(4,3)=10755448449292/10357097424841;
    beta(1)=1471266399579/7840856788654;
    beta(2)=-4482444167858/7529755066697;
    beta(3)=11266239266428/11593286722821;
    beta(4)=1767732205903/4055673282236;

elseif (ti_method == 4)
    stages=6;
    alpha=zeros(stages,stages);
    beta=zeros(stages,1);
    alpha(2,1)=1.0/2.0;
    alpha(3,1)=13861/62500;
    alpha(3,2)=6889/62500;
    alpha(4,1)=-116923316275/2393684061468;
    alpha(4,2)=-2731218467317/15368042101831;
    alpha(4,3)=9408046702089/11113171139209;
    alpha(5,1)=-451086348788/2902428689909;
    alpha(5,2)=-2682348792572/7519795681897;
    alpha(5,3)=12662868775082/11960479115383;
    alpha(5,4)=3355817975965/11060851509271;
    alpha(6,1)=647845179188/3216320057751;
    alpha(6,2)=73281519250/8382639484533;
    alpha(6,3)=552539513391/3454668386233;
    alpha(6,4)=3354512671639/8306763924573;
    alpha(6,5)=4040/17871;
    beta(1)=82889/524892;
    beta(2)=0;
    beta(3)=15625/83664;
    beta(4)=69875/102672;
    beta(5)=-2260/8211;
    beta(6)=1/4;
elseif (ti_method == 5)
    stages=8;
    alpha=zeros(stages,stages);
    beta=zeros(stages,1);
    alpha(2,1)=41/100;
    alpha(3,1)=367902744464/2072280473677;
    alpha(3,2)=677623207551/8224143866563;
    alpha(4,1)=1268023523408/10340822734521;
    alpha(4,2)=0;
    alpha(4,3)=1029933939417/13636558850479;
    alpha(5,1)=14463281900351/6315353703477;
    alpha(5,2)=0;
    alpha(5,3)=66114435211212/5879490589093;
    alpha(5,4)=-54053170152839/4284798021562;
    alpha(6,1)=14090043504691/34967701212078;
    alpha(6,2)=0;
    alpha(6,3)=15191511035443/11219624916014;
    alpha(6,4)=-18461159152457/12425892160975;
    alpha(6,5)=-281667163811/9011619295870;
    alpha(7,1)=19230459214898/13134317526959;
    alpha(7,2)=0;
    alpha(7,3)=21275331358303/2942455364971;
    alpha(7,4)=-38145345988419/4862620318723;
    alpha(7,5)=-1/8;
    alpha(7,6)=-1/8;
    alpha(8,1)=-19977161125411/11928030595625;
    alpha(8,2)=0;
    alpha(8,3)=-40795976796054/6384907823539;
    alpha(8,4)=177454434618887/12078138498510;
    alpha(8,5)=782672205425/8267701900261;
    alpha(8,6)=-69563011059811/9646580694205;
    alpha(8,7)=7356628210526/4942186776405;
    beta(1)=-872700587467/9133579230613;
    beta(2)=0;
    beta(3)=0;
    beta(4)=22348218063261/9555858737531;
    beta(5)=-1143369518992/8141816002931;
    beta(6)=-39379526789629/19018526304540;
    beta(7)=32727382324388/42900044865799;
    beta(8)=41/200;
elseif (ti_method == 6)
    stages=10;
    alpha=zeros(stages,stages);
    beta=zeros(stages,1);  
    alpha(2,1)=0.2928932188134525;
    alpha(3,1)=0.3602847895715037;
    alpha(3,2)=0.02099677689026724;
    alpha(4,1)=0.4267095308101442;
    alpha(4,3)=0.04296038329994516;
    alpha(5,1)=0.4901881062634202;
    alpha(5,4)=0.06787015549498755;
    alpha(6,1)=0.548902422602367;
    alpha(6,5)=0.09754418680435926;
    alpha(7,1)=0.6003576019251088;
    alpha(7,6)=0.1344773551299359;
    alpha(8,1)=0.6404229388942057;
    alpha(8,7)=0.1828003658091574;
    alpha(9,1)=0.6612274743186617;
    alpha(9,8)=0.2503841780330199;    
    alpha(10,1)=0.3942428457889902;
    alpha(10,9)=0.6057571542110098;
    beta(2)=0.7071067811865476;
    beta(10)=0.2928932188134525;
end

end
