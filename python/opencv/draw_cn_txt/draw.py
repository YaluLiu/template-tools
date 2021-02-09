import cv2
import numpy as np
from PIL import Image, ImageDraw, ImageFont


def draw_cn_text(frame, out_text, org = (10, 10), textColor=(255, 0, 0), textSize=20):
    if (isinstance(frame, np.ndarray)):
        frame = Image.fromarray(cv2.cvtColor(frame, cv2.COLOR_BGR2RGB))
    # 创建一个可以在给定图像上绘图的对象
    draw = ImageDraw.Draw(frame)
    # 字体的格式
    fontStyle = ImageFont.truetype(
        "NotoSerifCJK-Regular.ttc", textSize, encoding="utf-8")
    # 绘制文本
    draw.text(org, out_text, textColor, font=fontStyle)
    # 转换回OpenCV格式
    return cv2.cvtColor(np.asarray(frame), cv2.COLOR_RGB2BGR)

if __name__ == "__main__":
    img = cv2.imread("../../../data/test.jpg")
    img = draw_cn_text(img,"刘亦菲",org=(10,10))
    cv2.imwrite("res.jpg",img)
