unit Unit2;

interface

uses
  Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  MyClass = class
  private
    labels: TList<TLabel>;
  published
    constructor create(Form: TForm);
  end;

implementation

{ MyClass }

constructor MyClass.create(Form: TForm);
var
  i: integer;
  OneLabel: TLabel;
begin
  labels := TList<TLabel>.create;
  for i := 0 to 9 do begin
    OneLabel := TLabel.create(Form);
    labels.Add(OneLabel);
  end;

end;

end.
