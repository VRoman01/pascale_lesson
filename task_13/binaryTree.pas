program binaryPointer;
    
    type
        TreeNodePtr = ^TreeNode;
        TreeNodePos = ^TreeNodePos; 
        TreeNode = record
            data: longint;
            left, right: TreeNodePtr;
        end;

    function SumTree(p: TreeNodePtr): longint;
        begin
            if p=nil then
                SumTree:= 0
            else 
                SumTree:=SumTree(p^.left)+SumTree(p^.right) 
        end;

    function AddToTree(var p: TreeNodePtr; n: longint): boolean;
        begin
            if p=nil then
                begin
                    new(p);
                    p^.data:=n;
                    p^.left, p^.right:=nil;
                    AddToTree:=true;
                end
            else if p^.data<n then
                AddToTree:=AddToTree(p^.right, n)
            else if p^.data>n then
                AddToTree:=AddToTree(p^.left, n)
            else
                AddToTree:=false;                
        end;

    function IsInTree(p: TreeNodePtr; n: longint): boolean;
        begin
            if p=nil then
                IsInTree:=false
            else if p^.data>n then
                IsInTree:=IsInTree(p^.left,n)
            else if p^.data<n then
                IsInTree:=IsInTree(p^.right,n)
            else 
                IsInTree:=true
        end;

    function SearchTree(var p: TreeNodePtr; var n: longint): TreeNodePos;
        begin
            if (p=nil) or (p^.data=n) then
                SearchTree:=@p
            else if (p^.data>n) then
                SearchTree:=SearchTree(p^.left, n)
            else
                SearchTree:=SearchTree(p^.right, n)
        end;

    function AddToTree2(var p: TreeNodePtr; n: longint): boolean;
        var
            pos: TreeNodePos;
        begin
            pos:=SearchTree(p,n);
            if p=nil then
                begin
                    new(pos^);
                    pos^^.data:=n;
                    pos^^.left:=nil;
                    pos^^.right:=nil;
                    AddToTree:=true
                end
            else 
                AddToTree:=false
        end;

    function IsInTree2(p: TreeNodePtr; n: longint): boolean;
        var
            pos: TreeNodePos
        begin 
            pos:=SearchTree(p; n);
            IsInTree:=pos^<>nil;
        end;




var
    root: TreeNodePtr = nil;
begin

end.
