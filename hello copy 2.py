from pymodbus.client.sync import ModbusTcpClient
import schedule
import time



import logging
FORMAT = ('%(asctime)-15s %(threadName)-15s '
          '%(levelname)-8s %(module)-15s:%(lineno)-8s %(message)s')
logging.basicConfig(format=FORMAT)
log = logging.getLogger()

def getPLCdata(ip,startAddr):
    
    client = ModbusTcpClient(ip)
    conResult=client.connect ()
    result = client.read_coils(startAddr*16,16,unit=1)

    print(result.__dict__)

    data=0

    for idx, val in enumerate(result.bits):

        data+=int(val)*(2**idx)

    client.close()
    return data




while True:
    test=getPLCdata('192.168.1.20',)
    print(test)
    time.sleep(1)

    