IP_ADDRESS=$(hostname -I | cut -d " " -f 1)
python3 clientTest.py $IP_ADDRESS
