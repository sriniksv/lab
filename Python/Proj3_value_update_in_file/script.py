def file_operations(file_path,key,value):
  with open(file_path, 'r') as file:
    lines = file.readlines()
  with open(file_path, 'w') as file:
    for line in lines:
      if key in line:
        file.write(key + "=" + value + "\n")
      else:
        file.write(line)

server_config_file = 'server.config'
key_to_update = 'MAX_CONNECTIONS'
new_value = '1000'

file_operations(server_config_file,key_to_update,new_value)