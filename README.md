
# Liquid Level Detection

This project implements a computer vision-based system for detecting the liquid level in an image. The system processes an image to identify the boundaries of liquid and measure its height, using a series of image processing techniques.

## Features

- **Image Preprocessing**: Resize and convert the input image to grayscale.
- **Noise Reduction**: Apply a smoothing filter to reduce noise in the grayscale image.
- **Thresholding**: Convert the image into a binary format by applying a threshold.
- **Morphological Operations**: Use erosion and dilation to refine the boundaries.
- **Segmentation**: Identify and label different regions in the processed image.
- **Liquid Level Detection**: Determine the liquid and non-liquid regions and calculate the height of the liquid.

## Getting Started

### Prerequisites

- MATLAB (The codebase is developed in MATLAB)
- Image Processing Toolbox

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/thomas-cad/liquid_level_detection.git
   ```
2. Open MATLAB and navigate to the cloned directory.

### Usage

1. **Load and Process Image**:
   Place the image you want to process in the project directory and update the `img_test.jpg` file path in `main.m`.

2. **Run the Main Script**:
   Run `main.m` in MATLAB. This script processes the image and displays the detected liquid level.

### Key Functions

- `filtreMoyenneur(img, size)`: Applies a mean filter to smooth the image.
- `filtreEro(img, size)`: Performs erosion on the image to remove noise.
- `filtreDilat(img, size)`: Dilates the image to fill gaps.
- `segmentation(img)`: Segments the image into different regions.
- `FindLiquide(img, obj1, obj2)`: Identifies the liquid region.
- `FindBouchon(img, obj1, obj2)`: Identifies the cap or solid object in the image.

### Example

```matlab
clear all;
close all;

% Load and resize image
img = imread('img_test.jpg');
img = imresize(img, [500 500]);

% Convert to grayscale
img_nvg = rgb2gray(img);

% Smooth the image
img_moy = filtreMoyenneur(img_nvg, 3);

% Thresholding
seuil = 60;
img_seuil = 255 * (img_moy < seuil);

% Morphological operations
img_ero1 = filtreEro(img_seuil, 3);
img_reDilat1 = filtreDilat(img_ero1, 3);

% Segmentation
img_seg = segmentation(img_reDilat1);

% Find liquid and cap
obj = numerotation(img_seg);
liquide = FindLiquide(img_seg, obj(1), obj(2));
bouchon = FindBouchon(img_seg, obj(1), obj(2));

% Calculate liquid height
hauteurLiquide = MoyenneHauteur(liquide, bouchon);
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the contributors and the MATLAB community for their support.
