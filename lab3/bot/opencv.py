import cv2
import numpy as np

h, w = 300, 400
H, W = 500, 500


def demotivator(filename, text):
    src = cv2.imread(filename)
    height, width = src.shape[:2]

    translation_matrix = np.array([
        [w / width, 0, 50],
        [0, h / height, 50]
    ], dtype=np.float32)

    resized = cv2.warpAffine(src=src, M=translation_matrix, dsize=(H, W))

    image = cv2.rectangle(resized, (40, 40), (H - 40, W - 40), (255, 255, 255), 2)

    image = cv2.putText(image, text, (50, 410), cv2.FONT_HERSHEY_COMPLEX,
                        1, (255, 255, 255), 2, cv2.LINE_AA)

    cv2.imwrite(filename, image)

    return filename
