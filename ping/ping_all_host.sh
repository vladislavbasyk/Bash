cat all_host | while read ip; do ping -c1 $ip; done
