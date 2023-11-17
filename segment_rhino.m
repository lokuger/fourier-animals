clear
close all

%%
I = 255-rgb2gray(imread('./test_img/rhino.png'));
I = I>0;

g = im_grad(I);
f = squeeze(g(1,:,:).^2+g(2,:,:).^2>0);
imagesc(1-f), colormap('gray')

function g = im_grad(I)
sz = size(I);
g = zeros([2,sz]);
g(1,:,:) = [I(2:end,:)-I(1:end-1,:);zeros(1,sz(2))];
g(2,:,:) = [I(:,2:end)-I(:,1:end-1),zeros(sz(1),1)];
end