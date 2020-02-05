rand('seed',getdate('s'))
goal = input("Target number of equations: ");
p2 = input("Maximum divisor of each root: ");
q1 = input("Minumum numerator of each root: ");
q2 = input("Maximum numerator of each root: ");
grade1 = input("Minimum equation grade: ");
grade2 = input("Maximum equation grade: ");
l = zeros(goal,grade2);
for i = 1:goal
    grade = grand(1,1,"uin",grade1,grade2);
    p = cat(2,grand(1,grade,"uin",1,p2),ones(1,grade2-grade));
    q = cat(2,grand(1,grade,"uin",q1,q2),zeros(1,grade2-grade));
    l(i,:) = q./p;
    [np,dp] = rat(l(i,1:grade));
    poli = poly(np./dp,"x");
    [cof] = coeff(poli);
    [nc,dc] = rat(cof);
    pol2(i) = prettyprint(poly([cof]*double(lcm(dc)),'x','coeff'));
end
csvWrite(pol2, "\poli.txt");
csvWrite(l, "\root.txt");
