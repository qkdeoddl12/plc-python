from pymodbus.client.sync import ModbusTcpClient
import schedule
import time
import mysql.connector
import logging

mydb = mysql.connector.connect(
    host = "192.168.21.9",
    user = "root", 
    password = "fmbdb12#$",
    database = "plc"
)

port_list=[
    {'addr':'1101','name':'수평운전'},
    {'addr':'1103','name':'오른쪽기움운전'},
    {'addr':'1105','name':'왼쪽기움운전'},
    {'addr':'1108','name':'Rotation속도현재값'},
    {'addr':'1110','name':'Shaking속도현재값'},
    {'addr':'1111','name':'운전모드'},
    {'addr':'1112','name':'자동운전'},
    {'addr':'1113','name':'경보1'},
    {'addr':'1114','name':'경보2'},
    {'addr':'1115','name':'경보3'},
]

mycursor = mydb.cursor()


FORMAT = ('%(asctime)-15s %(threadName)-15s '
'%(levelname)-8s %(module)-15s:%(lineno)-8s %(message)s')
logging.basicConfig(format=FORMAT)
log = logging.getLogger()

mycursor.execute('select mIDX, machine_name, machine_ip from server_info ')
plc_list=mycursor.fetchall()
#mycursor.close()



#print(plc_list)
#PLC 데이터 가져오기(PLC 모듈 IP,주소)
def getPLCdata(ip,startAddr):
    try:
        client = ModbusTcpClient(ip)
        conResult=client.connect ()
        #result = client.read_coils(startAddr*16,32,unit=1)
        result = client.read_holding_registers(startAddr,1,unit=1)

        #print(startAddr*16)
        #log.debug(result)

        #print(result.registers)

        data=result.registers[0]
        client.close()
        return data
    except :
         print("error입니다.")
         return 'error'

while True:
    for plc_data in plc_list: 
        print(plc_data)
        for port_data in port_list:
            mycursor = mydb.cursor()
            print(port_data['addr'])
            result=getPLCdata(plc_data[2],int(port_data['addr']))
            if result!=0 :
                if result!='error' :
                        sql = "INSERT INTO plc_log (createTime, code_value,code_name,address,unit_id) VALUES (substring(date_format(now(6),'%y%m%d%H%i%s%f'),1,14), '"+str(result)+"','"+str(port_data['name'])+"','"+str(port_data['addr'])+"','"+str(plc_data[0])+"')"
                elif result=='error' :
                        sql = "INSERT INTO plc_log (createTime, code_value,code_name,unit_id) VALUES (substring(date_format(now(6),'%y%m%d%H%i%s%f'),1,14), 'error','connection_fail','"+str(plc_data[0])+"')"
            else :
                continue
            print(sql)
            mycursor.execute(sql)
            mydb.commit()
            mycursor.close()
            print(mycursor, "record inserted")
    time.sleep(3)
   
    



    
    
 