#!/bin/bash
#Assignment: Linux Lab 09
#Student Name: Wentao Lu
#Student Number: 040991469
#Lab Section: 323
#Name of the script file: mycalc.sh
#Date of Submission: Apr 05, 2021
#Description: This program provides a calculator to add or subtract two numbers.

auto_calculator() {
    clear
    let result=$1$2$3
    case "$2" in
    "+")
        operator_name="plus"
        ;;
    "-")
        operator_name="minus"
        ;;
    esac

    # the $1 and $3 are the two numbers, the $2 is the "+" or "-"
    # the result will be a number, and be transferd to the echo statement below.
    echo "The result of $1 $operator_name $3 is $result"
    # the $4 is the operator "and" or "minus" imported as argument.
}

# This function is to guide the user to accomplish the calculation.
# It will show the menu to prompt user for the number or the operator.
# During any phase of the function, the user can always input "x"or "X" to exit the program.
calculation_menu1() {
    clear
    echo -n "C) Calculation
X) Exit "
    read choice
    echo $choice

    if [ "$choice" = "C" ] || [ "$choice" = "c" ]; then
        menu2
    elif [ "$choice" = "X" ] || [ "$choice" = "x" ]; then
        exit
    else
        calculation_menu1
    fi
}

menu2() {

    clear
    echo -n "Please enter an integer number or X to exit: "
    read first_number
    if [ "$first_number" = "X" ] || [ "$first_number" = "x" ]; then
        exit
    fi
    menu3

}

menu3() {
    clear
    echo "+) Add
- ) Subtract
X) Exit"
    read operator
    if [ "$operator" = "X" ] || [ "$operator" = "x" ]; then
        exit
    elif [ "$operator" = "+" ] || [ "$operator" = "-" ]; then
        menu4
    else
        menu3
    fi
}

menu4() {

    clear
    echo -n "Please enter an integer number or X to exit: "
    read second_number
    if [ "$second_number" = "X" ] || [ "$second_number" = "x" ]; then
        exit
    fi
    auto_calculator $first_number $operator $second_number
}

# this if statement will validate the input arguments. if there are 3 arguments, it will validate if the operator is valid.
# if the operator is valid, the program will call auto_calculator function.
# otherwise, it will call calculation_menu1 function to guide the user to complete the calculation.
if [[ $# -eq 3 ]]; then

    case "$2" in
    "+" | "-")
        auto_calculator $1 $2 $3
        ;;
    *)
        calculation_menu1
        ;;
    esac
    # import all the parameter into this function.
else
    calculation_menu1
fi
