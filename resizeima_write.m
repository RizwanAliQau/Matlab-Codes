srcFiles = dir('C:\Rizwan\matlab 209\bin\1st_manual\*.gif');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('C:\Rizwan\matlab 209\bin\1st_manual\',srcFiles(i).name);
im = imread(filename);
k=imresize(im,[256 256]);
newfilename=strcat('C:\Rizwan\matlab 209\bin\images_label\',srcFiles(i).name);
imwrite(k,newfilename,'gif');
end