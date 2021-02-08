from flask import Flask,request,jsonify
import json
import numpy as np
import cv2

app = Flask(__name__)
app.config["global_OK"] = "OK"

@app.route('/api_send_json' , methods=['POST'])
def api_send_json():
    data = request.json
    print(json.dumps(data,indent=4))
    return jsonify(app.config["global_OK"])

@app.route('/api_send_image' , methods=['POST'])
def api_send_image():
    npimg = np.fromfile(request.files['image'], np.uint8)
    frame = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
    print(frame.shape)
    return jsonify(app.config["global_OK"])

@app.route('/api_send_multi' , methods=['POST'])
def api_send_multi():
    txt = request.files.get('document')
    message = txt.read().decode('utf-8')
    print(message)

    data = request.form.to_dict()
    print(data)
    return jsonify(app.config["global_OK"])

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=6666,threaded=True)