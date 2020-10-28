import microgear.client as microgear
import logging
import time
import RPi.GPIO as GPIO
import requests
import time


GPIO.setmode(GPIO.BCM)
GPIO.cleanup()
GPIO.setwarnings(False)
GPIO.setup(17,GPIO.OUT)
GPIO.setup(27,GPIO.OUT)
GPIO.setup(6,GPIO.IN)
appid = "CET114"
gearkey = "wlHmAOsYUhoV6ux"
gearsecret = "Rhz7jiVjz7zJBU072Lxqw3P2E"

microgear.create(gearkey,gearsecret,appid,{'debugmode': True})

def connection():
    logging.info("Now I am connected with netpie")

def subscription(topic,message):
 logging.info(topic+" : "+message)

 msg = str(message)[2:-1]
    #print(msg)
print("ยินดีต้อนรับ")
loop = 'true'
while(loop == 'true'):  # ทำการ ใช้ while เพื่อ ลูปหา username password ในระบบ
    username = input("Enter User: ")
    password = input("Enter Pass: ")
    if(username == "admin" and password == "1234"):
        print ('ล็อกอินสำเร็จ' + username)
        loop = 'false'              #เมื่อลูปเจอ username password ในระบบแล้ว จะเปลี่ยนตัวแปล loop = 'false' เพื่อ ออกจากลูป
        loop1 = 'true'
while(loop1 == 'true'): #ทำการใช้ while อีกครั้งเพื่ออกจากระบบ
     i = GPIO.input(6)
     print(i)
     if(i == 1):
        GPIO.output(17, GPIO.HIGH)
        GPIO.output(27, GPIO.HIGH)
        url = 'https://notify-api.line.me/api/notify'
        token = 'ixkbLXb2oMQlveImh1TUGuAigcujLo69fBv62h5KGlF'
        headers = {'content-type':'application/x-www-form-urlencoded','Authorization':'Bearer '+token}

        msg = 'Detected'
        r = requests.post(url, headers=headers, data = {'message':msg})

        print(r.text)
        time.sleep(10)
        print("LED OFF")
        print(message)


def disconnect():
    logging.info("disconnected")
