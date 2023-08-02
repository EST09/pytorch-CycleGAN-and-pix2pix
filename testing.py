#load an image and save it

import cv2
import numpy as np
import os
import matplotlib.pyplot as plt

#load an image
img = plt.imread('/well/rittscher/users/qdv200/MPN/GAN_tiles/extra_data/fake_images_for_ssd/b-ET-CALR-2021-02-19-11-12-00_9_13_fake.png')
#save an image
plt.imsave('test2.jpg',img)

