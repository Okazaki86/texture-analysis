%四个方向的平均值
function ave = ave_of_features(Fi)
fi = sum(Fi)/4;
sigmai = 0;
for i=1:4
    sigmai = sigmai+(Fi(i)-fi)^2;
end

sigmai = sigmai/3;
ave = [fi,sigmai];