program hello_sting;
var
       	hello: array [1..30] of char;
	i: integer;
begin
	while not eof do
	begin
		readln(hello);
		writeln(hello)
	end;

	hello:='hello world';
	writeln(hello);

	for i:=1 to 30 do
	if hello[i]=#0 then write('0')
end.
