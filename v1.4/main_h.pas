unit main_h;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TNomb_F }

  TNomb_F = class(TForm)
    Button1: TButton;
    back: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure backClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Nomb_F: TNomb_F;

  Nomber: string;


implementation
 uses LBass, main, zapp, full, menu;
{$R *.lfm}

 { TNomb_F }

 procedure TNomb_F.backClick(Sender: TObject);
 begin
   Application.CreateForm(TMenu_F, Menu_F);
   Menu_F.show;
   close;
 end;

procedure TNomb_F.Button1Click(Sender: TObject);
begin
  case edit1.Text of
'1': begin Nomber:='1'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'2': begin Nomber:='2'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'3': begin Nomber:='3'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'4': begin Nomber:='4'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'5': begin Nomber:='5'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'6': begin Nomber:='6'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'7': begin Nomber:='7'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'8': begin Nomber:='8'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'9': begin Nomber:='9'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'10': begin Nomber:='10'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'11': begin Nomber:='11'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'12': begin Nomber:='12'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'13': begin Nomber:='13'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'14': begin Nomber:='14'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'15': begin Nomber:='15'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'16': begin Nomber:='16'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'17': begin Nomber:='17'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'18': begin Nomber:='18'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'19': begin Nomber:='19'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'20': begin Nomber:='20'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'21': begin Nomber:='21'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'22': begin Nomber:='22'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'23': begin Nomber:='23'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'24': begin Nomber:='24'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
'25': begin Nomber:='25'; Application.CreateForm(TEge_F, Ege_F); Ege_F.show; close;  end;
  end;

end;

end.

