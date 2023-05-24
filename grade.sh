CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

#checking if list examples exists
fileexist=`find student-submission -name ListExamples.java`
echo $fileexist

if [[ "$fileexist" =~ "ListExamples.java" ]];
then    
    echo 'Exists'
else
    echo 'Could not find ListExamples.java'
    exit 1
fi

#copying the info from submission to grading area
mv $fileexist grading-area/

#compiling the submitted stuff from student
javac $(find grading-area/ -name "*.java")


#checking if successfully compiled
if [ $? -eq 0 ]
then
    echo 'Sucessfully Compiled Student Submission'
else 
    echo 'Failed to Compile Student Submission'
    exit 1
fi


cp *.java grading-area/
cp lib/* grading-area/

#compiling TestList Examples 
javac -classpath grading-area/\* grading-area/*.java

cd grading-area
java -cp ".;junit-4.13.2.jar;hamcrest-core-1.3.jar;grading-area/*.java" org.junit.runner.JUnitCore TestListExamples > temp.txt


if [ "" = "`grep "FAILURES" temp.txt`" ]
then 
    echo 'Passed Tests in TestListExample'
    exit 0
else 
    echo 'Failed Tests for TestListExample'
    exit 1
fi






# Draw a picture/take notes on the directory structure that's set up after
# getting to this point


# Then, add here code to compile and run, and do any post-processing of the
# tests
