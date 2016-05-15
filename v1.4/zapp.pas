unit zapp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TZap_FF }

  TZap_FF = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ColorDialog1: TColorDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Zap_FF: TZap_FF;
  Flag: boolean;
implementation

{$R *.lfm}

{ TZap_FF }

procedure TZap_FF.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Flag:= true;
  PaintBox1.Canvas.MoveTo(x, y);
end;

procedure TZap_FF.Button1Click(Sender: TObject);
begin
 PaintBox1.Canvas.Pen.Width:= 10;
end;

procedure TZap_FF.Button2Click(Sender: TObject);
begin
  If ColorDialog1.Execute
Then PaintBox1.Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TZap_FF.Button3Click(Sender: TObject);
begin
   PaintBox1.Canvas.Pen.Width:= 1;
end;

procedure TZap_FF.Button4Click(Sender: TObject);
begin
   PaintBox1.Canvas.Pen.Width:= 100;
end;

procedure TZap_FF.Button5Click(Sender: TObject);
begin
   PaintBox1.Canvas.Pen.Width:= 500;
end;

procedure TZap_FF.Button6Click(Sender: TObject);
begin
   PaintBox1.Canvas.Pen.Width:= 5000;
end;

procedure TZap_FF.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   If Flag
  Then PaintBox1.Canvas.LineTo(x, y);
  Label1.Caption:= 'x =' + IntToStr(x) + 'Y=' + IntToStr(Y);
end;

procedure TZap_FF.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Flag:= False;
end;

end.

