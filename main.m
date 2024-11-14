% Author Name: Joey Masone
% Email: masone75@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Homework 1
% Date: 9/20/24

clear; clc;
db = StudentDatabase();
db = db.addStudent(Student(1, 'Alice', 20, 3.8, 'Computer Science'));
db = db.addStudent(Student(2, 'Bob', 22, 3.5, 'Mathematics'));
db = db.addStudent(Student(3, 'Charlie', 21, 3.2, 'Engineering'));
db = db.addStudent(Student(4, 'Dana', 23, 3.7, 'Biology'));
db = db.addStudent(Student(5, 'Eve', 19, 3.9, 'Physics'));
fprintf('Student List:\n');
for i = 1:length(db.Students)
    db.Students(i).displayInfo();
end

% Save and load database
db.saveDatabase('studentDB.mat');
db = db.loadDatabase('studentDB.mat');

% Search by ID and display info
student = db.findStudentByID(2);
if ~isempty(student)
    fprintf('\nFound Student by ID 2:\n');
    student.displayInfo();
end

% Get and display students by major
fprintf('\nStudents in Computer Science:\n');
csStudents = db.getStudentsByMajor('Computer Science');
for i = 1:length(csStudents)
    csStudents(i).displayInfo();
end

figure;
db.plotGPADistribution();

figure;
db.plotAverageGPAByMajor();

figure;
db.plotAgeDistribution();