function y = distance(~)
Im = webcam(1).snapshot();
imwrite(Im, 'DistanceH.jpeg');
Im = imread('DistanceH.jpeg');
% incorporate cropping here
% 0.85 cm / seconds
% distance / speed(0.85cm) = time
% 25.5 from camera to tip of pipette
croppedIm = Im(200:900,600:1100,:);
Im = croppedIm;
I_Red = Im(:,:,1);
I_Green = Im(:,:,2);
I_Blue = Im(:,:,3);
ImChoice = I_Green;
threshold = 0.35;   % change
Thr = imbinarize(ImChoice, threshold);
BW_Image = ~Thr;
bboxes = regionprops (BW_Image, 'BoundingBox');
hold on
for k = 1:length(bboxes)
    CurrBB = bboxes(k).BoundingBox;
    rectangle('Position' , [CurrBB(1), CurrBB(2), CurrBB(3), CurrBB(4)], 'EdgeColor', 'r', 'Linewidth', 2);
end
hold off
CurrBB = bboxes(length(bboxes)).BoundingBox;
BallTop = CurrBB(2);
BallHeght = CurrBB(4);
BottomBox = BallTop + BallHeight;
CurrBB = bboxes(1).BoundingBox;
TopBox = CurrBB(2);
DistancePixels = TopBox - BottomBox;
DistanceCm = DistancePixels * 0.5/27; % cm / px
imshow(Im)
hold on
for k = 1:length(bboxes)
    CurrBB = bboxes(k).BoundingBox;
    rectangle('Position', [CurrBB(1), CurrBB(2), CurrBB(3), CurrBB(4)], 'EdgeColor', 'r', 'Linewidth', 2);
end
hold off
title ([num2str(DistanceCm), ' cm distance']);    %label plot
if (DistanceCm < 0)
    y = DistanceCm * -1;
end
if (DistanceCm > 0)
y = DistanceCm;
end i
