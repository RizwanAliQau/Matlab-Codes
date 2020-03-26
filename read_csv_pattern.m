file='dresspatterns.csv';
x=readtable(file);
filetodown=x(:,4);
labels=x(:,2);
cd 'C:\Rizwan\matlab 209\bin\download_data'
for i=15648:size(filetodown,1)
    filnam=char(table2array(labels(i,1)));
    formatSpec = ' %1$s %2$s';
    ind=string(i)
    Filename = sprintf(formatSpec,filnam,ind);
    Url=char(table2array(filetodown(i,1)));
    
    outfilename=websave(Filename,Url);
end
%cd 'C:\Rizwan\matlab 209\bin'