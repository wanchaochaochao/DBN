%% 主程序
%% 导入mnist数据
N_sample = 1000;p = 784;
x = zeros(N_sample , p);
tic
for i = 1 : N_sample
    im = imread(['F:\MATLAB\mnist手写数字\trainimage\pic2\0\' num2str(i) '.bmp']);
    x(i , :) = double(reshape(im(: , : , 1) , 1 , p) > 10);
end
toc
%% 调用RBM
model = DBN([p 300 100 50]);%创建对象
model = model.train(x , 3000);%训练
model2=model.predict(100);%重构
%% 绘制重构图像
Im = zeros(280 , 280);
for i = 1 : size(model.rbmList(1).testData_x , 1)
    i0 = floor((i-1)/10);j0 = mod(i-1,10);
    Im(i0*28+1:(i0+1)*28,j0*28+1:(j0+1)*28) = reshape(model.rbmList(1).testData_x(i , :) , 28 , 28);
end
imshow([Im(1:140,:) Im(141:280,:)]);

% Im = zeros(280 , 280);
% for i = 1 : size(rbm.w , 2)
%     i0 = floor((i-1)/10);j0 = mod(i-1,10);
%     Im(i0*28+1:(i0+1)*28,j0*28+1:(j0+1)*28) = reshape(rbm.w(: , i) , 28 , 28);
% end
% imshow(Im(1:140,:));