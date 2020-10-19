program queueForSecondTask;
type
	LongItemPtr = ^LongItem;

	LongItem = record
		data: longint;
		next: LongItemPtr;
	end;
		
	QueueOfLongint = record
	       first,last: LongItemPtr
	end;

procedure QOLInit(var queue: QueueOfLongint);
begin
	queue.first:=nil;
	queue.last:=nil;
end;
	
procedure QOLPut(var queue: QueueOfLongint; n: longint);
begin
	if queue.first=nil then
	begin
		new(queue.first);
		queue.last:=queue.first
	end
	else
	begin
		new(queue.last^.next);
		queue.last:=queue.last^.next
	end;
	queue.last^.data:=n;
	queue.last^.next:=nil
end;

function QOLGet(var queue: QueueOfLongint; var n: longint): boolean;
var 
	tmp: LongItemPtr;
begin
	if queue.first=nil then
	begin
		QOLGet:=false;
		exit
	end;
	n:=queue.first^.data;
	tmp:=queue.first;
	queue.first:=queue.first^.next;
	if queue.first=nil then queue.last:=nil;
	dispose(tmp);
	QOLGet:=true
end;

var
	q: QueueOfLongint;
	n: longint;
begin
	QOLInit(q);
	while not eof do
	begin
		readln(n);
		QOLPut(q,n)
	end;
	
	while QOLGet(q,n) do
		writeln(n);
end.












