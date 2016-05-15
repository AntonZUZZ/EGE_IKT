unit Full;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFull_F }

  TFull_F = class(TForm)
    Answer_Exe: TEdit;
    Answer_text: TEdit;
    Button1: TButton;
    Memo_Text_Exe: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
      { Задание }
  Exercise = record
    nom_Ex: integer;
    text_Ex: string;
    answer: string;
  end;

  { Вариант }
  Variant = record
    ex1: Exercise;
    ex2: Exercise;
    ex3: Exercise;

  end;
const
  f_const = 25;

var
   Full_F: TFull_F;
  W_ex1, W_ex2, W_ex3, W_ex4, W_ex5, W_ex6, W_ex7, W_ex8, W_ex9, W_ex10, W_ex11,
  W_ex12, W_ex13, W_ex14, W_ex15, W_ex16, W_ex17, W_ex18, W_ex19, W_ex20, W_ex21, W_ex22, W_ex23, W_ex24, W_ex25: Exercise;
   W_var:array [1..25] of Exercise;
   N_ex: string;
  f: integer;

  arr_answ: array [1..25] of string;
  arr_bool: array [1..25] of boolean;
  arr_string: array [1..25] of string;

  True_F,False_F: integer;



  //
    W_file, WW_file: text;
    i,g: integer;
    s: string;
    size: integer;
    ex:  Exercise;


implementation
uses LBass, main_h, zapp, menu;
{$R *.lfm}

{ TFull_F }
// вывод в MEMO
procedure Inn_Memo(Str: string);
var i: integer;
    s, s1: string;
begin
  i:=1;
  while str[i]<>'$' do begin
    s:= s + str[i];
    i:=i+1;
  end;
   i:=i+1;
  while str[i]<>'$' do
   begin
    s1:= s1 + str[i];
    i:=i+1;
   end;

 for i:=1 to 20 do Full_F.Memo_Text_Exe.lines[i]:= '';
  Full_F.Memo_Text_Exe.lines[0]:= s;

 i:=1;
 while Full_F.Memo_Text_Exe.lines[i] <> '' do i:=i+1;
  Full_F.Memo_Text_Exe.lines[i]:= s1;
end;

// создаём задание
procedure makeEx (Ex: exercise; nomb: string);
var W_file, WW_file: text;
    i,g: integer;
    s: string;
    size: integer;
label 1;
begin
 i:=0; g:=0; s:=''; size:=0;
 1:
     //сколько сторок в файле?
     //выбираем номер задания
  assignFile(W_file, 'Ex\'+nomb+'.txt');
    reset(W_file);
      i:=0;
      while not eof(W_file) do
       begin
        readln(W_file);
        i:=i+1;
       end;
     Ex.nom_Ex:= random(i)+1;
     // Ex.nom_Ex:= 1;
       i:=1;
    close(W_file);

    //выводим выбранное задание в MEMO
    assignFile(W_file, 'Ex\'+nomb+'.txt');
    reset(W_file);
      while not eof(W_file) do
       begin
        if i = Ex.nom_Ex then
           begin
             read(W_file, Ex.text_Ex);
               if ex.text_Ex[1]='/' then goto 1;
             Inn_Memo(Ex.text_Ex);
             break;
           end;
        i:= i+1;
        readln(W_file);
       end;
      i:=1;
    close(W_file);

    //заносим ответ
     assignFile(W_file, 'Ex\'+nomb+'a.txt');
    reset(W_file);
      while not eof(W_file) do
       begin
        if i = Ex.nom_Ex then
           begin
             read(W_file, Ex.answer);
             Full_F.Answer_Exe.text:= Ex.answer;
             break;
           end;
        i:= i+1;
        readln(W_file);
       end;
    close(W_file);

    Full_F.Answer_Exe.Visible:= false;
end;



procedure TFull_F.Button1Click(Sender: TObject);
 var text_ex: string;
     i: integer;
     W_file: text;
     a,b: integer;
 label 1,2;
begin
 Randomize;
 if button1.caption= 'В Меню' then begin  Application.CreateForm(TMenu_F, Menu_F); Menu_F.show;   close; f:=0; end;
 Button1.Caption:='Готово';
 if f = 0 then goto 2;
 if Answer_text.Text = '' then begin showMessage ('Поле ответа пустое'); goto 1; end;

 arr_answ[f]:= answer_Exe.Text;
 for i:=1 to 7 do begin
  if Memo_Text_Exe.Lines[i] <> '' then arr_string[f]:= arr_string[f] + Memo_Text_Exe.Lines[i];
 end;
  if answer_Exe.Text = Answer_text.Text then begin  True_F:=True_F+1; arr_bool[f]:= true end
  else begin  False_F:=False_F+1;  arr_bool[f]:= false; end;

 2:
 if f<>f_const then begin
  f:=f+1;

   CASE f of
   1: begin  makeEx(W_ex1, '1'); Answer_text.Text:='';  end;
   2: begin  makeEx(W_ex2, '2'); Answer_text.Text:=''; end;
   3: begin  makeEx(W_ex3, '3');  Answer_text.Text:=''; end;
   4: begin  makeEx(W_ex4, '4');   Answer_text.Text:=''; end;
   5: begin  makeEx(W_ex5, '5');  Answer_text.Text:=''; end;
   6: begin    makeEx(W_ex6, '6');  Answer_text.Text:=''; end;
   7: begin    makeEx(W_ex7, '7');  Answer_text.Text:=''; end;
   8: begin    makeEx(W_ex8, '8');  Answer_text.Text:=''; end;
   9: begin    makeEx(W_ex9, '9');  Answer_text.Text:=''; end;
   10: begin    makeEx(W_ex10, '10');  Answer_text.Text:=''; end;
   11: begin    makeEx(W_ex11, '11');  Answer_text.Text:=''; end;
   12: begin    makeEx(W_ex12, '12');  Answer_text.Text:=''; end;
   13: begin    makeEx(W_ex13, '13');  Answer_text.Text:=''; end;
   14: begin    makeEx(W_ex14, '14');  Answer_text.Text:=''; end;
   15: begin    makeEx(W_ex15, '15');  Answer_text.Text:=''; end;
   16: begin
    makeEx(W_ex16, '16');
    Answer_text.Text:='';
    //
   end;
   17: begin    makeEx(W_ex17, '17');  Answer_text.Text:=''; end;
   18: begin    makeEx(W_ex18, '18');  Answer_text.Text:=''; end;
   19: begin    makeEx(W_ex19, '19');  Answer_text.Text:=''; end;
   20: begin    makeEx(W_ex20, '20');  Answer_text.Text:=''; end;
   21: begin    makeEx(W_ex21, '21');  Answer_text.Text:=''; end;
   22: begin makeEx(W_ex22, '22');  Answer_text.Text:=''; end;
   23: begin makeEx(W_ex23, '23');  Answer_text.Text:=''; end;
   24: begin makeEx(W_ex24, '24');  Answer_text.Text:=''; end;
   25: begin makeEx(W_ex25, '25');  Answer_text.Text:=''; end;
   end;

  end else
     begin
      s:= 'КОНЕЦ.    ' + 'Верно - ' + IntToStr(True_F) + '.     Неверно - ' + IntToStr(False_F);
      showMessage (s);
      Full_F.Memo_Text_Exe.lines[0]:= '';
       for i:=1 to 25 do begin
           g:=0;
           while Full_F.Memo_Text_Exe.lines[g] <> '' do g:=g+1;
            Full_F.Memo_Text_Exe.lines[g]:=' ';
            if arr_bool[i] = true then Full_F.Memo_Text_Exe.lines[g+1]:= IntToStr(i) +  ' - ВЕРНО!';
            if arr_bool[i] = false then Full_F.Memo_Text_Exe.lines[g+1]:= IntToStr(i) +  ' - НЕВЕРНО!';

         //  while Full_F.Memo_Text_Exe.lines[g] <> '' do g:=g+1;
            Full_F.Memo_Text_Exe.lines[g+2]:= 'ОТВЕТ: '+arr_answ[i];
      button1.caption:= 'В Меню';
      Answer_text.Text:='';
      Answer_text.Enabled:=false;
       end;
     end;
  1:
  end;

procedure InVar(i:integer);
begin

end;

procedure TFull_F.FormCreate(Sender: TObject);
begin
  f:=0;
  Answer_text.Text:='';
  True_F:=0;
  False_F:=0;
end;


end.

