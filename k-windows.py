from os import system, path
from sys import argv, exit


K_DRIVE = r"C:\K_DRIVE"


if len(argv) == 1:
    print("Error : Invalid Arguments ...!")
    print("Usage : k <arg>")
    exit()


def start():

    if path.exists(K_DRIVE):
        print("K Drive already exists ...!")
        return

    system(f'mkdir "{K_DRIVE}"')

    uname = input("Enter Git-Hub User Name : ")

    repo = input("Enter Git-Hub Repo Name : ")

    system(
        f'git clone https://github.com/{uname}/{repo}.git "{K_DRIVE}"'
    )

    system(
        f'subst K: "{K_DRIVE}"'
    )

    print("K Drive Started Successfully !")


def activate():

    system("start cmd /k cd /d K:\\")


def update():

    system(f'git -C "{K_DRIVE}" add -A')

    msg = input("Enter Your Update Message : ")

    system(
        f'git -C "{K_DRIVE}" commit -m "{msg}"'
    )

    system(
        f'git -C "{K_DRIVE}" push'
    )

    print("Updated Successfully !")


def end():

    system("subst K: /D")

    system(
        f'rmdir /S /Q "{K_DRIVE}"'
    )

    print("K Drive Removed Successfully !")


def help():

    print("+===========================================================+")
    print("|             K - Drive ( Git - Hub Cloud )                 |")
    print("+===========================================================+")
    print("| Developer : Niranjan Kumar K                              |")
    print("+===========================================================+")
    print("| Usage     : k <arg>                                       |")
    print("+===========================================================+")

    print()

    print(" arg             use")
    print(" ---             ---")
    print(" start           start K Drive with GitHub repository")
    print(" activate        activate K Drive")
    print(" update          push all changes to GitHub")
    print(" end             remove K Drive")
    print(" help            show help")

    print()

    print(" Note        : Public repository recommended")
    print(" Required    : Git installation")
    print(" Git install : https://git-scm.com/install")


arg = argv[1].lower()


if arg == "start":
    start()

elif arg == "activate":
    activate()

elif arg == "update":
    update()

elif arg == "end":
    end()

elif arg == "help":
    help()

else:
    print("Error : Invalid Argument ...!")
