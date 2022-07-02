The problem statement was to classify the samples from the [CIFAR-10 Dataset](https://www.cs.toronto.edu/~kriz/cifar.html).

### Question-1
- Images were converted to grayscale.
- A CNN was written from scratch to perform 2D convolution on the samples and extract features.
- Since this is a huge dataset, a CNN without the use of torch would take way too long. 
  Hence, the model would take very long to be trained and tested. So, I ran the training for a very few epochs,and
  used only a small number of parameters (1860)
- However, I used CuPy instead to NumPy to code the CNN to leverage GPUs on Colab. This was enabled by writing
  CUDA kernels for convolution, MaxPool, and backprop. 
- The use of CuPy with CUDA enabled an acceleration by the factor of 833 times. I could train on more samples in lesser amount of time.
- For more details, check the [report](https://github.com/sid-betalol/BT3041-Analysis-and-Interpretation-of-Biological-Data/blob/main/assignment2_cnn/report.pdf).
- Check code on Colab [here](https://colab.research.google.com/drive/1G913QeB30kGbgbruyu8UDglNUlynsZzj?usp=sharing).

### Question-2
- Colour Images were used.
- Used 3D convolution with torch this time, along with CuPy and CUDA.
- Accuracy improved by around 34% as I could train with more parameters (around 1 million).
- For more details, check the [report](https://github.com/sid-betalol/BT3041-Analysis-and-Interpretation-of-Biological-Data/blob/main/assignment2_cnn/report.pdf).
- Check code on Colab [here](https://colab.research.google.com/drive/1GL4lbsyA9cKkJIgfTrhOWL3Gg__5tv-M?usp=sharing).

The fact that the CIFAR-10 dataset has a significant bottleneck in the form of images with a
maximum resolution of 32x32 is a positive component of this assignment. This means that, while
more powerful networks with higher parameters and fancier connections will perform better, the
benefit of increasing complexity will be minor because there is only so much detail in the image
to collect.


#### To add: An approach based on Convolutional Spiking Neural Networks, which gives better accuracy (around 69%).
