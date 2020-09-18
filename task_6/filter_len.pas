program FilterLenght;
var c: char; n: integer;
begin
	n:=0;
	while not eof do
		begin
			read(c);
			if c<>#10 then n:=n+1
			else begin
				writeln(n);
				n:=0
			     end	
		end
end.
