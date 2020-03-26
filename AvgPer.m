% close all
% clear all
% clc

% load netTransfer_BP_final

% downloadFolder ='C:\Rizwan\matlab 209\bin';
% imageFolder=fullfile(downloadFolder,'complete_dataset');
% testSet = imageDatastore(imageFolder, 'LabelSource', 'foldernames', 'IncludeSubfolders',true);
% 
% imageSize = [227 227];
% 
% augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');
% 
% [YPred,scores] = classify(netTransfer_BP_final,augmentedTestSet);
% 
% save scores.mat
function AvgPerformance( )

load('scores.mat');
DeepCodes = scores;

count = 0;

for query=1:size(scores,1) 
    
    Indxs = knnsearch(DeepCodes,DeepCodes(query,:),'k',6,'NSMethod','exhaustive','distance','euclidean');
    tmp = mod(query,3);  
    
    for j=1:size(Indxs,2)   
        
        if (tmp == 0)
            if (Indxs(j) == (query - 1) | Indxs(j) == (query-2))
                count = count+1;	break;
            end
        end
        
        if (tmp == 1)            
            if (Indxs(j) == (query + 1) | Indxs(j) == (query+2))
                count = count+1;	break;
            end
        end
            
        if (tmp == 2)
            if (Indxs(j) == (query-1) | Indxs(j) == (query+1))
                count = count+1;    break;			
            end
        end
        
    end
    
end


        
overall_count = 0;

for query=1:size(scores,1)
    
    Indxs = knnsearch(DeepCodes,DeepCodes(query,:),'k',6,'NSMethod','exhaustive','distance','euclidean');
    tmp = mod(query,3);  
    
    for j=1:size(Indxs,2)   
        
        if (tmp == 0)
            if (Indxs(j) == (query - 1) | Indxs(j) == (query-2))
                overall_count = overall_count+1;
            end
        end
        
        if (tmp == 1)            
            if (Indxs(j) == (query + 1) | Indxs(j) == (query+2))
                overall_count = overall_count+1;
            end
        end
            
        if (tmp == 2)
            if (Indxs(j) == (query-1) | Indxs(j) == (query+1))
                overall_count = overall_count+1;		
            end
        end
        
    end
    
end

performance = (count * 100) / size(DeepCodes,1);
disp(['Average Performance ', num2str(performance)]);

overall_performance = (overall_count * 100) / (2*size(DeepCodes,1));
disp(['Over All Average Performance ', num2str(overall_performance)]);

end


