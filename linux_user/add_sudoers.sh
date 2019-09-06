#! /bin/bash

PATH_SUDOERS="/etc/sudoers"

ssh_write_file() {
    ssh ubuntu@$host "sudo sh -c 'echo \"$1 ALL=(ALL) NOPASSWD: ALL\" >> $PATH_SUDOERS'";
}

cat hosts | while read host; do
    echo $host
    cat users | while read user; do
        ssh_write_file $user < /dev/null;
        echo $user;
    done
done
