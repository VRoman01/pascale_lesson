program MovingHello;
uses Crt;
const
	Message = 'Hello, World';

function corX(x:integer; msg:string):integer;
begin
	corX:=x;
	if x=0 then corX:=ScreenWidth-length(msg)+1;
	if x>=(ScreenWidth-length(msg)+2) then corX:=1
end;

function corY(y:integer; msg:string):integer;
begin
	corY:=y;
	if y=0 then corY:=ScreenHeight;
	if y=ScreenHeight+1 then corY:=1
end;

procedure ShowMessage(x,y:integer; msg:string);
begin
	GotoXY(x,y);
	write(msg);
	GotoXY(1,1)
end;

procedure HideMessage(x,y:integer; msg:string);
var len,i:integer;
begin 
	len:=length(msg);
	GotoXY(x,y);
	for i:=1 to len do
		write(' ');
	GotoXY(1,1);
end;

procedure MoveMessage(var x,y:integer; msg:string; dx,dy:integer);
begin
	HideMessage(x,y,msg);
	x:=x+dx;
	y:=y+dy;
	
	x:=corX(x,msg);
	y:=corY(y,msg);

	ShowMessage(x,y,msg)
end;

var
       CurX, CurY:integer;
       ch: char;
begin
	clrscr;
	CurX:=(ScreenWidth - length(Message)) div 2;
	CurY:=ScreenHeight div 2;
	ShowMessage(CurX, CurY, Message);
	while true do
	begin
		ch:=ReadKey;
		if ch<>#0 then break;

		ch:=ReadKey;
		case ch of
		#75: MoveMessage(CurX, CurY, Message, -1, 0);
		#77: MoveMessage(CurX, CurY, Message, 1, 0);
		#72: MoveMessage(CurX, CurY, Message, 0, -1);
		#80: MoveMessage(CurX, CurY, Message, 0, 1);
		end
	end;	
	clrscr;
end.

