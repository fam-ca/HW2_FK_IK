clear all;
close all;

test_file = fopen('Test_FK.txt');
i=0;
while ~feof(test_file)
    i = i+1;
    tline = fgetl(test_file);
    tline = str2num(tline);
    fprintf('test %i',i)
    H = Forward_Kinematic(tline(1),tline(2),tline(3),tline(4),tline(5),tline(6))
end

% close the file
fclose(test_file);

function H = Forward_Kinematic(q1,q2,q3,q4,q5,q6)
L1 = 400;
L2 = 560;
L3 = 515;
L4 = 90;

H = Tz(L1)*Rz(q1)*Ry(q2)*Tz(L2)*Ry(q3)*Tz(L3)*Rz(q4)*Ry(q5)*Tz(L4)*Rz(q6);
end


