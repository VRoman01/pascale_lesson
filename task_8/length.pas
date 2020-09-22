program length_of_string;
var
	s1: string[5];
	s2: string;
	i: integer;
begin	
	s1:='roman';
	s2:='roman venchak';

	for i:=0 to 5 do write(ord(s1[i]), ' ');
	writeln;
	for i:=0 to 255 do write(ord(s2[i]), ' ');
	writeln;
	for i:=0 to 5 do write(s1[i], ' ');
	writeln;
	for i:=0 to 255 do write(s2[i], ' ');
	writeln;

	s1:=s2;
	for i:=0 to 5 do write(ord(s1[i]), ' ');
	writeln;
	for i:=0 to 5 do write((s1[i]), ' ');
	writeln;
end.
