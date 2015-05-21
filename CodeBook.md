### Code Book

#### This Code Book describes the variables, the data, and any transformations or work performed to clean up the data

For each observation (row) in the data following variables are provided (this is an extract from the README file that comes with the data set):

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Data comes from the experiments performed by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory.

Transformations applied to the data:

1. merging training and testing sets
2. dropping all variables apart from means and standard deviations of the measurements
3. creating a table showing averages of the variables for each activity and subject