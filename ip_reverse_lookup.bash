#!/bin/bash

#DNS reverse lookup script created by Mattia Campagnano on Fri Feb 7 18:10:34 EST 2020

echo -n "Please enter an IP address to check:  ";

read ip

# Ask user to indicate a series of output files, one for each command to be run

echo -n "Output file 1 -nslookup: "
read output1

echo -n "Output file 2 -dig: "
read output2

echo -n "Output file 3 - whois: "
read output3

echo -n "Output file 4 -host: "
read output4

echo 

echo -n "Enter pentester name: "

read name

today=$(date)

echo "Output of the nslookup command run on ${domain} performed by ${name} on ${today}" >> "$output1"

echo "Output of the dig command run on ${domain} performed by ${name} on ${today}" >> "$output2"

echo "Output of the whois command run on ${domain} performed by ${name} on ${today}" >> "$output3"

echo "Output of the host command run on ${domain} performed by ${name} on ${today}" >> "$output4"


nslookup $ip >> $output1 &

dig $ip>> $output2 &

whois $ip >> $output3 &


host $ip >> $output4 &


echo "All commands successfully performed. Exiting..."


