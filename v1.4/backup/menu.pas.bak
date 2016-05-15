unit menu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TMenu_F }

  TMenu_F = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Zap_B: TButton;
    Zap_B1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Zap_B1Click(Sender: TObject);
    procedure Zap_BClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Menu_F: TMenu_F;

implementation
uses LBass, main, zapp, full, main_h;

{$R *.lfm}

{ TMenu_F }

procedure TMenu_F.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TNomb_F, Nomb_F);
   Nomb_F.show;
   Menu_F.Hide;
end;

procedure TMenu_F.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TMenu_F.FormCreate(Sender: TObject);
begin

end;

procedure TMenu_F.Zap_B1Click(Sender: TObject);
begin
  Application.CreateForm(TFull_F, Full_F);
   Full_F.show;

end;

procedure TMenu_F.Zap_BClick(Sender: TObject);
begin
   Application.CreateForm(TZap_FF, Zap_FF);
   Zap_FF.show;

end;

end.

