# /user/bin/env pythin3
##################################################################################
#                           Author: Abdellah Oulahyane                           #
#   File Name: /home/user/Desktop/project/Linux Server Config/server_config.py   #
#                    Creation Date: October 24, 2021 03:34 PM                    #
#                    Last Updated: October 24, 2021 03:34 PM                     #
#                            Source Language: python                             #
##################################################################################


import sys
import os
if os.getuid() != 0:
    print("You are not root")
    print("usage: sudo "+sys.argv[0]+" example.com")
    exit(1)
if(len(sys.argv) < 2):
    print("usage: sudo "+sys.argv[0]+" example.com")
    exit(-1)
#HTML_PATH       = "/var/www/html"
FILE_PATH = "/etc/apache2/sites-available/"
HOSTS_PATH = "/etc/hosts"
HOST_NAME = sys.argv[1]
SEREVER_ADMIN = "admin@webserver2.com"
SERVER_ALIAS = HOST_NAME if HOST_NAME.startswith("www.") else "www."+HOST_NAME
DOCUMENT_ROOT = "/var/www/"+HOST_NAME+"/public_html"
VIRTUAL_HOST = """<VirtualHost *:80>
                     ServerAdmin   %s 
                     ServerName    %s
                     ServerAlias   %s 
                     DocumentRoot  %s 
                     ErrorLog ${APACHE_LOG_DIR}/error.log
	             CustomLog ${APACHE_LOG_DIR}/access.log combined
                  </VirtualHost> 
                """ % (SEREVER_ADMIN, HOST_NAME, SERVER_ALIAS, DOCUMENT_ROOT)
APACHE_CONFIG_PATH = "/etc/apache2/sites-available"
print("Step 1",end=" ")
os.system("echo 127.0.0.1\t\t"+HOST_NAME+" >> "+HOSTS_PATH)
print(" Done")
print("Step 2",end=" ")
if os.path.isfile(APACHE_CONFIG_PATH+"/"+HOST_NAME+".conf"):
    os.system("rm "+APACHE_CONFIG_PATH+"/"+HOST_NAME+".conf")
os.system("touch "+APACHE_CONFIG_PATH+"/"+HOST_NAME+".conf")
print(" Done")
print("Step 3",end=" ")
os.system("echo  '"+VIRTUAL_HOST+"' >> " +
          APACHE_CONFIG_PATH+"/"+HOST_NAME+".conf")
print(" Done")
print("Step 4",end=" ")
if not os.path.isdir("/var/www/"+HOST_NAME):
    os.system("mkdir /var/www/"+HOST_NAME)
if not os.path.isdir("/var/www/"+HOST_NAME+"/public_html"):
    os.system("mkdir /var/www/"+HOST_NAME+"/public_html")
print(" Done")
print("Step 5",end=" ")
os.system("a2ensite "+HOST_NAME+".conf")
os.system("service apache2 restart")
print(" Done")
