CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

#checking if list examples exists
if [ -e student-submission/ListExamples.java ]
then    
    echo 'Exists'
else
    echo 'Could not find ListExamples.java'
    exit 
fi

#copying the info from submission to grading area
cp -v student-submission/* grading-area/

#compiling the submitted stuff from student
javac grading-area/*.java

#checking if successfully compiled
if [ $? -eq 0 ]
then
    echo 'Sucessfully Compiled Student Submission'
else 
    echo 'Failed to Compile Student Submission'
fi

#compiling TestList Examples
javac TestListExamples.java



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

#temp push

# Then, add here code to compile and run, and do any post-processing of the
# tests
