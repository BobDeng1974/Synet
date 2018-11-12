[net]
# Training
# batch=128
# subdivisions=1
# Testing
batch=1
subdivisions=1
height=256
width=256
min_crop=128
max_crop=448
channels=3
momentum=0.9
decay=0.0005

burn_in=1000
learning_rate=0.1
policy=poly
power=4
max_batches=800000

angle=7
hue=.1
saturation=.75
exposure=.75
aspect=.75


[convolutional]
batch_normalize=1
filters=16
size=3
stride=1
pad=1
activation=leaky

[maxpool]
size=2
stride=2

[convolutional]
batch_normalize=1
filters=32
size=3
stride=1
pad=1
activation=leaky

[maxpool]
size=2
stride=2

[convolutional]
batch_normalize=1
filters=64
size=3
stride=1
pad=1
activation=leaky

[maxpool]
size=2
stride=2

[convolutional]
batch_normalize=1
filters=128
size=3
stride=1
pad=1
activation=leaky

[maxpool]
size=2
stride=2

[convolutional]
batch_normalize=1
filters=256
size=3
stride=1
pad=1
activation=leaky

[maxpool]
size=2
stride=2

[convolutional]
batch_normalize=1
filters=512
size=3
stride=1
pad=1
activation=leaky

[maxpool]
size=2
stride=2

[convolutional]
batch_normalize=1
filters=1024
size=3
stride=1
pad=1
activation=leaky

[avgpool]

[convolutional]
filters=1000
size=1
stride=1
pad=1
activation=linear

[softmax]
groups=1