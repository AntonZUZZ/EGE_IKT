program qq;
var f:text;
    i: integer;
    q: string;
begin
for i:=5 to 25 do begin
 q:=IntToStr(i);
assign(f,q+'.txt');
 rewrite(f);
 write(f,q,q,q,q,q,q,'$$');
 close(f);
assign(f,q+'a.txt');
 rewrite(f);
 write(f,q);
 close(f);
end;
end.
