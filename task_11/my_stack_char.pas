program MyStackOfChar;
type
	CharItemPtr = ^CharItem;
	CharItem = record
		data: char;
		next: CharItemPtr;
	end;
	StackOfChars = CharItemPtr;

procedure SOCInit(var s: CharItemPtr);
begin
	s:=nil;
end;

procedure SOCPush(var s: CharItemPtr ; c:Char);
var
	tmp: CharItemPtr;
begin
	new(tmp);
	tmp^.data:=c;
	tmp^.next:=s;
	s:=tmp;
end;

function SOCPop(var s: CharItemPtr ; var  c:Char):boolean;
var
	tmp: CharItemPtr; 
begin
	if s=nil then
	begin
		SOCPop:=false;
		exit
	end;
	tmp:=s;
	c:=tmp^.data;
	s:=tmp^.next;
	dispose(tmp);
	SOCPop:=true;
end;

var
	s: StackOfChars;
	c: Char;
begin
	SOCInit(s);
	while not SeekEof do
	begin
		read(c);
		SOCPush(s,c);
	end;

	while SOCPop(s,c) do
	begin
		writeln(c);
	end;
end.
