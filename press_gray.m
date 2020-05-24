%Ñ¹Ëõ»Ò¶È¼¶ÖÁt
function pressed_gray_img = press_gray(img,t)
[m,n]=size(img);
w = 256/t;
pressed_gray_img=zeros(m,n);
for i=1:m
    for j=1:n
        pressed_gray_img(i,j)=floor(img(i,j)/w)-1;
    end
end
pressed_gray_img=uint8(pressed_gray_img);

