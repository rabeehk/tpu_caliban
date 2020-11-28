. ~/.bashrc
# Get the TPU_RUNTIME argument
# Change RUNTIME to target version
# export TPU_IP_ADDRESS=10.134.229.10
# gcloud config set account xiaoxiaw@google.com
# mkdir /dataset
# mkdir /dataset/imagenet

export TPU_IP_ADDRESS=`python /change_runtime.py --target-version   pytorch-0.5-dev20200707`

# # Point XRT_TPU_CONFIG to the TPU instance
export XRT_TPU_CONFIG="tpu_worker;0;$TPU_IP_ADDRESS:8470"

# export GOOGLE_APPLICATION_CREDENTIALS="/curriculum-learning.json"

# gsutil -m -q cp -r gs://xiaoxiaw_blueshift/imagenet/val /dataset/imagenet/
# echo "done with imagenet val"
# gsutil -m -q cp -r gs://xiaoxiaw_blueshift/imagenet/train /dataset/imagenet/
# echo "done with imagenet train"

# Run the training
python /usr/share/torch-xla-1.7/pytorch/xla/test/test_train_mp_imagenet.py --fake_data
#python /pytorch/xla/test/test_train_mnist.py --num_epoch=$NUM_EPOCH 
# python /my_cifar10.py --batch_size=32 --starting_iter=10 --num_epoch=$NUM_EPOCH 

#python food-final.py $@
# echo hello: $@#!/bin/bash
