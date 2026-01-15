cd ..
git clone https://github.com/rusty1s/pytorch_scatter.git

pip3 install torch torchvision torchaudio \
  --index-url https://download.pytorch.org/whl/cu124

pip install numpy scipy tqdm lpips mmcv imageio imageio-ffmpeg \
  opencv-python trimesh plyfile scikit-image scikit-learn ninja \
  tensorboard pymcubes icecream torch_efficient_distloss matplotlib

pip install setuptools==59.5.0

cd pytorch_scatter
python setup.py install

cd ../voxurf/lib/cuda/
python setup.py install
