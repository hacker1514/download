from os import system

from sys import argv,exit

if len(argv) == 1 :
	print("Error : Invalide Arguments ...!")
	print("Usage : k <arg>")
	exit()

def start():
	system(r"mkdir C:\K_DRIVE")

	uname = input("Enter Git-Hub User Name : ")

	repo  = input("Enter Git-Hub Repo Name : ")
	
	system(f"git clone https://github.com/{uname}/{repo}.git C:\\K_DRIVE")

	system(r"subst K: C:\K_DRIVE")

def activate():
	system("start cmd /k cd /d K:\\")

def update():
	system(r"git -C  'C:\K_DRIVE' add -A ")
	msg = input("Enter Your Update Message : ")
	system(rf"git -C 'C:\K_DRIVE' commit -m '{msg}'")
	system(r"git -C 'C:\K_DRIVE' push ")

def end():
	system("subst K: /D")
	system(r"rmdir /S /Q C:\K_DRIVE")

def help():
	print("+===========================================================+")
	print("|             K - Drive ( Git - Hub Cloud )                 |")
	print("+===========================================================+")
	print("| Developer : Niranjan Kuamr K                              |")
	print("+===========================================================+")
	print("|Usage      : k <arg>                                       |")
	print("+===========================================================+")
	print()
	print(" arg             use")
	print(" ---             ---")
	print(" start           to starting k drive with specific username and repo")
	print(" activate        to activating K - Drive")
	print(" update          to updating all changes to repo")
	print(" end             to exiting from K drive and removing connection to repo ")
	print(" help            to knowing what it is and how to use ")
	print()
	print(" Note        :    Public Repo is recommended for avoiding authentication")
	print(" Required    :    Git install")
	print(" git install :    https://git-scm.com/install")

arg = argv[1].lower()

if arg == "start":
	start()
elif arg == "activate":
	activate();
elif arg == "end" :
	end()
elif arg == "update":
	update()
elif arg == "help":
	help()
else :
	print("Error : Invalide Argument ...!")