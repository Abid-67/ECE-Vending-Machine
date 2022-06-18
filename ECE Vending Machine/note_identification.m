function note = note_identification(Img_file)
    
    % database dataset
    I5 = imread("db 5 taka.jpg");
    I10 = imread("db 10 taka.jpg");
    I20 = imread("db 20 taka.jpg");
    I50 = imread("db 50 taka.jpg");
    
    % input image
    Iin = imread(Img_file);
    
    % dataset image resizing
    I5_rsz = imresize(I5, [63 146]);
    I10_rsz = imresize(I10, [63 146]);
    I20_rsz = imresize(I20, [63 146]);
    I50_rsz = imresize(I50, [63 146]);

    % input image resizing
    Iin_rsz = imresize(Iin, [63 146]);
    
    % rgb to grayscale conversion of dataset images
    I5_gray = im2gray(I5_rsz);
    I10_gray = im2gray(I10_rsz);
    I20_gray = im2gray(I20_rsz);
    I50_gray = im2gray(I50_rsz);
      
    % rgb to gray conversion of input image
    Iin_gray = im2gray(Iin_rsz);

    % grayscaled dataset
    Idb_gray = zeros(4,63,146);
    Idb_gray(1,:,:) = I5_gray;
    Idb_gray(2,:,:) = I10_gray;
    Idb_gray(3,:,:) = I20_gray;
    Idb_gray(4,:,:) = I50_gray;
    
    % 2D median filtering of grayscaled dataset
    J = zeros(4,63,146);
    for i = 1:4
        A = shiftdim(Idb_gray(i,:,:));
        B = medfilt2(A);
        J(i,:,:) = B;
    end
    
    % 2D median filtering of grayscaled input
    Jin = medfilt2(Iin_gray);
    
    % identification of note
    for k = 1:4
        C3 = J(k,:,:);
        C2 = shiftdim(C3);
        % 2D correlation coefficient calculation
        R = corr2(C2,Jin);
        if R >= 0.9  % Threshold = 90%
            if k == 1
                note = 5;
                break
            elseif k == 2
                note = 10;
                break
            elseif k == 3
                note = 20;
                break
            else
                note = 50;
                break
            end
        end
    end

end