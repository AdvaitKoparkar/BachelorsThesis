### BachelorsThesis
The code in this repository is a part of the work which I did during my Bachelor's thesis at the Indian Institute of Science, Bangalore under the guidance Dr. Prasanta Kumar Ghosh.

For a detailed description of the algorithm and the methodology, please refer to my paper which has been accepted and published by IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP) 2018. This can be found on the SPIRE Lab webpage. You can also access the presentation which I used to present at ICASSP 2018. We used the TIMIT-rtMRI database for this study. For detailed performance statistics or possible extension to other datasets please contact me at: advaitkoparkar@gmail.com

## Algorithm Overview


## Code snippets
# Code for Supervised Automatic Contouring of rtMRI Images

*) `src/bestmap.m` contains the main Dynamic Programming Logic used for Contour Prediction of rtMRI images
*) `examples` coontains sample images of predicted contours

# Fisher Discriminant
*) The algorithm uses the **Fisher Discriminant** function as the measure of contrast that is to be maximized for contour detection
*) The fisher value for contours is calculated in `src/fisher.m'

# Dynamic Time Warping Distance
*) DTW distance is calculated in `src/dtw.m`

# Results
Results and figures showing accurancy of upper and lower air-tissue boundaries is shown in `src/results`


