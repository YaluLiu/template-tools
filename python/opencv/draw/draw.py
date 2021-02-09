import cv2
import numpy as np
from PIL import Image, ImageDraw, ImageFont


def draw_text(frame, out_text, org = (50, 50)):
    # font
    font = cv2.FONT_HERSHEY_SIMPLEX
    
    # org
    org = org
    
    # fontScale
    fontScale = 1
    
    # Blue color in BGR
    color = (0, 0, 255)
    
    # Line thickness of 2 px
    thickness = 1
    
    # Using cv2.putText() method
    cv2.putText(frame, out_text, org, font,
                    fontScale, color, thickness, cv2.LINE_AA)
    return frame

def draw_rectangle(img):
    x0=y0=40
    w=h=120
    color = (255, 255, 0)
    thickness=1
    cv2.rectangle(img,(x0,y0),(x0+w,y0+h),color,thickness)

if __name__ == "__main__":
    img = cv2.imread("../../../data/test.jpg")
    draw_rectangle(img)
    draw_text(img,"beauty",(40,40))
    cv2.imwrite("res.jpg",img)
