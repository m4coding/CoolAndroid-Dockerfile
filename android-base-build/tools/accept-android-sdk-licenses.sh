#! /usr/bin/env bash

expect -c "
set timeout -1
spawn /opt/android-sdk/tools/bin/sdkmanager --update

expect {
\"Accept? (y/N)\" {
send \"y\n\"
exp_continue
}
}
"

expect -c "
set timeout -1
spawn /opt/android-sdk/tools/bin/sdkmanager --licenses

expect {
\"Review licenses that have not been accepted (y/N)?\" {
send \"y\n\"
exp_continue
}

\"Accept? (y/N):\" {
send \"y\n\"
exp_continue
}
}
"