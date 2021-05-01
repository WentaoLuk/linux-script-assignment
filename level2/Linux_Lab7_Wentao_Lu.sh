#!/bin/bash
#Student Name: Wentao Lu
#Student Number: 040991469
#Course: Operating System Fund
#CourseID: CST8102_320
#This script is to calculate the final grade and display the letter grade for a course. User will need to enter integers for input.

# -n : not to append a new line
# prompt the user for all the required marks
echo -n "Enter Assignment mark (0 - 40): "
read assignment_mark
echo -n "Enter Test 1 mark (0 - 15): "
read test1_mark
echo -n "Enter Test 2 mark (0 - 15): "
read test2_mark
echo -n "Enter Final exam mark (0 - 30): "
read final_mark

#The student_final_mark is to calculate and store the numeric grade.
student_final_mark=$[$assignment_mark + $test1_mark + $test2_mark + $final_mark]

# the statement will decide what letter grade to be assigned to the the student
if [ $student_final_mark -ge 90 ]
then
        final_grade="A+"
elif [ $student_final_mark -ge 85 ]
then
        final_grade="A"
elif [ $student_final_mark -ge 80 ]
then
        final_grade="A-"
elif [ $student_final_mark -ge 77 ]
then
        final_grade="B+"
elif [ $student_final_mark -ge 73 ]
then
        final_grade="B"
elif [ $student_final_mark -ge 70 ]
then
        final_grade="B-"
elif [ $student_final_mark -ge 67 ]
then
        final_grade="C+"
elif [ $student_final_mark -ge 63 ]
then
        final_grade="C"
elif [ $student_final_mark -ge 60 ]
then
        final_grade="C-"
elif [ $student_final_mark -ge 57 ]
then
        final_grade="D+"
elif [ $student_final_mark -ge 53 ]
then
        final_grade="D"
elif [ $student_final_mark -ge 50 ]
then
        final_grade="D-"
else
        final_grade="F"
fi

# output the student's grade
echo "Your final numeric grade is $student_final_mark, and your final letter grade is $final_grade"


