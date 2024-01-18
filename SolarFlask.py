from flask import Flask, request, jsonify, g, Response
from flask_cors import CORS
from http import HTTPStatus

app = Flask(__name__)
CORS(app) # CORS

my_ip = "172.30.1.48"

# 연동 디바이스정보, 디바이스 제어신호
dvc_link, dvc_control = [], []
control_id = 1 # 제어 아이디
result_bad_req = { 'result' : 400 }

def req_valid_check(req_data, valid_client) :
    
    client_type = req_data.get('clientType')
    req_ardu_id = req_data.get('arduId')
    # 빈값 체크 - req_data, clientType, arduId
    if bool(req_data) == False or client_type == None or req_ardu_id == None :
         return False
    elif client_type != valid_client :
        return False
    
    return True   

@app.route('/api/device/controls', methods=['POST'] )
def device_controls():
    global dvc_control
    return jsonify( dvc_control )

# ========= web_controlId 제어신호 결과값 From Flask ========= 
@app.route('/api/device/controled', methods=['POST'] )
def device_controled():
    
    req_data = request.json   
    
    if req_valid_check(req_data, 'web') == False :
        return jsonify(result_bad_req)
    
    if req_data.get('controlId') == None : # controlId 없음
        return jsonify(result_bad_req)
    
    global dvc_control
    res_data = {} # 응답 데이터

    for control in dvc_control :
        if control['controlId'] == req_data['controlId'] :
            res_data = control
            break;        

    return jsonify(res_data)

# ========= web_arduId 디바이스 제어신호 To Flask ========= 
@app.route('/api/device/control', methods=['POST'] )
def device_control():
    
    req_data = request.json    
    
    if req_valid_check(req_data, 'web') == False :
        return jsonify(result_bad_req)
    
    global dvc_control, control_id
    
    res_control_id = f"control{control_id}"
    req_data['controlId'] = res_control_id
    
    dvc_control.append(req_data)
    control_id +=1
    
    return jsonify({"controlId": res_control_id})

# =========  web_arduId 디바이스정보 요청 From Flask  =========
@app.route('/api/device/linked', methods=['GET', 'POST'] )
def device_linked():
    
    req_data = request.json
    
    if req_valid_check(req_data, 'web') == False :
        return jsonify(result_bad_req)
    
    req_ardu_id = req_data.get('arduId')
    
    global dvc_link, dvc_control
    res_data = {} # 응답할 연동 디바이스 

    for dvc in dvc_link[::-1]: # 역으로 슬라이싱
        if dvc['arduId'] == req_ardu_id : # 웹 로그인 유저의 ardu_id와 일치
            res_data = dvc
            break;
    
    return jsonify( res_data )

# ========= Ardu_디바이스 정보 To Flask =========
@app.route('/api/device/link', methods=['POST'] )
def device_link():

    req_data = request.json
    
    if req_valid_check(req_data, 'ardu') == False :
        return jsonify(result_bad_req)
    
    global dvc_link, dvc_control    
    dvc_link.append(req_data)
    
    req_ardu_id = req_data.get('arduId')
    res_control = {}
    res_control['clientType'] = 'ardu'
    
    #   제어신호 받은 경우
    if req_data.get('controlId') and req_data.get('result') :
        con_result = req_data.get('result')
        
        if con_result >= 0 and con_result <= 1 :# ardu에서 제어신호 처리함
            for i, dic in enumerate(dvc_control) :
                if dic['controlId'] == req_data.get('controlId') :
                    dic['result'] = 200
    
    else :
        for i, dic in enumerate(dvc_control) :
            if dic['arduId'] == req_ardu_id and dic['result'] < 0 :
                res_control = dic
            
    return jsonify( res_control )

@app.route('/')
def home():
    return "flask running"

if __name__ == "__main__":
    app.run(host = my_ip, port = 5000)

