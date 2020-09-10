procedure PrintDigitsOfNumber(n: integer);
begin
	if n>0 then
	begin
		PrintDigitsOfNumber(n div 10);
		write(n mod 10, ' ')
	end
end;

begin
	PrintDigitsOfNumber(7583);
	writeln()
end.
