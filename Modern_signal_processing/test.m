% ȡƵ��Ϊ1
%%%%%%%%%%%%%���䷨%%%%%%%%%%%%%%%%%%
figure(1)
I1 = imread('Cameraman.bmp','bmp');   
N1 = 256;       % �źų��ȣ�ȡԭͼ��С���������С256
psd1 = abs(fftshift(fft2(I1))/N1).^2;  % ���ö�ά����Ҷ�任��ȡͼ�����ݹ���������
psd1 = 10 * log10(psd1); 
f = (0: length(psd1)-1) * 1 / length(psd1);   % ����Ƶ��
subplot(2, 1, 1)
mesh(f, f, psd1)
xlabel('����Ƶ��/Hz')   %���ú����� 
ylabel('����Ƶ��/Hz')    %���ú�������
zlabel('����/dB')    %���ú�������
title("ԭ���ݹ�����");
subplot(2, 1, 2)
plot(f, psd1(N1/2, :))
xlabel('Ƶ��/Hz')   %���ú����� 
ylabel('����/dB')    %���ú�������
title("�����׽���ͼ");

%%%%%%%%%%%%��������Ϊԭ����һ��%%%%%%%%%%%%%%%
figure(2)
N2 = N1/8;
I4=I1(1:8:end,1:8:end);     % �źų��ȱ�Ϊԭ����1/8
psd2 = abs(fftshift(fft2(I4))/N2).^2;
psd2 = 10 * log10(psd2); 
mesh(psd2)
f = (0: length(psd2)-1) * 1 / length(psd2);   % ����Ƶ��
subplot(2, 1, 1)
mesh(f, f, psd2)
xlabel('����Ƶ��/Hz')   %���ú����� 
ylabel('����Ƶ��/Hz')    %���ú�������
zlabel('����/dB')    %���ú�������
title("�������ȱ�Ϊԭ��1/8");
subplot(2, 1, 2)
plot(f, psd2(N2/2, :))
xlabel('Ƶ��/Hz')   %���ú����� 
ylabel('����/dB')    %���ú�������
title("�����׽���ͼ");


% ƽ��������ͼ����ݷֳ��ĵȷ֣����ص�
I2 = double(imcrop(I1,[1,1,127,127]));      
I3 = double(imcrop(I1,[1,129,127,127]));
I4 = double(imcrop(I1,[129,1,127,127]));
I5 = double(imcrop(I1,[129,129,127,127]));

N3 = N1/2;
Nsec = N3;

%%%%%%%%%%%%ƽ����%%%%%%%%%%%%%%%%%%%%%
figure(6)
w = window2(128, 128, @hamming);        % ��ά������

psd3_2 = (abs(fft2(w.*I2, Nsec, Nsec)).^2) ./ (norm(w).^2);  % ����ÿ�εĹ�����
psd3_2 = 10 * log10(psd3_2);            % ת��Ϊ�ֱ�
psd3_3 = (abs(fft2(w.*I3, Nsec, Nsec)).^2) ./ (norm(w).^2);  
psd3_3 = 10 * log10(psd3_3); 
psd3_4 = (abs(fft2(w.*I4, Nsec, Nsec)).^2) ./ (norm(w).^2);  
psd3_4 = 10 * log10(psd3_4); 
psd3_5 = (abs(fft2(w.*I5, Nsec, Nsec)).^2) ./ (norm(w).^2);  
psd3_5 = 10 * log10(psd3_5); 
% fftshift �ƶ���Ƶ�㵽Ƶ���м䣬�Ա��Ƶ�׽��й۲�
psd3 = fftshift((psd3_2 + psd3_3 + psd3_4 + psd3_5) / 4);  % ƽ���� ��Ϊ�Ķ�, 
f = (0: length(psd3)-1) * 1 / length(psd3);   % ����Ƶ��
mesh(f, f, psd3)
subplot(2, 1, 1)
mesh(f, f, psd3)
xlabel('����Ƶ��/Hz')   %���ú����� 
ylabel('����Ƶ��/Hz')    %���ú�������
zlabel('����/dB')    %���ú�������
title("ƽ��������������");
subplot(2, 1, 2)
plot(f, psd3(N3/2, :))
xlabel('Ƶ��/Hz')   %���ú����� 
ylabel('����/dB')    %���ú�������
axis([0 1 0 100])
title("ƽ�������������������׽���ͼ");

%%%%%%%%%%%%ƽ����%%%%%%%%%%%%%%%%%%%%%
figure(7)
psd4_2 = (abs(fft2(I2, Nsec, Nsec)).^2)./ Nsec;  % ��ͼ����и���Ҷ�任��������������ܶ�
psd4_2 = 10 * log10(psd4_2);            % ת��Ϊ�ֱ�
psd4_3 = (abs(fft2(I3, Nsec, Nsec)).^2)./ Nsec;  
psd4_3 = 10 * log10(psd4_3); 
psd4_4 = (abs(fft2(I4, Nsec, Nsec)).^2)./ Nsec;  
psd4_4 = 10 * log10(psd4_4); 
psd4_5 = (abs(fft2(I5, Nsec, Nsec)).^2)./ Nsec;  
psd4_5 = 10 * log10(psd4_5); 
% fftshift �ƶ���Ƶ�㵽Ƶ���м䣬�Ա��Ƶ�׽��й۲�
psd4 = fftshift((psd4_2 + psd4_3 + psd4_4 + psd4_5) / 4);  % ƽ���� ��Ϊ�Ķ�
f = (0: length(psd4)-1) * 1 / length(psd4);   % ����Ƶ��
subplot(2, 1, 1)
mesh(f, f, psd4)
xlabel('����Ƶ��/Hz')   %���ú����� 
ylabel('����Ƶ��/Hz')    %���ú�������
zlabel('����/dB')    %���ú�������
title("ƽ����");
subplot(2, 1, 2)
plot(f, psd4(N3/2, :))
xlabel('Ƶ��/Hz')   %���ú����� 
ylabel('����/dB')    %���ú�������
axis([0 1 0 100])
title("ƽ���������׽���ͼ");

%%%%%%%%%%%%welch��%%%%%%%%%%%%%%%%%%%%%
figure(8)
% K = ((256 - 128/2)/128/2)^2;
I6 = double(imcrop(I1,[65,1,127,127]));
I7 = double(imcrop(I1,[129,65,127,127]));
I8 = double(imcrop(I1,[65,129,127,127]));
I9 = double(imcrop(I1,[1,65,127,127]));
I10 = double(imcrop(I1,[65,65,127,127]));

psd5_2 = (abs(fft2(w.*I2, Nsec, Nsec)).^2) / (norm(w).^2);  % ��ͼ����и���Ҷ�任��������������ܶ�
psd5_2 = 10 * log10(psd5_2);            % ת��Ϊ�ֱ�
psd5_3 = (abs(fft2(w.*I3, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_3 = 10 * log10(psd5_3); 
psd5_4 = (abs(fft2(w.*I4, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_4 = 10 * log10(psd5_4); 
psd5_5 = (abs(fft2(w.*I5, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_5 = 10 * log10(psd5_5); 

psd5_6 = (abs(fft2(w.*I6, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_6 = 10 * log10(psd5_6);            % ת��Ϊ�ֱ�
psd5_7 = (abs(fft2(w.*I7, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_7 = 10 * log10(psd5_7);            % ת��Ϊ�ֱ�
psd5_8 = (abs(fft2(w.*I8, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_8 = 10 * log10(psd5_8);            % ת��Ϊ�ֱ�
psd5_9 = (abs(fft2(w.*I9, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_9 = 10 * log10(psd5_9);            % ת��Ϊ�ֱ�
psd5_10 = (abs(fft2(w.*I10, Nsec, Nsec)).^2) / (norm(w).^2);  
psd5_10 = 10 * log10(psd5_10);            % ת��Ϊ�ֱ�

psd5 = fftshift((psd5_2 + psd5_3 + psd5_4 +... 
                        psd5_5 + psd5_6 + psd5_7 +... 
                        psd5_8 + psd5_9 + psd5_10) / 9);
f = (0: length(psd5)-1) * 1 / length(psd5);   % ����Ƶ��
mesh(f, f, psd5)
subplot(2, 1, 1)
mesh(f, f, psd5)
xlabel('����Ƶ��/Hz')   %���ú����� 
ylabel('����Ƶ��/Hz')    %���ú�������
zlabel('����/dB')    %���ú�������
title("Welch��");
subplot(2, 1, 2)
plot(f, psd5(N3/2, :))
xlabel('Ƶ��/Hz')   %���ú����� 
ylabel('����/dB')    %���ú�������
axis([0 1 0 100])
title("Welch�������׽���ͼ");

%%%%%%%%%%%%ƽ���� �۵�һ��%%%%%%%%%%%%%%%%%%%%%
figure(9)

psd6_2 = (abs(fft2(I2, Nsec, Nsec)).^2)./ Nsec;  % ��ͼ����и���Ҷ�任��������������ܶ�
psd6_2 = 10 * log10(psd6_2);            % ת��Ϊ�ֱ�
psd6_3 = (abs(fft2(I3, Nsec, Nsec)).^2)./ Nsec;  
psd6_3 = 10 * log10(psd6_3); 
psd6_4 = (abs(fft2(I4, Nsec, Nsec)).^2)./ Nsec;  
psd6_4 = 10 * log10(psd6_4); 
psd6_5 = (abs(fft2(I5, Nsec, Nsec)).^2)./ Nsec;  
psd6_5 = 10 * log10(psd6_5); 

psd6_6 = (abs(fft2(I6, Nsec, Nsec)).^2)./ Nsec;  % ��ͼ����и���Ҷ�任��������������ܶ�
psd6_6 = 10 * log10(psd6_6);            % ת��Ϊ�ֱ�
psd6_7 = (abs(fft2(I7, Nsec, Nsec)).^2)./ Nsec;  
psd6_7 = 10 * log10(psd6_7); 
psd6_8 = (abs(fft2(I8, 128, 128)).^2)./ Nsec;  
psd6_8 = 10 * log10(psd6_8); 
psd6_9 = (abs(fft2(I9, 128, 128)).^2)./ Nsec;  
psd6_9 = 10 * log10(psd6_9); 
psd6_10 = (abs(fft2(I10, Nsec, Nsec)).^2)./ Nsec;  
psd6_10 = 10 * log10(psd6_10); 

psd6 = fftshift((psd6_2 + psd6_5 + psd6_8 +... 
                        psd6_3 + psd6_6 + psd6_9 +... 
                        psd6_4 + psd6_7 + psd6_10) / 9);
f = (0: length(psd6)-1) * 1 / length(psd6);   % ����Ƶ��
mesh(f, f, psd6)
subplot(2, 1, 1)
mesh(f, f, psd6)
xlabel('����Ƶ��/Hz')   %���ú����� 
ylabel('����Ƶ��/Hz')    %���ú�������
zlabel('����/dB')    %���ú�������
title("ƽ�������۵�һ�룩");
subplot(2, 1, 2)
plot(f, psd6(N3/2, :))
xlabel('Ƶ��/Hz')   %���ú����� 
ylabel('����/dB')    %���ú�������
axis([0 1 0 100])
title("ƽ�������۵�һ�룩�����׽���ͼ");
