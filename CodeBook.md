# CodeBook.md

This is a "code book" for explaining the structure and methods used to convert a raw data set to a "tidy" data set for the 
Cousera online "Cleaning Data" course.

The initial portion gives the source data of the original raw data files and also variable names and descriptions copied from the source data files. 

## Initial "RAW DATA" Description

Full description of the data available at the source website here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original link given to the zipped raw data file for the project here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Raw data set consists of two folders "test" and "train" with each of these consisting of a subfolder of "Inertial Signals" text files, and "subject_train.txt", "X_train.txt" and "y_train.txt" files. The main folder contains four descriptive project overview text files, including a "README.txt" file which gives a description of all files in the raw data set. 

### Original data file description (copied from "README.txt" file): 

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### License (copied from their README.txt file): 

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## Raw Data Variable description 

####Original activity labels (found in activity_labels.txt):
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

####Original analyzed features (found in features.txt): 
1. tBodyAcc-mean()-X
2. tBodyAcc-mean()-Y
3. tBodyAcc-mean()-Z
4. tBodyAcc-std()-X
5. tBodyAcc-std()-Y
6. tBodyAcc-std()-Z
7. tBodyAcc-mad()-X
8. tBodyAcc-mad()-Y
9. tBodyAcc-mad()-Z
10. tBodyAcc-max()-X
11. tBodyAcc-max()-Y
12. tBodyAcc-max()-Z
13. tBodyAcc-min()-X
14. tBodyAcc-min()-Y
15. tBodyAcc-min()-Z
16. tBodyAcc-sma()
17. tBodyAcc-energy()-X
18. tBodyAcc-energy()-Y
19. tBodyAcc-energy()-Z
20. tBodyAcc-iqr()-X
21. tBodyAcc-iqr()-Y
22. tBodyAcc-iqr()-Z
23. tBodyAcc-entropy()-X
24. tBodyAcc-entropy()-Y
25. tBodyAcc-entropy()-Z
26. tBodyAcc-arCoeff()-X,1
27. tBodyAcc-arCoeff()-X,2
28. tBodyAcc-arCoeff()-X,3
29. tBodyAcc-arCoeff()-X,4
30. tBodyAcc-arCoeff()-Y,1
31. tBodyAcc-arCoeff()-Y,2
32. tBodyAcc-arCoeff()-Y,3
33. tBodyAcc-arCoeff()-Y,4
34. tBodyAcc-arCoeff()-Z,1
35. tBodyAcc-arCoeff()-Z,2
36. tBodyAcc-arCoeff()-Z,3
37. tBodyAcc-arCoeff()-Z,4
38. tBodyAcc-correlation()-X,Y
39. tBodyAcc-correlation()-X,Z
40. tBodyAcc-correlation()-Y,Z
41. tGravityAcc-mean()-X
42. tGravityAcc-mean()-Y
43. tGravityAcc-mean()-Z
44. tGravityAcc-std()-X
45. tGravityAcc-std()-Y
46. tGravityAcc-std()-Z
47. tGravityAcc-mad()-X
48. tGravityAcc-mad()-Y
49. tGravityAcc-mad()-Z
50. tGravityAcc-max()-X
51. tGravityAcc-max()-Y
52. tGravityAcc-max()-Z
53. tGravityAcc-min()-X
54. tGravityAcc-min()-Y
55. tGravityAcc-min()-Z
56. tGravityAcc-sma()
57. tGravityAcc-energy()-X
58. tGravityAcc-energy()-Y
59. tGravityAcc-energy()-Z
60. tGravityAcc-iqr()-X
61. tGravityAcc-iqr()-Y
62. tGravityAcc-iqr()-Z
63. tGravityAcc-entropy()-X
64. tGravityAcc-entropy()-Y
65. tGravityAcc-entropy()-Z
66. tGravityAcc-arCoeff()-X,1
67. tGravityAcc-arCoeff()-X,2
68. tGravityAcc-arCoeff()-X,3
69. tGravityAcc-arCoeff()-X,4
70. tGravityAcc-arCoeff()-Y,1
71. tGravityAcc-arCoeff()-Y,2
72. tGravityAcc-arCoeff()-Y,3
73. tGravityAcc-arCoeff()-Y,4
74. tGravityAcc-arCoeff()-Z,1
75. tGravityAcc-arCoeff()-Z,2
76. tGravityAcc-arCoeff()-Z,3
77. tGravityAcc-arCoeff()-Z,4
78. tGravityAcc-correlation()-X,Y
79. tGravityAcc-correlation()-X,Z
80. tGravityAcc-correlation()-Y,Z
81. tBodyAccJerk-mean()-X
82. tBodyAccJerk-mean()-Y
83. tBodyAccJerk-mean()-Z
84. tBodyAccJerk-std()-X
85. tBodyAccJerk-std()-Y
86. tBodyAccJerk-std()-Z
87. tBodyAccJerk-mad()-X
88. tBodyAccJerk-mad()-Y
89. tBodyAccJerk-mad()-Z
90. tBodyAccJerk-max()-X
91. tBodyAccJerk-max()-Y
92. tBodyAccJerk-max()-Z
93. tBodyAccJerk-min()-X
94. tBodyAccJerk-min()-Y
95. tBodyAccJerk-min()-Z
96. tBodyAccJerk-sma()
97. tBodyAccJerk-energy()-X
98. tBodyAccJerk-energy()-Y
99. tBodyAccJerk-energy()-Z
100. tBodyAccJerk-iqr()-X
101. tBodyAccJerk-iqr()-Y
102. tBodyAccJerk-iqr()-Z
103. tBodyAccJerk-entropy()-X
104. tBodyAccJerk-entropy()-Y
105. tBodyAccJerk-entropy()-Z
106. tBodyAccJerk-arCoeff()-X,1
107. tBodyAccJerk-arCoeff()-X,2
108. tBodyAccJerk-arCoeff()-X,3
109. tBodyAccJerk-arCoeff()-X,4
110. tBodyAccJerk-arCoeff()-Y,1
111. tBodyAccJerk-arCoeff()-Y,2
112. tBodyAccJerk-arCoeff()-Y,3
113. tBodyAccJerk-arCoeff()-Y,4
114. tBodyAccJerk-arCoeff()-Z,1
115. tBodyAccJerk-arCoeff()-Z,2
116. tBodyAccJerk-arCoeff()-Z,3
117. tBodyAccJerk-arCoeff()-Z,4
118. tBodyAccJerk-correlation()-X,Y
119. tBodyAccJerk-correlation()-X,Z
120. tBodyAccJerk-correlation()-Y,Z
121. tBodyGyro-mean()-X
122. tBodyGyro-mean()-Y
123. tBodyGyro-mean()-Z
124. tBodyGyro-std()-X
125. tBodyGyro-std()-Y
126. tBodyGyro-std()-Z
127. tBodyGyro-mad()-X
128. tBodyGyro-mad()-Y
129. tBodyGyro-mad()-Z
130. tBodyGyro-max()-X
131. tBodyGyro-max()-Y
132. tBodyGyro-max()-Z
133. tBodyGyro-min()-X
134. tBodyGyro-min()-Y
135. tBodyGyro-min()-Z
136. tBodyGyro-sma()
137. tBodyGyro-energy()-X
138. tBodyGyro-energy()-Y
139. tBodyGyro-energy()-Z
140. tBodyGyro-iqr()-X
141. tBodyGyro-iqr()-Y
142. tBodyGyro-iqr()-Z
143. tBodyGyro-entropy()-X
144. tBodyGyro-entropy()-Y
145. tBodyGyro-entropy()-Z
146. tBodyGyro-arCoeff()-X,1
147. tBodyGyro-arCoeff()-X,2
148. tBodyGyro-arCoeff()-X,3
149. tBodyGyro-arCoeff()-X,4
150. tBodyGyro-arCoeff()-Y,1
151. tBodyGyro-arCoeff()-Y,2
152. tBodyGyro-arCoeff()-Y,3
153. tBodyGyro-arCoeff()-Y,4
154. tBodyGyro-arCoeff()-Z,1
155. tBodyGyro-arCoeff()-Z,2
156. tBodyGyro-arCoeff()-Z,3
157. tBodyGyro-arCoeff()-Z,4
158. tBodyGyro-correlation()-X,Y
159. tBodyGyro-correlation()-X,Z
160. tBodyGyro-correlation()-Y,Z
161. tBodyGyroJerk-mean()-X
162. tBodyGyroJerk-mean()-Y
163. tBodyGyroJerk-mean()-Z
164. tBodyGyroJerk-std()-X
165. tBodyGyroJerk-std()-Y
166. tBodyGyroJerk-std()-Z
167. tBodyGyroJerk-mad()-X
168. tBodyGyroJerk-mad()-Y
169. tBodyGyroJerk-mad()-Z
170. tBodyGyroJerk-max()-X
171. tBodyGyroJerk-max()-Y
172. tBodyGyroJerk-max()-Z
173. tBodyGyroJerk-min()-X
174. tBodyGyroJerk-min()-Y
175. tBodyGyroJerk-min()-Z
176. tBodyGyroJerk-sma()
177. tBodyGyroJerk-energy()-X
178. tBodyGyroJerk-energy()-Y
179. tBodyGyroJerk-energy()-Z
180. tBodyGyroJerk-iqr()-X
181. tBodyGyroJerk-iqr()-Y
182. tBodyGyroJerk-iqr()-Z
183. tBodyGyroJerk-entropy()-X
184. tBodyGyroJerk-entropy()-Y
185. tBodyGyroJerk-entropy()-Z
186. tBodyGyroJerk-arCoeff()-X,1
187. tBodyGyroJerk-arCoeff()-X,2
188. tBodyGyroJerk-arCoeff()-X,3
189. tBodyGyroJerk-arCoeff()-X,4
190. tBodyGyroJerk-arCoeff()-Y,1
191. tBodyGyroJerk-arCoeff()-Y,2
192. tBodyGyroJerk-arCoeff()-Y,3
193. tBodyGyroJerk-arCoeff()-Y,4
194. tBodyGyroJerk-arCoeff()-Z,1
195. tBodyGyroJerk-arCoeff()-Z,2
196. tBodyGyroJerk-arCoeff()-Z,3
197. tBodyGyroJerk-arCoeff()-Z,4
198. tBodyGyroJerk-correlation()-X,Y
199. tBodyGyroJerk-correlation()-X,Z
200. tBodyGyroJerk-correlation()-Y,Z
201. tBodyAccMag-mean()
202. tBodyAccMag-std()
203. tBodyAccMag-mad()
204. tBodyAccMag-max()
205. tBodyAccMag-min()
206. tBodyAccMag-sma()
207. tBodyAccMag-energy()
208. tBodyAccMag-iqr()
209. tBodyAccMag-entropy()
210. tBodyAccMag-arCoeff()1
211. tBodyAccMag-arCoeff()2
212. tBodyAccMag-arCoeff()3
213. tBodyAccMag-arCoeff()4
214. tGravityAccMag-mean()
215. tGravityAccMag-std()
216. tGravityAccMag-mad()
217. tGravityAccMag-max()
218. tGravityAccMag-min()
219. tGravityAccMag-sma()
220. tGravityAccMag-energy()
221. tGravityAccMag-iqr()
222. tGravityAccMag-entropy()
223. tGravityAccMag-arCoeff()1
224. tGravityAccMag-arCoeff()2
225. tGravityAccMag-arCoeff()3
226. tGravityAccMag-arCoeff()4
227. tBodyAccJerkMag-mean()
228. tBodyAccJerkMag-std()
229. tBodyAccJerkMag-mad()
230. tBodyAccJerkMag-max()
231. tBodyAccJerkMag-min()
232. tBodyAccJerkMag-sma()
233. tBodyAccJerkMag-energy()
234. tBodyAccJerkMag-iqr()
235. tBodyAccJerkMag-entropy()
236. tBodyAccJerkMag-arCoeff()1
237. tBodyAccJerkMag-arCoeff()2
238. tBodyAccJerkMag-arCoeff()3
239. tBodyAccJerkMag-arCoeff()4
240. tBodyGyroMag-mean()
241. tBodyGyroMag-std()
242. tBodyGyroMag-mad()
243. tBodyGyroMag-max()
244. tBodyGyroMag-min()
245. tBodyGyroMag-sma()
246. tBodyGyroMag-energy()
247. tBodyGyroMag-iqr()
248. tBodyGyroMag-entropy()
249. tBodyGyroMag-arCoeff()1
250. tBodyGyroMag-arCoeff()2
251. tBodyGyroMag-arCoeff()3
252. tBodyGyroMag-arCoeff()4
253. tBodyGyroJerkMag-mean()
254. tBodyGyroJerkMag-std()
255. tBodyGyroJerkMag-mad()
256. tBodyGyroJerkMag-max()
257. tBodyGyroJerkMag-min()
258. tBodyGyroJerkMag-sma()
259. tBodyGyroJerkMag-energy()
260. tBodyGyroJerkMag-iqr()
261. tBodyGyroJerkMag-entropy()
262. tBodyGyroJerkMag-arCoeff()1
263. tBodyGyroJerkMag-arCoeff()2
264. tBodyGyroJerkMag-arCoeff()3
265. tBodyGyroJerkMag-arCoeff()4
266. fBodyAcc-mean()-X
267. fBodyAcc-mean()-Y
268. fBodyAcc-mean()-Z
269. fBodyAcc-std()-X
270. fBodyAcc-std()-Y
271. fBodyAcc-std()-Z
272. fBodyAcc-mad()-X
273. fBodyAcc-mad()-Y
274. fBodyAcc-mad()-Z
275. fBodyAcc-max()-X


#### Original description of features (found in features_info.txt): 
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

# Gathered and Manipulated Data Set Information 

## General description 

The goal of the project was to gather the information from the X_test.txt and X_train.txt files, add information about which person who was wearing which parts of the data and their corresponding activities.  After that, summary data in terms of averaged mean and averaged standard deviations were found for each gathered sub-type.   For more particulars on how each variable below was found, look in the README.md file.

## Variables and Values in tidy data set, including partial descriptions 

* activities (df, text version of values from ‘activity_labels.txt, number version deleted)
* activity = X_total$activity (same content as X_test_activity and X_test_activity)
* features (df, values from ‘features.txt’ file)
* meanCols (vector, columns of X_total that contain ‘[Mm]ean’)
* meanData = output of mean value of each grouping in X_selected
* stdCols (vector, columns of X_total that contain ‘[Ss]td’)
* subject = X_total$subject (same content as X_test_subject and X_train_subject)
* X_selected (df, selected columns that contain mean, std quantities plus subject and activity, at end grouped by activity and subject and then arranged by same)
* X_selected_cols (vector, column names of X_selected)
* X_test_all (df, combination of X_test df above)
* X_test_subject (df, numeric values from ‘subject_test.txt’)
* X_text  (df, numeric values from ‘X_test.txt’ file, given column names from ‘features.txt’)
* X_total (df, combination of X_test_all and X_train_all)
* X_train (df, numeric values from ‘X_train.txt’ file, given column names from ‘features.txt’)
* X_train_all (df, combination of X_train df above)
* X_train_subject (df, numeric values from ‘subject_train.txt’)
* y_test (df, numeric values from ‘y_test.txt’)
* y_train (df, numeric values from ‘y_train.txt’)

## Units of variables (when present)

1. Many of the variables produced in the analysis are label names without units.  For example, the 'subject' data frame consists of a numeric idenifier for the person who carried the smartphone, and 'activity' is a data frame giving the type of activity the person was engaged in, e.g. 'WALKING' and thus don't have units.

2. Any data type that contains 'Acc' as part of the column header is measured in `g' units where gravitational acceleration is subtracted from the value obtained and has units of m/s^2.  

3. Andy data type that contains 'Gyro' as part of the column header is an angular velocity vector value (arc speed) and measured in radians/seconds.  As radians are dimensionless, this can also be given as 1/s. 

