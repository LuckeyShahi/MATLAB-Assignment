% Program 14: Persistent Attendance Log
% Asks for a student's name and attendance status, validates the status,
% then appends the record to attendance.txt WITHOUT deleting previous
% records. Run this program once per student; attendance.txt keeps
% growing across runs (demonstrated here with 5 records).

clear; clc;

acceptedStatuses = {'Present', 'Absent'};

studentName = input('Enter student name: ', 's');
status      = input('Enter attendance status (Present/Absent): ', 's');

isValid = false;
for i = 1:length(acceptedStatuses)
    if strcmpi(status, acceptedStatuses{i})
        isValid = true;
        status = acceptedStatuses{i};   % normalize capitalization
    end
end

if ~isValid
    fprintf('Invalid status "%s". Accepted values: Present, Absent. Record not saved.\n', status);
else
    fid = fopen('attendance.txt', 'a');   % append mode - keeps old records
    if fid == -1
        error('Could not open attendance.txt for writing.');
    end
    fprintf(fid, '%s - %s\n', studentName, status);
    fclose(fid);

    fprintf('Record appended: %s - %s\n', studentName, status);
end

disp('--- Current contents of attendance.txt ---');
type('attendance.txt');
