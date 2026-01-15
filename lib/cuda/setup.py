from setuptools import setup
from torch.utils.cpp_extension import BuildExtension, CUDAExtension
import os

# 获取当前文件所在目录
current_dir = os.path.dirname(os.path.abspath(__file__))

setup(
    name='voxurf_cuda_ext',
    ext_modules=[
        CUDAExtension(
            name='ub360_utils_cuda',
            sources=[
                os.path.join(current_dir, 'ub360_utils.cpp'),
                os.path.join(current_dir, 'ub360_utils_kernel.cu'),
            ],
        ),
        CUDAExtension(
            name='render_utils_cuda',
            sources=[
                os.path.join(current_dir, 'render_utils.cpp'),
                os.path.join(current_dir, 'render_utils_kernel.cu'),
            ],
        ),
    ],
    cmdclass={
        'build_ext': BuildExtension
    }
)
