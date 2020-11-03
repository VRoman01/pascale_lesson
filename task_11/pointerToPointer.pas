program pointerToPointer;
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

    procedure RemoveLessZero(var q: QueueOfLongint);
        var 
            tmp, tmp2: LongItemPtr;         
        begin
            if q.first<>nil then
            begin
                while q.first^.data<0 do
                begin
                    tmp:=q.first;
                    q.first:=q.first^.next;
                    dispose(tmp)
                end;

                tmp:=q.first;
                while tmp^.next<>nil do
                begin
                    if tmp^.next^.data <0 then
                    begin
                        tmp2:=tmp^.next;
                        tmp^.next:=tmp^.next^.next;
                        dispose(tmp2)
                    end
                    else tmp:=tmp^.next
                end
            end
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
    
    RemoveLessZero(q);

	while QOLGet(q,n) do
		writeln(n);
end.














