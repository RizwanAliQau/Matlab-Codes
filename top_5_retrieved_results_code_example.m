close all;
clear;

% Initialize
% addpath(genpath(pwd));
% fprintf('SSDH startup\n');

% -----------------------------------------------------------
% 48-bits binary codes extraction
%
% input
%   	img_list.txt:  list of images files 
% output
%   	binary_codes: 48 x num_images output binary vector
%   	list_im: the corresponding image path
%
% ----- settings start here -----
% set 1 to use gpu, and 0 to use cpu
% use_gpu = 1;
% % binary code length
% feat_len = 48;
% % models
% model_file = '/home/naeem/Caffe-DeepBinaryCode/examples/SSDH/jun12_1fineSSDH48_iter_10000.caffemodel';
% % model definition
% model_def_file = './models/SSDH/deploy.prototxt';
% % caffe mode setting
% phase = 'test'; % run with phase test (so that dropout isn't applied)
% % input data
% test_file_list = 'img_list.txt';
% % ------ settings end here ------
% 
% % Extract binary hash codes
% [feat_test, list_im]= feat_batch(use_gpu, model_def_file, model_file, test_file_list, feat_len);
% binary_codes = (feat_test>0.5);
% save('binary48.mat','binary_codes','list_im','-v7.3');


% Visualization
% figure(1),
% set(gcf, 'Position'); 
% for i=1:4
%     image = sprintf('.%s',list_im{i});
%     codes = num2str(binary_codes(:,i)');
%     codes = sprintf('binary codes: %s',codes);
%     subplot(4,1,i), imshow(image); title(codes);
% end
% count=size(binary_codes,2);
% binary_code_length=48;
% c=zeros(count,count);
%  for i=1:count
%      
%      for j=1:count
%          a=binary_codes(:,i);
%          b=binary_codes(:,j);
%          if (i~=j)
%             
%          temp=xor(a,b);
%          result=binary_code_length-sum(temp);
%          c(i,j)=result;
%          else
%               c(i,j)=0;
%          end
%              
%          
%      end
%  end
%  
%   
 cnt=1;
 binary_codes =[

     1     1     0     1     1     1     1     1     1     1     1     1
     0     0     1     0     1     1     1     1     0     0     0     0
     1     1     1     1     0     0     0     0     0     0     0     0
     0     0     0     1     1     1     1     1     1     1     1     1
     1     1     0     0     0     0     0     0     1     1     1     1
     0     0     0     0     0     0     0     0     0     0     0     0
     1     1     0     1     1     1     1     1     1     1     1     1
     1     1     1     0     0     0     0     0     0     1     1     0
     0     0     0     0     0     0     0     0     1     1     1     1
     0     0     1     0     0     0     0     0     0     0     0     0
     0     0     0     0     1     1     1     1     0     0     0     0
     0     0     1     1     0     0     0     0     1     0     0     1
     0     0     0     1     1     1     1     1     1     0     1     1
     0     0     1     1     0     0     0     0     0     0     0     0
     1     1     1     0     0     0     0     0     0     0     0     0
     0     0     1     1     0     0     0     0     1     1     1     1
     1     1     1     1     0     0     0     0     1     1     1     1
     1     1     1     1     1     1     1     1     1     1     1     1
     0     0     1     1     0     0     0     0     0     0     0     0
     1     1     1     0     0     0     0     0     0     0     0     0
     1     0     0     1     0     0     0     0     1     1     1     1
     1     1     1     0     0     0     0     0     0     0     0     0
     0     0     0     1     1     1     1     1     0     0     0     0
     0     0     0     0     1     1     1     1     0     0     0     0
     1     1     1     1     1     1     1     1     0     0     0     0
     1     1     1     0     0     0     0     0     0     0     0     0
     0     0     1     1     0     0     0     0     0     0     0     0
     1     0     0     0     1     1     1     1     0     0     0     0
     1     1     1     1     1     1     1     1     0     0     0     0
     1     1     1     1     0     0     0     0     1     1     1     1
     1     1     1     0     1     1     1     1     1     1     0     1
     0     0     1     1     1     1     1     1     0     0     1     0
     0     0     0     1     1     1     1     1     0     0     0     0
     0     0     0     0     0     0     0     0     0     0     0     0
     1     0     1     0     1     1     1     1     1     0     0     0
     0     0     0     0     1     1     1     1     0     0     0     0
     1     1     1     0     1     1     1     1     1     1     1     1
     1     1     0     1     1     1     1     1     1     1     1     1
     1     1     1     1     1     1     1     1     1     1     1     1
     1     1     1     1     0     0     0     0     1     1     1     1
     0     1     1     1     1     1     1     1     0     0     1     1
     0     1     1     1     1     1     1     1     0     0     0     0
     1     1     0     0     1     1     1     1     0     1     1     1
     1     0     0     0     1     1     1     1     0     0     0     0
     0     0     1     1     0     0     0     0     0     0     0     0
     0     0     1     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0     0     1     1     1
     1     1     1     1     0     0     0     0     1     0     1     1];
count=size(binary_codes,2);
binary_code_length=48;
c=zeros(count,count);
for i=1:count-1
     
     for j=i+1:count
         a=binary_codes(:,i);
         b=binary_codes(:,j);
         
         temp=xor(a,b);
         result=binary_code_length-sum(temp);
         c(i,j)=result;
         
     end
 end
 count1=size(binary_codes,1);
 
 k=2; %%%% against first image results showed
     rpt_cnt=0;
     if k>1
         
    value1=c(1,(2:k));
    value_final=[value1 c(k,:)];
    sorted=sort(value_final,'descend');
     else
     sorted=sort(c(k,:),'descend');
     end
    top_retrieve=5;
    
     for ii=1:top_retrieve
         
         for jj=1:count
             
         if sorted(ii)==c(k,jj)  
             
%                  for kk=1:sorted_index(end)
% %                      if sorted_index(kk)~=c(k,jj)
             sorted_index(cnt)=(jj);
             
             cnt=cnt+1;
%              end
         end
         end
     end
  
%  sorted_index=sorted_index(1:5);
 
% %  figure(2),
% % set(gcf, 'Position'); 
% % for i=1:4
% %     image = sprintf('.%s',list_im{sorted_index});
% %     codes = num2str(binary_codes(:,sorted_index)');
% %     codes = sprintf('binary codes: %s',codes);
% %     subplot(4,1,i), imshow(image); title(codes);
% % end
% %  
sorted_index1=sort(sorted_index);
cntt=1;
for oo=1:length(sorted_index1)-1
    if sorted_index1(oo+1)==sorted_index1(oo)
    sorted_index2(cntt)=sorted_index(oo);
% sorted_index2;
    else
        sorted_index2(cntt)=sorted_index(oo);
        cntt=cntt+1;
    end
end
leng=length(sorted_index);
repeat_value=0;
    for oo=1:leng
        for kr=oo+1:leng
        if sorted_index(oo)==sorted_index(kr)
            repeat_value=repeat_value+1;
        end
if repeat_value==1
        sorted_index(kr)=0;
end
repeat_value=0;
        end
    end
    length1=length(find(sorted_index));
 
     val=mod(k,3);
     if val==1
         for u=1:length1
             if sorted_index(u)==k+1
                 yes=1;
             end
              if sorted_index(u)==k+2
                 yes1=1;
             end
         end 
     end
     if val==2
         for u=1:length1
             if sorted_index(u)==k-1
                 yes=1;
             end
              if sorted_index(u)==k+1
                 yes1=1;
             end
         end 
     end
     if val==0
         for u=1:length1
             if sorted_index(u)==k-1
                 yes=1;
             end
              if sorted_index(u)==k-2
                 yes1=1;
             end
         end 
     end
     
% 
% cd /home/naeem/Caffe-DeepBinaryCode/data/cifar10/demo_imgs/
% files=dir ('*.jpg');
% figure,imshow(files(k).name)
% cv=0;
% fig=1;
% figure(3);
% for ret=1:leng
%     if sorted_index(ret)~=0
%     
% a=imread(files(sorted_index(ret)).name);
% subplot(3,2,fig), imshow(a); 
% % figure,imshow(a)
% cv=cv+1;
% fig=fig+1;
%     end
% %     if cv==5
% %         break
% %     end
% end
% 
% % cd /home/naeem/Caffe-DeepBinaryCode/
% 
