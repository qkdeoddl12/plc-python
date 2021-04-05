from pymodbus.client.sync import ModbusTcpClient



import logging
FORMAT = ('%(asctime)-15s %(threadName)-15s '
          '%(levelname)-8s %(module)-15s:%(lineno)-8s %(message)s')
logging.basicConfig(format=FORMAT)
log = logging.getLogger()
log.setLevel(logging.DEBUG)


client = ModbusTcpClient('192.168.1.20')
conResult=client.connect ()
print(conResult)
#client.write_register(2,1*8,unit=1)
log.debug(client)

client.write_coil(6, 1,unit=1)
#client.write_registers(0, [False]*15, unit=1)
#result = client.read_input_registers(0,16,unit=1)
result = client.read_coils(0,16,unit=1)

#rq = client.readwrite_registers(20, [20]*8)
#rr = client.read_input_registers(20,8)
#assert(rq.function_code < 0x80)     # test that we are not an error
#assert(rr.registers == [20]*8)  
                   
#log.debug(rq)
#log.debug(rr)
#log.debug(result)
print(result.__dict__)


# mycursor = mydb.cursor()

# sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
# val = ("YANG", "Highway 21")

# mycursor.execute(sql, val)

# mydb.commit()

# print(mycursor.rowcount, "record inserted")






client.close()