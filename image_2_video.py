from moviepy.editor import *

# Replace 'input_image.png' with the path to your image file
image_path = 'input_image.png'

# Set the duration of the video in seconds
duration = 5  # 5 seconds

# Replace 'output_video.mp4' with the desired output video filename
output_path = 'output_video.mp4'

# Load the image as a clip
image_clip = ImageClip(image_path, duration=duration)

# Write the clip to an MP4 video file
image_clip.write_videofile(output_path, fps=24, codec='libx264')
