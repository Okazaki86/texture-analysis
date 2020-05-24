%计算4个灰度共生矩阵并归一化
function M = glcm(IMG,nl,step)
[M1,SI]=graycomatrix(IMG,'GrayLimits',[0,nl-1],'NumLevels',nl,'Offset',[0,step],'Symmetric',true);
[M2,SI]=graycomatrix(IMG,'GrayLimits',[0,nl-1],'NumLevels',nl,'Offset',[-1*step,step],'Symmetric',true);
[M3,SI]=graycomatrix(IMG,'GrayLimits',[0,nl-1],'NumLevels',nl,'Offset',[-1*step,0],'Symmetric',true);
[M4,SI]=graycomatrix(IMG,'GrayLimits',[0,nl-1],'NumLevels',nl,'Offset',[-1*step,-1*step],'Symmetric',true);
M = zeros(nl,nl,4);
M(1:nl,1:nl,1)=M1;
M(1:nl,1:nl,2)=M2;
M(1:nl,1:nl,3)=M3;
M(1:nl,1:nl,4)=M4;
for i=1:4
    t = sum(sum(M(1:nl,1:nl,i)));
    M(1:nl,1:nl,i) = M(1:nl,1:nl,i)/t;
end