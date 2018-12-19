#!/bin/bash
#legger til watermark i (width-35px) x (height-30px)
#watermark er ca 200px
ffmpeg -i $1 -i ../Pictures/logo.png -filter_complex overlay=x=(main_w-35-overlay_w):y=(main_h-30-overlay_h) $1_watermark.mp4
