CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -e student-submission/ListExamples.java ]
then    
    echo 'Exists'
else
    echo 'Could not find ListExamples.java'
    exit 
fi

cp -v student-submission/* grading-area/

javac grading-area/*.java

if [ $? -eq 0 ]
then
    echo 'Sucessfully Compiled'
else 
    echo 'Failed to Compile'
fi

rm -rf grading-area

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

#temp push

# Then, add here code to compile and run, and do any post-processing of the
# tests
