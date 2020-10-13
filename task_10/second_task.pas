program Numbers2;
type
	itemptr = ^item;
	item = record
		data: integer;
		next: itemptr;
	end;
var
       	n: integer;
	first, last, tmp: itemptr;
begin
	first:=nil;
	while not SeekEof do
	begin
		if first=nil then
		begin
			new(first);
			last:=first;
		end
		else
		begin
			new(last^.next);
			last:=last^.next;
		end;
		read(n);
		last^.data:=n;
		last^.next:=nil
	end;

	tmp:=first;
	while tmp<>nil do
	begin
		writeln(tmp^.data);
		tmp:=tmp^.next;
	end;
end.
