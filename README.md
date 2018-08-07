### BachelorsThesis
The code in this repository is a part of the work which I did during my Bachelor's thesis at the Indian Institute of Science, Bangalore under the guidance Dr. Prasanta Kumar Ghosh.

For a detailed description of the algorithm and the methodology, please refer to my paper which has been accepted and published by IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP) 2018. This can be found on the SPIRE Lab webpage. You can also access the presentation which I used to present at ICASSP 2018. We used the TIMIT-rtMRI database for this study. For detailed performance statistics or possible extension to other datasets please contact me at: advaitkoparkar@gmail.com

## Algorithm Overview
![basic-flowchart1-17102027-compressed](https://user-images.githubusercontent.com/21837899/43763221-d44df04e-9a47-11e8-9628-0b3be8b2c56d.png)

## Code snippets
# Code for Supervised Automatic Contouring of rtMRI Images
![ctr_stitch](https://user-images.githubusercontent.com/21837899/43766109-3f6ba96e-9a4f-11e8-962f-ae615e2c84ac.png)
![ctr_stitch_1](https://user-images.githubusercontent.com/21837899/43766111-3fa682dc-9a4f-11e8-96a7-4720c2c8ee3e.png)

# Fisher Discriminant
*) The algorithm uses the **Fisher Discriminant** function as the measure of contrast that is to be maximized for contour detection
*) The fisher value for contours is calculated in `src/fisher.m'

# Dynamic Time Warping Distance
*) DTW distance is calculated in `src/dtw.m`

# Dynamic Programming
![dp_new](https://user-images.githubusercontent.com/21837899/43766112-40195d3e-9a4f-11e8-8bff-c504bd4ae3e0.png)

# Results
Results and figures showing accurancy of upper and lower air-tissue boundaries is shown in `src/results`
![compare_1](https://user-images.githubusercontent.com/21837899/43766113-4053cb22-9a4f-11e8-9d66-322e1d3007e8.png)
![compare_2](https://user-images.githubusercontent.com/21837899/43766117-4090f722-9a4f-11e8-97f8-49c58853dbaa.png)


