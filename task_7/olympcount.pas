program OlympiadCounter;
const 
	maxSchool = 67;
	maxGroup = 100;
type
	countersArray = array [1..maxSchool] of integer;
var 
	counters: countersArray;
	i,n,c : integer;
begin
	for i:=1 to maxSchool do
		counters[i]:=0;
	
	{&-I}
	while not eof do
	begin
		readln(c);
		if IOResult<>0 then
		begin
			writeln('Incorrect data');
			halt(1)
		end;

		n:=c div maxGroup;
		if (c<1) or (c>maxSchool) then
		begin
			writeln('Illigal school id ', n, ' [',c,']');
			halt(1)
		end;
		counters[n]:= counters[n]+1 
	end;

	n:=1;
	for i:=2 to maxSchool do
		if counters[i]>counters[i-1] then n:=i;

	for i:=1 to maxSchool do
		if counters[i]=counters[n] then writeln(i)
	
	
end.
