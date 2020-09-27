clear all;

test_file = fopen('Test_IK.txt');
i=0;
while ~feof(test_file)
    i = i+1;
    tline = fgetl(test_file);
    tline = str2num(tline);
    fprintf('test %i',i)
    Q = Inverse_Kinematic(tline(1),tline(2),tline(3),tline(4))
end

% close the file
fclose(test_file);


function Q = Inverse_Kinematic(x,y,z,phi)
L1 = 400;
L2 = 560;
L3 = 515;
L4 = 90;

x2 = x - L4*cos(phi);
z2 = z - L4*sin(phi);

q1 = atan2(y,x);
q3 = acos((x2^2+(z2-L1)^2-L2^2-L3^2)/(2*L2*L3));
q4 = atan2(y,x);
m=1;
if q3>=0
    m=1;
else
    m=-1;
end
q2 = pi/2 - (m*atan2(2*L2*L3*sin(q3),L2^2+x2^2+(z2-L1)^2-L3^2)+atan2(z2-L1,x2));
q5 = phi-(pi/2-q2)-q3;
Q = [q1;q2;q3;q4;q5]
end