# masscan
Escanea todas las IPs de ISP de España para ver si tienen el puerto 445 abierto, mascara 16 
Se trata de un ejemplo de uso de la herramienta Masscan.
- Utilice un script que está escrito en bash 
- Las IPs de toda españa las saque de esta página Web : http://www.nirsoft.net/countryip/es.html
- El objetivo escanear la red entera de españa y comprobar si el puerto 445 estaba abierto, ya que es el puerto que contiene el servicio SMB 
- Después de detectar los puertos abiertos, se puede comprobar si es vulnerable al virus de Wannacry que ataca justamente al servicio SMB
- La comprobación se puede hacer a través de Nmap, con esta instrucción
`$ sudo nmap -p445 --script smb-vuln-ms17-010.nse -iL [archivo IPs con puerto abierto] `




Es una herramienta se utiliza para el escaneo masivo de direcciones IPs, tiene la misma función de Nmap pero optimizada para tener más velocidad de peticiones

### Instalación de la Herramienta
   `$ sudo apt-get update`
   `$ sudo apt-get install masscan`
   `$ dpkg -l | grep masscan`
        Con la última instrucción comprobamos que tenemos masscan instalado
        
### Funcionamiento
    Ayuda rápida:
     Con esta instrucción arrancamos la herramienta 
        
        `$ masscan`           
    
     Ayuda y Manual
        
        `$ masscan -h`        
        `$ man masscan`

### Archivo de configuración
    
    `$ sudo masscan  - -echo`
    Para visualizar el archivo de configuración

## Ejemplos de Escaneo
- Para realizar este ejemplo recogí las IPs en un *.csv
- Limpié los datos para quedarme con las IPs
- Hice un script que ejecutara la instrucción por cada IP y que guarda el resultado para saber los puerto 445 abiertos.

    `$ sudo masscan 192.168.0.0/24 -p 80          (Red Sencilla)`
        
        Hace un escáner a todas las direcciones IP asociadas con esta red
        
    `$ sudo masscan -v -sS 120.0.0.1-180.80.0.1 -p0-10`
    
        ***v*** se utiliza para aumentar el nivel de verbosidad
        ***120.0.0.1-180.80.0.1*** es el rango de IP utilizado en el escaneo
        ***sS*** se utiliza para hacer que TCP syn scan siempre esté activado
        ***p*** se utiliza para rangos de puerto. hemos utilizado -p0-10
        
    `$ sudo masscan -p445 120.0.0.0/24 --banners --rate 10000`
        
  
        
        
        
        
