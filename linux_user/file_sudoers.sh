#! /bin/bash

ssh_write_file() {
    ssh ubuntu@$host "sudo sh -c 'echo \"$1 ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/$2'";
}

cat hosts | while read host; do
    echo $host
    cat users | while read user; do
        ssh_write_file $user < /dev/null;
        echo $user;
        cat file_name | while read $file_name; do
            echo $file_name;
        done
    done
done
