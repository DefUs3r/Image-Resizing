# Image-Resizing

A repository that contains implementations of Image resizing Algorithms in MATLAB

# Getting Started

Follow the instructions to load a set of images resized to desired dimensions.

* Install ```MATLAB 2019r``` on your system.
* Clone this repository to your system.
* Open the ```load_data_nearest.m``` file and ```load_data_bil_interp.m```. In the section labelled ```Load Images```, change the directory addresses for Image data and the algorithm to your respective current address.
* Open MATLAB and click on ```Run```.
* By default, images will load in ```1024 X 768```. To change the dimensions, go to the section labelled ```Show image and    perform (Respective Algorithm)``` and change the line containing :-
  ```
  output = bil_interp(img{1,i}, [Desired size here as first,second] );
  ```
  for bilinear interpolation of image to ```first X second```. For nearest neighbour interpolation to ```first X second```,   follow the above and change it to :-
  ```
  output = nearest_np(img{1,i}, [Desired size here as first,second] );
  ```

# Contributing

Feel free to submit pull requests and issues. If it's a particualy large PR, you may wish to discuss it in an issue first.
Please attach a screenshot with the issue clearling showing your workspace, variables and error-logs(if any). Also, feel free to suggest optimisations in the written code, more specifically for GPU based parallel computing optimisations.

## Authors

* Soumyasis Gun - ```<riddhyasona@gmail.com>```

## References

* ```https://en.wikipedia.org/wiki/Bilinear_interpolation```
* ```https://en.wikipedia.org/wiki/Interpolation```
