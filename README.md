# Installation

Step 1: Place [`ngrok`](https://ngrok.com/download) in `/usr/local/bin/`.

Step 2: Get `authtoken` from ngrok website, then add it to `/etc/ngrok/ngrok.yml`.

Step 3. Modify your own configrations in `/etc/ngrok/ngrok.yml`.

Step 4: Add `ngrok.service` to `/lib/systemd/system/`.

Step 5: Start ngrok service by typing:

```
    systemctl enable ngrok.service
    systemctl start ngrok.service
```

or just execute `install.sh` on Linux x64 platform.

```
    chmod +x install.sh
    ./install.sh <your_authtoken>
```
