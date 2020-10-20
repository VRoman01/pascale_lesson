program MyQueueOfChar;
type
	charItemPtr = ^charItem;

	charItem = record
		data:char;
		next:charItemPtr
	end;

	queueOfChar = record
		first,last:charItemPtr
	end;

procedure QOCInit(var s:queueOfChar);
begin
	s.first:=nil;
	s.last:=nil
end;
procedure QOCPut(var s:queueOfChar; n:char);
begin
	if s.first=nil then
	begin
		new(s.first);
		s.last:=s.first;
	end
	else
	begin
		new(s.last^.next);
		s.last:=s.last^.next;
	end;
	s.last^.data:=n;
	s.last^.next:=nil;
end;
function QOCGet(var s:queueOfChar; var n:char):boolean;
var
	tmp: charItemPtr;
begin
	if s.first=nil then
	begin
		QOCGet:=false;
		exit;
	end;
	tmp:=s.first;
	n:=s.first^.data;
	s.first:=s.first^.next;
	dispose(tmp);
	QOCGet:=true;
end;

var
	s: queueOfChar;
	c: char;
begin
	QOCInit(s);
	while not eof do
	begin
		readln(c);
		QOCPut(s,c);
	end;	
	while QOCGet(s,c) do
		writeln(c);
end.
