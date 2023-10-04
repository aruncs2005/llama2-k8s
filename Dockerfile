# Base Docker image.
FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/pytorch-training:2.0.1-gpu-py310-cu118-ubuntu20.04-ec2

RUN mkdir -p /workspace/

COPY scripts /workspace

WORKDIR /workspace

RUN pip install -r requirements.txt