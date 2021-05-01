#!/bin/bash
#Assignment: Linux Lab 08
#Student Name: Wentao Lu
#Student Number: 040991469
#Name of the script file: myscript.sh
#Date of Submission: Apr 05, 2021
#Description: This program will show a menu to user and ask user to input a letter, then the
#program will do the corresponding instruction.

# when the input is not Q or q, the program will loop again and again.
while [ "$input_letter" != "Q" ] && [ "$input_letter" != "q" ]; do
    echo ""
    # showing the menu
    echo -n "Choose one of the following options:   
A Create a user accunt
B Delete a user accoount
C Change supplementary group for a user account
D Change initial group for a user account
E Change default login shell for a user account
F Change account expiration date for a user account
Q Quit
What would you like to do?: "

    # the program will read the input
    read input_letter
    echo "You Entered $input_letter"
    sleep 3

    # clear the screen before showing the next instructions
    clear

    # The program will respond according to different input as follows:
    case $input_letter in
    #if user type A, the system will prompt for information to create a new user
    [Aa])
        echo -n "Create a user name: "
        read user_name
        echo -n "Enter the home directory: "
        read homd_directory
        echo -n "Default login shell: "
        read user_login_shell
        sudo useradd -m -d $homd_directory -s $user_login_shell $user_name
        ;;
        #if user type B, the system will prompt for information to delete a new user

    [Bb])
        echo -n "Input the user you want to delete: "
        read user_to_delete
        sudo userdel -r $user_to_delete
        ;;
        #if user type C, the system will change supplementary group for a user account
    [Cc])
        echo -n "Enter the user name: "
        read user_selection
        echo -n "Enter the group name: "
        read group_selection
        sudo usermod -a -G $group_selection $user_selection
        ;;
        #Change initial group for a user account
    [Dd])
        echo -n "Enter the user name: "
        read user_selection
        echo -n "Enter the initial group name: "
        read initial_group_selection
        sudo usermod -g $initial_group_selection $user_selection
        ;;
        #Change default login shell for a user account
    [Ee])
        echo -n "Enter the user name: "
        read user_name
        echo -n "Enter the login shell: "
        read user_login_shell
        sudo usermod --shell $user_login_shell $user_name
        ;;
        #Change account expiration date for a user account
    [Ff])
        echo -n "Enter the user name: "
        read user_name
        echo -n "Set the expiration date: "
        read expiration_date
        chage -E read $expiration_date $user_name
        ;;
    esac
done

