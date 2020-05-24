function fea=texture_analy(IMG,nl,step)
IMG = press_gray(histeq(IMG),nl);
F = [];

M =glcm(IMG,nl,step);
for k = 1:4
    F = [F;features(M(1:nl,1:nl,k))];
end
fea = zeros(5,2);
for r = 1:5
    ave = ave_of_features(F(1:4,r));
    fea(r,1:2)=ave;
end
    
