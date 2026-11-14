### dev-session.sh
- Navigate to the directory below
```bash
# Local binaries store here
~/.local/bin/dev-session.sh
```
- After pasting the code, do the following
```
chmod +x ~/.local/bin/dev-session.sh
echo 'alias lab="~/.local/bin/dev-session.sh"' >> ~/.zshrc
source ~/.zshrc
```
### script.sh
Add into .zshrc
----------------------------------------------------------

Generic Monitor
Create two, one for $IP (Victim) one for $PI (Attacker)

Victim: Point to thsi path
- Wherever the hud.sh script is stored

Attacker: Point to this path for command
- /home/$USER/Scripts/vpnIP_VM.sh