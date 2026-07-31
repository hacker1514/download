# K-Drive
## GitHub Cloud Virtual Drive

```
+===========================================================+
|             K - Drive ( Git - Hub Cloud )                 |
+===========================================================+
| Developer : Niranjan Kumar K                              |
+===========================================================+
```

## Overview

K-Drive is a lightweight command-line tool that creates a virtual drive using a GitHub repository.

It allows users to work with a GitHub repository like a normal local drive.

The idea:

```
              GitHub Repository
                      |
                      |
                 git clone/push
                      |
                      |
              C:\K_DRIVE Folder
                      |
                      |
                Virtual Drive
                      |
                      |
                     K:\
```

Users can create, edit, delete, and manage files inside `K:\` and synchronize all changes with GitHub.

---

# Features

- Create a virtual `K:` drive
- Connect a GitHub repository
- Clone GitHub repositories automatically
- Work with files normally using Windows tools
- Update changes to GitHub
- Remove virtual drive safely
- Simple command-line interface
- Lightweight Python implementation

---

# Requirements

## Required

- Windows Operating System
- Python 3.x (development only)
- Git

Install Git:

```
https://git-scm.com/install
```

Check Git installation:

```bash
git --version
```

Example:

```
git version 2.x.x
```

---

# Installation

Clone the repository:

```bash
git clone https://github.com/<username>/k-drive.git
```

Move into the directory:

```bash
cd k-drive
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run:

```bash
python k.py help
```

---

# Usage

Command format:

```bash
k <argument>
```

Available commands:

```
start
activate
update
end
help
```

---

# Commands

## 1. Start K-Drive

Command:

```bash
k start
```

This will:

1. Create local storage:

```
C:\K_DRIVE
```

2. Ask GitHub details:

```
Enter Git-Hub User Name :
Enter Git-Hub Repo Name :
```

3. Clone repository:

```
https://github.com/user/repository.git
```

4. Create virtual drive:

```
K:\
```

Example:

```
K:\
│
├── project files
├── source code
└── documents
```

---

# 2. Activate K-Drive

Command:

```bash
k activate
```

Opens a command prompt inside:

```
K:\
```

Example:

```
K:\>
```

Now users can work normally:

```cmd
dir

mkdir test

notepad file.txt
```

---

# 3. Update K-Drive

Command:

```bash
k update
```

This synchronizes local changes with GitHub.

Internally it performs:

```bash
git add -A

git commit -m "your message"

git push
```

Example:

```
Enter Your Update Message:

Added new files
```

After completion:

```
Local Drive
      |
      |
      v
   GitHub Repository
```

---

# 4. End K-Drive

Command:

```bash
k end
```

This will:

- Remove virtual drive connection
- Delete local repository copy

Process:

```
K:  --> Removed

C:\K_DRIVE --> Deleted
```

---

# 5. Help

Command:

```bash
k help
```

Displays:

```
+===========================================================+
|             K - Drive ( Git - Hub Cloud )                 |
+===========================================================+
| Developer : Niranjan Kumar K                              |
+===========================================================+

Usage:

k <arg>


Arguments:

start       Start K-Drive with GitHub repository

activate    Open command prompt inside K drive

update      Push all changes to GitHub

end         Remove K drive and local connection

help        Show help information


Required:

Git installation

https://git-scm.com/install
```

---

# GitHub Repository Support

K-Drive supports:

## Public Repository

Recommended.

Example:

```
https://github.com/user/project.git
```

No authentication required.

---

## Private Repository

Supported through normal Git authentication.

Required:

- Git Credential Manager
- Personal Access Token
- SSH Authentication

---

# Project Structure

```
k-drive
│
├── k.py
├── README.md
├── requirements.txt
│
└── .github
    └── workflows
        └── build.yml
```

---

# Build Executable

Install PyInstaller:

```bash
pip install pyinstaller
```

Build:

```bash
pyinstaller --onefile k.py
```

Output:

```
dist/
 |
 └── k.exe
```

Run:

```cmd
k.exe help
```

---

# GitHub Actions Build

K-Drive can automatically build executables for:

- Windows
- Linux
- macOS

using GitHub Actions.

Generated files:

```
Windows:
    k.exe

Linux:
    k

macOS:
    k
```

---

# Technology Used

- Python
- Git
- GitHub
- Windows subst command
- PyInstaller
- GitHub Actions

---

# Future Improvements

- Linux virtual drive support
- macOS support
- Automatic Git installation
- GitHub repository creation
- Private repository login helper
- Encryption support
- GUI application
- Cloud storage providers

---

# Developer

## Niranjan Kumar K

Project:

```
K-Drive
```

Description:

```
A simple bridge between GitHub repositories
and local virtual filesystem.
```

---

# License

This project is open source.

Use, modify, and improve freely according to the project license.

# 🔑 Creating a GitHub Personal Access Token (Classic)

"K Drive" uses a GitHub Personal Access Token (Classic) to securely access your GitHub repositories.

«GitHub no longer allows account passwords for Git operations.
You must use a Personal Access Token instead.»

---

🚀 Step 1 — Open GitHub

Sign in to your GitHub account and navigate to:

Profile → Settings → Developer settings → Personal access tokens → Tokens (classic)

---

✨ Step 2 — Generate a New Token

Click:

Generate new token (classic)

---

⚙️ Step 3 — Configure the Token

Fill in the following:

- Note: "K Drive"
- Expiration: Choose your preferred expiration date.
- Scopes: ✅ Check repo

The repo scope gives K Drive permission to read and write to all of your repositories.

---

📋 Step 4 — Generate & Copy

Click Generate token.

«⚠️ Important: GitHub will display the token only once. Copy it immediately and keep it somewhere safe.»

---

💻 During K Drive Setup

When prompted, enter:

GitHub Username : your_username
GitHub Personal Access Token : ghp_xxxxxxxxxxxxxxxxxxxxxxxxx

---

🔒 Security Tips

- ✅ Keep your token private.
- ✅ Never share it with anyone.
- ✅ Never upload it to GitHub or include it in screenshots.
- ✅ If you think it has been exposed, revoke it immediately and generate a new one.

---

🎉 You're Ready!

Once your token is configured, K Drive can automatically:

- 📥 Clone repositories
- 📤 Push changes
- 🔄 Pull updates

without asking for your GitHub credentials every time.

