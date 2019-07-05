%% Clear Workspace
clc
clear
close all
%% Load Images
cd '/home/soumyasis/Work/img resize/Image data/Face'
files = dir;
count = 0;
for itr = files'
    if length(itr.name)>4 && ((itr.name(end-3:end) == ".jpg")||(itr.name(end-4:end) == ".jpeg")||(itr.name(end-3:end) == ".png"))
        count = count + 1;
        img{count} = (imread(itr.name));
        imgname{count} = itr.name;
    end
end
cd '/home/soumyasis/Work/img resize/nearest neighbour interpolation'
%% Show image and perform Nearest neighbour Interpolation
dim1 = input('Enter dimension 1 = ');
dim2 = input('Enter dimension 2 = ');
for i=1:length(img)+1
    w = waitforbuttonpress;
    if i== length(img)+1
        close all
        break
    end
    switch w
        case 1
            key = get(gcf,'currentcharacter');
            switch key
                case 27 % Esc key
                    disp('Stopping image display')
                    close all
                    break
                case 13 % Enter key
                    figure(i);
                    subplot(121);
                    imshow(img{1,i},[]);
                    title(strcat('Before interpolation ',imgname{1,i}));
                    axis([0,max(size(img{1,i},2),dim1),0,max(size(img{1,i},1),dim2)]);
                    axis on;
                    subplot(122);
                    output = nearest_np(img{1,i}, dim2, dim1);
                    imshow(output,[]);
                    title(strcat('After interpolation ',imgname{1,i}));
                    axis([0,max(size(img{1,i},2),dim1),0,max(size(img{1,i},1),dim2)]);
                    axis on;
                otherwise
                    disp('Press Esc to stop or Enter to continue')
            end
    end
end
close all
