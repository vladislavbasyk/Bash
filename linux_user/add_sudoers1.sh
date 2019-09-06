#! /bin/bash

PATH_SUDOERS="/etc/sudoers"

ssh_write_file() {
    cat hosts | while read host; do
        echo $host
        ssh ubuntu@$host "sudo sh -c 'echo \"$1 ALL=(ALL) NOPASSWD: ALL\" >> $PATH_SUDOERS'";
    done
}

cat users | while read user; do
    ssh_write_file $user < /dev/null;
    echo $user;
done


