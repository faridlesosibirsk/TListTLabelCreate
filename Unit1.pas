unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  unit3, IniFiles;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form3.Visible := true;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Ini.WriteInteger('Form', 'Top', Top);
    Ini.WriteInteger('Form', 'Left', Left);
    Ini.WriteString('Form', 'Caption', caption);
    Ini.WriteBool('Form', 'InitMax', WindowState = wsMaximized);
    Ini.WriteInteger('Label1', 'Left', Label1.Left);
    Ini.WriteInteger('Label1', 'Top', Label1.Top);
    Ini.WriteInteger('Label1', 'Width', Label1.Width);
    Ini.WriteInteger('Label1', 'Height', Label1.Height);
    Ini.WriteString('Label1', 'Caption', Label1.caption);
    Ini.WriteInteger('Label2', 'Left', Label2.Left);
    Ini.WriteInteger('Label2', 'Top', Label2.Top);
    Ini.WriteInteger('Label2', 'Width', Label2.Width);
    Ini.WriteInteger('Label2', 'Height', Label2.Height);
    Ini.WriteString('Label2', 'Caption', Label2.caption);
    Ini.WriteInteger('Label3', 'Left', Label3.Left);
    Ini.WriteInteger('Label3', 'Top', Label3.Top);
    Ini.WriteInteger('Label3', 'Width', Label3.Width);
    Ini.WriteInteger('Label3', 'Height', Label3.Height);
    Ini.WriteString('Label3', 'Caption', Label3.caption);
    Ini.WriteInteger('Label4', 'Left', Label4.Left);
    Ini.WriteInteger('Label4', 'Top', Label4.Top);
    Ini.WriteInteger('Label4', 'Width', Label4.Width);
    Ini.WriteInteger('Label4', 'Height', Label4.Height);
    Ini.WriteString('Label4', 'Caption', Label4.caption);
  finally
    Ini.Free;
  end;
end;

end.
