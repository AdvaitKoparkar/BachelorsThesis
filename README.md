### A Supervised Method for ATB prediction  for rtMRI videos

The code in this repository is a part of the work which I did during my Bachelor's thesis at the Indian Institute of Science, Bangalore.

For a detailed description of the algorithm and the methodology, please refer to my paper which has been accepted and published by IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP) 2018. I used the TIMIT-rtMRI database for this study. For detailed performance statistics or possible extension to other datasets please contact me at: advaitkoparkar@gmail.com

Paper Link: https://ieeexplore.ieee.org/document/8462412

## Algorithm Overview
The algorithm predicts air tissue boundaries in 5 parts and then combines them to form continuous upper and lower contours
![ovr](https://user-images.githubusercontent.com/21837899/43767576-1c32f69c-9a53-11e8-9b09-68482b00ead4.png)


# Code for Supervised Automatic Contouring of rtMRI Images
The detailed steps of the prediction system are shown in the following figure
![algo](https://user-images.githubusercontent.com/21837899/43767574-1bbd5860-9a53-11e8-9f77-c947e689aeb9.png)


# Fisher Discriminant
The algorithm uses the **Fisher Discriminant** function as the measure of contrast that is to be maximized for contour detection. The fisher value for contours is calculated in `src/fisher.m'. Some examples of the fisher discriminant are shown in the figure below.
![fisher](https://user-images.githubusercontent.com/21837899/43767575-1bf3e218-9a53-11e8-92ba-1fa64a5efc35.png)

# Processing Predicted Contours
**Contour Stitching**
![stict](https://user-images.githubusercontent.com/21837899/43767572-1b862372-9a53-11e8-8fbb-a41519ba7e44.png)

**Contour Pruning**
![prun](https://user-images.githubusercontent.com/21837899/43767577-1c7a0fdc-9a53-11e8-8005-0b7f3c933f99.png)

# Dynamic Time Warping Distance
DTW distance is calculated in `src/dtw.m`. It measures the aignment of two contours in pixels.
![histograms](https://user-images.githubusercontent.com/21837899/43768207-6e1188b0-9a54-11e8-8148-78e281767972.png)

# Dynamic Programming
Dynamic programming is used to maximize fisher discriminant and minimize obtain smoothly varying contours across the frames of the test video.
![dp](https://user-images.githubusercontent.com/21837899/43768211-70873b9e-9a54-11e8-8808-f9dbb65bfba9.png)

# Results
![res1](https://user-images.githubusercontent.com/21837899/43767569-1b057ec0-9a53-11e8-87d6-e69d786aaf2b.png)
![res2](https://user-images.githubusercontent.com/21837899/43767571-1b482d2e-9a53-11e8-91c4-e4af85c8395a.png)

