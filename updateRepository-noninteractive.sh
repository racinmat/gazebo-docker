#!/usr/bin/expect -f
spawn ~/ros_workspace/src/mbzirc/updateRepository.sh
expect "mbzirc@mrsl.grasp.upenn.edu's password: "
send [exec cat /root/rsync_pass]
send -- "\r"
expect eof