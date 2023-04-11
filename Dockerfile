# FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
FROM pytorch/pytorch:latest
WORKDIR /app
RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip -y
RUN apt-get install python3-pip -y
# Copy requirements
COPY requirements_inference.txt .
RUN python3 -m pip install -r requirements_inference.txt --no-cache-dir
# RUN python3 -m pip install opencv-python
# RUN python3 -m pip install onnxruntime
# RUN apt-get install libgl1-mesa-glx -y
# RUN python3 -m pip install av==8.0.3
RUN python3 -m pip install av --no-binary av==8.0.3
RUN python3 -m pip install pims
# RUN python3 -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu117
# RUN python3 -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu118
# RUN python3 -m pip install https://download.pytorch.org/whl/cu118/torch-2.0.0%2Bcu118-cp38-cp38-linux_x86_64.whl
# COPY torch-2.0.0+cu118-cp38-cp38-linux_x86_64.whl .
# RUN python3 -m pip install torch-2.0.0+cu118-cp38-cp38-linux_x86_64.whl
# CMD ["python3", "inference_images.py", "--images-src", "/app/data/images_src/", "--images-bgr", "/app/data/images_bgr/", "--output-dir", "/app/data/images_dst/", "--model-type", "mattingbase", "--model-backbone", "resnet101", "--model-checkpoint", "/app/data/models/PyTorch/pytorch_resnet101.pth", "--output-types", "com", "pha", "fgr", "err", "--device", "cuda"]
# CMD ["python3", "inference.py", "--variant resnet50", "--checkpoint rvm_resnet50.pth", "--device cuda", "--input-source input.mp4", "--output-type video", "--output-composition composition.mp4", "--output-alpha alpha.mp4", "--output-foreground foreground.mp4", "--output-video-mbps 4", "--seq-chunk 1"]
# CMD ['python', 'inference.py']
CMD ["python", "inference.py", \
    "--variant", "resnet50", \
    "--checkpoint", "rvm_resnet50.pth", \
    "--device", "cuda", \
    "--input-source", "input.mp4", \
    "--output-type", "video", \
    "--output-composition", "composition.mp4", \
    "--output-alpha", "alpha.mp4", \
    "--output-foreground", "foreground.mp4", \
    "--output-video-mbps", "4", \
    "--seq-chunk", "1"]
# nvidia-smi
# CMD ["nvidia-smi"]
# infinity loop
# CMD tail -f /dev/null