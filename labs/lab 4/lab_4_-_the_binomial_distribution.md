Lab 4 - The Binomial Distribution
================
Gabriel Butler, UCLA Global Classroom

### Introduction

This lab has been adapted from one given in a similar course to students
at the College of Staten Island.

<https://www.math.csi.cuny.edu/abhijit/113/rlabs/lab3.pdf>

Suppose that on a certain day in a certain large class (500 students\!)
the instructor gives a pop quiz and no one is prepared because no one
has been studying. Suppose also that everyone showed up for class that
day. (Most unrealistic assumption of all.)

This means that students taking the test have no choice but to guess
their answers randomly and independently because they don’t know what
they’re doing.

The quiz is given as a multiple choice test. There are 20 questions and
4 choices for each question.

### Your tasks

1.  Suppose that a student must answer at least 10 questions correctly
    in order to pass this quiz. What is the probability of guessing at
    least 10 answers correctly? Use R’s built-in binomial functions to
    calculate this.

2.  Use R’s built-in binomial functions to simulate test results for
    each of the 500 students in this class. Use a `seed` integer of `10`
    when you do it. How many students passed? How does the empirical
    proportion of students who passed compare to the theoretical one?

3.  Use your simulated data to make a proportion histogram of your test
    results. Color code it to indicate which bars represents students
    who passed and which ones represent students who failed.

4.  Suppose that the instructor for this class gives another pop quiz
    the following week and 80% of students pass it. Why is it highly
    unlikely that students were randomly guessing this time?
