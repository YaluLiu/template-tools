import requests
import numpy as np 
import cv2
import json

class Client():
    def __init__(self,host,port):
        self.server = "http://{}:{}".format(host,port)
        self.image_path = "../../../data/test.jpg"
        self.api_image = "{}/{}".format(self.server,"api_send_image")
        self.api_json = "{}/{}".format(self.server,"api_send_json")
        self.api_multi = "{}/{}".format(self.server,"api_send_multi")
    
    def send_cv_image(self):
        img = cv2.imread(self.image_path)
        frame_encoded = cv2.imencode(".jpg", img)[1]
        files = {'image': frame_encoded.tobytes()}
        requests.post(self.api_image,files=files)

    def send_json(self):
        data = {"name":"moon","age":16}
        requests.post(self.api_json,json=data)
    
    # if send file and json in the same, only by this way
    def send_multi(self):
        local_file_to_send = "../../../data/log.txt"
        info = {"name":"moon","age":16}
        files = {'document': open(local_file_to_send, 'rb')}
        requests.post(self.api_multi,files=files,data=info)

if __name__ == "__main__":
    host = 'localhost'
    port = '6666'
    client = Client(host,port)
    client.send_json()
    client.send_cv_image()
    client.send_multi()