unit Unit3;

interface

uses
  Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics, unit2,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    OneLabels: TList<TLabel>;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  i: integer;
  OneLabel: TLabel;
begin
  Ini := TIniFile.create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Top := Ini.ReadInteger('Form', 'Top', 100);
    Left := Ini.ReadInteger('Form', 'Left', 100);
    Caption := Ini.ReadString('Form', 'Caption', 'New Form');
    if Ini.ReadBool('Form', 'InitMax', False) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
    // OneLabel := TLabel.create(self);
    OneLabels := TList<TLabel>.create;
    for i := 0 to 1 do
    begin
      OneLabel := TLabel.create(self);
      OneLabel.Left := Ini.ReadInteger('Label'+inttostr(i+1), 'Left', 0);
      OneLabel.Top := Ini.ReadInteger('Label'+inttostr(i+1), 'Top', 0);
      OneLabel.Width := Ini.ReadInteger('Label'+inttostr(i+1), 'Width', 0);
      OneLabel.Height := Ini.ReadInteger('Label'+inttostr(i+1), 'Height', 0);
      OneLabel.Caption := Ini.ReadString('Label'+inttostr(i+1), 'Caption', '0');
      OneLabel.Parent := self;
      OneLabels.Add(OneLabel);
      //OneLabel.Destroy;
      //OneLabel.Free;
    end;

  finally
    Ini.Free;
  end;
end;

end.
