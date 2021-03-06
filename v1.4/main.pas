unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TEge_F }

  TEge_F = class(TForm)
    Answer_Exe: TEdit;
    Answer_text: TEdit;
    back: TButton;
    Button1: TButton;
    Edit_1: TEdit;
    Edit_2: TEdit;
    Gen: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo_Text_Exe: TMemo;
    procedure backClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GenClick(Sender: TObject);
    procedure Memo_Text_ExeChange(Sender: TObject);
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


var
  Ege_F: TEge_F;

  W_var: variant;
  W_ex:  exercise;
  N_ex: String;

   answer: boolean;
implementation
  uses LBass, main_h, zapp, full, menu;
{$R *.lfm}

{ TEge_F }
//функция a+b
function a_b (a,b:integer):integer;
begin
 a_b:=a+b;
end;




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

 for i:=1 to 7 do Ege_F.Memo_Text_Exe.lines[i]:= '';
  Ege_F.Memo_Text_Exe.lines[0]:= s;

 i:=1;
 while Ege_F.Memo_Text_Exe.lines[i] <> '' do i:=i+1;
  Ege_F.Memo_Text_Exe.lines[i]:= s1;
end;

// создаём задание
procedure makeEx (Ex: exercise; nomb: string);
var W_file, WW_file: text;
    i,g: integer;
    s: string;
    size: integer;
label 1;
begin
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
       i:=1;
    closeFile(W_file);

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
    closeFile(W_file);

    //заносим ответ
     assignFile(W_file, 'Ex\'+nomb+'a.txt');
    reset(W_file);
      while not eof(W_file) do
       begin
        if i = Ex.nom_Ex then
           begin
             read(W_file, Ex.answer);
             Ege_F.Answer_Exe.text:= Ex.answer;
             break;
           end;
        i:= i+1;
        readln(W_file);
       end;
    closeFile(W_file);

    Ege_F.Answer_Exe.Visible:= false;
end;



// генерируем вариант
procedure TEge_F.GenClick(Sender: TObject);
var text_ex: string;
    i: integer;
    W_file: text;

    a,b: integer;

begin
 // N_ex
 N_ex:=Nomber;
  // Генирируем
  Randomize;
  makeEx(W_ex,N_ex);
  Answer_text.Text:='';
   //
   Button1.Enabled:=true;
end;

procedure TEge_F.Memo_Text_ExeChange(Sender: TObject);
begin

end;

procedure TEge_F.FormCreate(Sender: TObject);
var n: string;
begin
  n := InputBox('Настройка ответов', 'Выводть ответ при неверном решении? (1 - Да; 0 - Нет)', ' ');
  if n = '1' then answer:=true;
end;

procedure TEge_F.Button1Click(Sender: TObject);
var ver, never: integer;
    s: string;
begin
   if answer_Exe.Text = Answer_text.Text
   then begin
      showMessage ('ВЕРНО!');
      ver:= StrToInt(Edit_1.Text);
      ver:= ver + 1;
      Edit_1.Text:= IntToStr(ver);
       // N_ex
       N_ex:=Nomber;
      // Генирируем
         Randomize;
         makeEx(W_ex,N_ex);
         Answer_text.Text:='';
      //
   end
   else begin
      showMessage ('НЕВЕРНО!');
     if answer = true then begin
      s:='Правильный ответ: ' + answer_Exe.Text;
      showMessage (s);
     end;
      never:= StrToInt(Edit_2.Text);
      never:= never + 1;
      Edit_2.Text:= IntToStr(never);

   end;
end;

procedure TEge_F.backClick(Sender: TObject);
begin
  Application.CreateForm(TMenu_F, Menu_F);
   Menu_F.show;
   close;
end;

procedure TEge_F.Button2Click(Sender: TObject);
begin

end;

procedure TEge_F.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   answer:=false;
   Application.CreateForm(TMenu_F, Menu_F);
   Menu_F.show;

end;

end.

