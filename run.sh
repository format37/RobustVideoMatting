# clear
# run with name bgmatting
# sudo docker run -it --rm -v /home/alex/projects/BackgroundMattingV2:/app --gpus all --name bgmatting bgmatting
sudo docker run -it --rm -v /home/alex/projects/RobustVideoMatting:/app --gpus '"device=1"' --name rvmatting rvmatting