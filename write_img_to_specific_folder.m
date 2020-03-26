miFolder='D:\yyyy\final_code\cifar10\whole_images\class0';
% if ~isdir(miFolder)
% errorMensaje = sprintf('Error: El folder no existe:\n%s', miFolder);
% uiwait(warndlg(errorMensaje));
% return;
% end
filePatron = fullfile(miFolder, '*.jpg');
jpegFil = dir(filePatron);
Resultados='C:\Program Files\MATLAB\R2013a\bin\training\class0\class0';
% mkdir(Resultados);
i=1;
for k = 1:200
    indx(i)=randi(280,1);
baseFN = jpegFil(indx(i)).name;
fullFN = fullfile(miFolder, baseFN);
I=imread(fullFN);
I2=I;
imwrite(I2,[Resultados,num2str(k),'.jpg']);
i=i+1;
end