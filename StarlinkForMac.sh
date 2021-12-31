#!/bin/bash

echo -n -e "\033]0;StarlinkWebTerminal\007"

if ping -o -t 5 192.168.100.1 # Ping the starlink we interface
then
# Run a python script that open the browser and goes to starling webinterface
/usr/bin/env python3 <<-EOF
import webbrowser
webbrowser.open("http://192.168.100.1")
EOF

else
# Show Pop up that connection to the starlink webinterface was unsuccesful
/usr/bin/osascript <<-EOF
tell application "System Events"
    activate
    display dialog "No Starlink devices found at 192.168.100.1"
end tell
EOF
fi

# Close the terminal window for cleanup
osascript -e 'tell application "Terminal" to close (every window whose name contains "StarlinkWebTerminal")' & exit