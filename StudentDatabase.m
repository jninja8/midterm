classdef StudentDatabase
    properties
        Students % Array of Student objects
    end
   
    methods
        % Constructor
        function obj = StudentDatabase()
            obj.Students = [];
        end
       
        % Add a new student
        function obj = addStudent(obj, student)
            obj.Students = [obj.Students; student];
        end
       
        % Find student by ID
        function student = findStudentByID(obj, id)
            student = [];
            for i = 1:length(obj.Students)
                if obj.Students(i).ID == id
                    student = obj.Students(i);
                    return;
                end
            end
        end
       
        % List of students by major
        function studentsByMajor = getStudentsByMajor(obj, major)
            studentsByMajor = obj.Students(strcmp({obj.Students.Major}, major));
        end
       
        % Save database to .mat file
        function saveDatabase(obj, filename)
            students = obj.Students; %#ok<NASGU>
            save(filename, 'students');
        end
       
        function obj = loadDatabase(obj, filename)
            data = load(filename);
            obj.Students = data.students;
        end
       
        % GPA Distribution
        function plotGPADistribution(obj)
            gpas = [obj.Students.GPA];
            histogram(gpas);
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of Students');
        end
       
        % Average GPA by Major
        function plotAverageGPAByMajor(obj)
            majors = unique({obj.Students.Major});
            avgGPAs = zeros(size(majors));
           
            for i = 1:length(majors)
                major = majors{i};
                majorGPAs = [obj.Students(strcmp({obj.Students.Major}, major)).GPA];
                avgGPAs(i) = mean(majorGPAs);
            end
           
            bar(categorical(majors), avgGPAs);
            title('Average GPA by Major');
            xlabel('Major');
            ylabel('Average GPA');
        end
       
        % Age Distribution
        function plotAgeDistribution(obj)
            ages = [obj.Students.Age];
            histogram(ages);
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of Students');
        end
    end
end