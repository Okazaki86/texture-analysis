function F = features(com)
dim = size(com,1);
energy = 0;
entropy = 0;
inertiaquadrature = 0;
localcalm = 0;
for i = 1:dim
    for j = 1:dim
        %能量
        energy = energy + com(i,j)*com(i,j);
        %熵
        if com(i,j)>1e-12
            entropy = entropy - com(i,j)*log(com(i,j));
        end
        %对比度
        inertiaquadrature = inertiaquadrature + (i-j)*(i-j)*com(i,j);
        %逆差矩
        localcalm = localcalm + com(i,j)/(1+(i-j)*(i-j));
    end
end

ux = 0;
uy = 0;
for i = 1:dim
    ux = ux+i*sum(com(i,1:dim));
    uy = uy+i*sum(com(1:dim,i));
end

sigmax = 0;
sigmay = 0;
for i = 1:dim
    sigmax = sigmax + (i-ux)*(i-ux)*sum(com(i,1:dim));
    sigmay = sigmay + (i-uy)*(i-uy)*sum(com(1:dim,i));
end

%相关
correlation = 0;
for i=1:dim
    for j=1:dim
        correlation = correlation + (i-ux)*(i-uy)*com(i,j);
    end
end
correlation = correlation/(sigmax*sigmay);

F=[energy,entropy,inertiaquadrature,localcalm,correlation];
