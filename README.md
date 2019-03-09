# face_rec_amsoftmax

AM-Softmax matcher was utilized to train on the recently released VGGFace2 dataset that consists of 7,773 subjects and 1,428,908 images.

We evaluated the trained model on the LFW benchmark dataset and achieved a classification accuracy of 99.35%.

First, please compile the Caffe following the official installation guidelines. Specifically, you need to compile the matlab interface. 

Second, download the trained model:

https://1drv.ms/u/s!AhFf7JiY9UVbgUwMxfXB3JVz2cEd

After that, run the demo code to extract features and compute the similarity score. 

## Citation
If you use this code for your research, please cite our papers.
```
@inproceedings{SGGAN2019,
  title={Matching Thermal to Visible Face Images Using a Semantic-Guided Generative Adversarial Network},
  author={Chen, Cunjian and Ross, Arun},
  booktitle={IEEE International Conference on Automatic Face & Gesture Recognition},
  year={2019}
}

References:

1. https://github.com/happynear/AMSoftmax
2. http://www.robots.ox.ac.uk/~vgg/data/vgg_face2/
