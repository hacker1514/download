from os import system
from sys import argv,exit
from os.path import expanduser


K_DRIVE = expanduser("~/K_DRIVE")


if len(argv) == 1 :
	print("Error : Invalid Arguments ...!")
	print("Usage : k <arg>")
	exit()


def start():

	system(f"mkdir -p {K_DRIVE}")

	uname = input("Enter Git-Hub User Name : ")

	repo = input("Enter Git-Hub Repo Name : ")

	system(f"git clone https://github.com/{uname}/{repo}.git {K_DRIVE}")


def activate():

	system(f"cd {K_DRIVE} && bash")


def update():

	system(f"git -C {K_DRIVE} add -A")

	msg = input("Enter Your Update Message : ")

	system(f'git -C "{K_DRIVE}" commit -m "{msg}"')

	system(f"git -C {K_DRIVE} push")


def end():

	system(f"rm -rf {K_DRIVE}")


def help():

	print("+===========================================================+")
	print("|             K - Drive ( Git - Hub Cloud )                 |")
	print("+===========================================================+")
	print("| Developer : Niranjan Kumar K                              |")
	print("+===========================================================+")
	print("|Usage      : k <arg>                                       |")
	print("+===========================================================+")

	print()
	print(" arg             use")
	print(" ---             ---")
	print(" start           to start k drive with specific username and repo")
	print(" activate        to activate K drive")
	print(" update          to update all changes to repo")
	print(" end             to remove K drive connection")
	print(" help            to know usage")

	print()
	print(" Required : Git install")
	print(" Git : https://git-scm.com/install")


arg = argv[1].lower()


if arg == "start":
	start()

elif arg == "activate":
	activate()

elif arg == "end":
	end()

elif arg == "update":
	update()

elif arg == "help":
	help()

else:
	print("Error : Invalid Argument ...!")