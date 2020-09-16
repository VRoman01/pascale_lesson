function ReadLongint(var result: longint): boolean;
var
	c: char;
	res: longint;
	pos: integer;
begin
	res:=0;
	pos:=0;

	repeat
		read(c);
		pos:=pos+1
	until (c<>' ') and (c<> #10);
	
	while (c<>' ') and (c<> #10) do 
	begin
		if (c<'0') or (c>'9') then
		begin
			writeln('unexpect ''' ,c, ''' in pos: ', pos);
			readln;
			ReadLongint := false;
			exit
		end;	
		res:=res*10+ord(c)-ord('0');
		read(c);
		pos:=pos+1
	end;
	result:=res;
	ReadLongint:=true
end;

var 
	x,y:longint;
begin
	while not ReadLongint(x) do
		;
	while not ReadLongint(y) do
		;
	writeln(x, ' times ', y, ' is ', x*y)
end.









