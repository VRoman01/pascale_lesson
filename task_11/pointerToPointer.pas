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

    procedure QOLPutAndSort(var q: QueueOfLongint; n: longint);
        var
            pp: ^LongItemPtr;
            tmp: LongItemPtr;
        begin
            pp:=@(q.first);
            while (pp^<>nil) and (n>pp^^.data) do
                pp:=@(pp^^.next);
            new(tmp);
            tmp^.data:=n;
            tmp^.next:=pp^;
            pp^:=tmp;
        end;
 
    procedure HelpToSort2(var p : LongItemPtr; n : integer);
        var
            tmp: LongItemPtr;
        begin
            if (p=nil) or (p^.data>n) then
            begin
                new(tmp);
                tmp^.data:=n;
                tmp^.next:=p;
                p:=tmp;
            end
            else 
                HelpToSort2(p^.next ,n)
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

    procedure RemoveLessZero2(var q: QueueOfLongint);
        var
            tmp: LongItemPtr; 
            pp: ^LongItemPtr;
        begin
            pp:=@(q.first);
            while pp^ <> nil do
            begin
                if pp^^.data<0 then
                begin
                tmp:=pp^;
                pp^:=pp^^.next;
                dispose(tmp)
                end
                else pp:=@(pp^^.next)
            end
        end;
var
	q: QueueOfLongint;
	n: longint;
begin
	QOLInit(q);
	while not eof do
	begin
		read(n);
		HelpToSort2(q.first,n)
	end;
    
    RemoveLessZero2(q);

	while QOLGet(q,n) do
		writeln(n);
end.














