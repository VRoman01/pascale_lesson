program read_numbers;
type 
	itemptr = ^item;
	item = record
		data: integer;
		prev: itemptr;
	end;
var
	first: itemptr;
	buffer: itemptr;
	num: integer;
	a: ^integer;
begin
	new(buffer);
	new(buffer^.prev);
	buffer^.prev:=nil;

	while not eof do
	begin
		readln(num);
		new(first);
		first^.data:=num;
		new(first^.prev);
		first^.prev^:=buffer^;

		buffer:=first;
	end;

	while true do
	begin
		writeln(first^.data);
		if first^.prev=nil then break;
		first:=first^.prev;
	end;
end.
