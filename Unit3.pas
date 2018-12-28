unit Unit3;

interface

uses
  Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
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
  i, k: integer;
  OneLabel: TLabel;
begin
  k := 0;
  Ini := TIniFile.create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Top := Ini.ReadInteger('Form', 'Top', 100);
    Left := Ini.ReadInteger('Form', 'Left', 100);
    Caption := Ini.ReadString('Form', 'Caption', 'New Form');
    if Ini.ReadBool('Form', 'InitMax', False) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
    OneLabels := TList<TLabel>.create;
    for i := 0 to 3 do // add 4 Labels from INI file
    begin
      OneLabel := TLabel.create(self);
      OneLabel.Left := Ini.ReadInteger('Label' + inttostr(i + 1), 'Left', 0);
      OneLabel.Top := Ini.ReadInteger('Label' + inttostr(i + 1), 'Top', 0);
      OneLabel.Width := Ini.ReadInteger('Label' + inttostr(i + 1), 'Width', 0);
      OneLabel.Height := Ini.ReadInteger('Label' + inttostr(i + 1),
        'Height', 0);
      OneLabel.Caption := Ini.ReadString('Label' + inttostr(i + 1),
        'Caption', '0');
      OneLabel.Parent := self;
      OneLabels.Add(OneLabel);
    end;
  finally
    OneLabels[1].free; // delete 2 Label from TList<TLabel>,total 4,draw 3
    OneLabels.Delete(1);// delete 2 Label from TList<TLabel>total 3,draw 3
    OneLabels.Destroy; // Destroy TList<TLabel>, total 0 labels, draw 3 labels
    Ini.free;
  end;
end;

end.
