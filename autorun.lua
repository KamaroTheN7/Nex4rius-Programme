os.execute("wget -f 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/autorun.lua' autorun.lua")
print("\n")
os.execute("wget -f 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/control.lua' control.lua")
print("\n")
os.execute("wget -f 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/compat.lua' compat.lua")
print("\n")
os.execute("wget -f 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/config.lua' config.lua")
print("\n")
os.execute("wget -f 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/reset.lua' reset.lua")
print("\n")
os.execute("wget 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/addresses.lua' addresses.lua")
print("\n")
os.execute("wget 'https://raw.githubusercontent.com/DarknessShadow/Stargate-Programm/master/saveAfterReboot.lua' saveAfterReboot.lua")
f = io.open ("addresses.lua", "r")
readAddresses = f:read(10000)
AdressesLength = string.len(readAddresses)
f:close ()
if string.sub(readAddresses, AdressesLength, AdressesLength) == " " then
  f = io.open ("addresses.lua", "a")
  f:seek ("end", -1)
  f:write("")
  f:close ()
end
dofile("control.lua")
