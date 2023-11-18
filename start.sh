mkdir ~/.vnc
x11vnc -storepasswd 1234 ~/.vnc/passwd
x11vnc -forever -usepw -create &

python main.py