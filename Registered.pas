unit Registered;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB;

type
  TFRegister = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Image2: TImage;
    Image4: TImage;
    Edit2: TEdit;
    Label1: TLabel;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Label2: TLabel;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    DataSource1: TDataSource;
    procedure Edit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image9MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegister: TFRegister;
  FlagOfEnter:boolean;

implementation

uses SingUp, MainMenu;

{$R *.dfm}

procedure TFRegister.Edit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FlagOfEnter:=False;
   Image3.Visible:=True;
   Image4.Visible:=False;
   Image6.Visible:=True;
   Image5.Visible:=False;
   if (Edit1.Text = 'LOGIN') then
      Edit1.Text:='';
   if (Edit2.Text = '') then
      Edit2.Text:='PASSWORD';
end;

procedure TFRegister.Edit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Image4.Visible:=True;
   Image3.Visible:=False;
   Image6.Visible:=False;
   Image5.Visible:=True;
   if (Edit2.Text = 'PASSWORD') then
      Edit2.Text:='';
   if (Edit1.Text = '') then
      Edit1.Text:='LOGIN';
end;

procedure TFRegister.Image7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Image7.Visible:=False;
   Image8.Visible:=True;
end;

procedure TFRegister.Image7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Image8.Visible:=False;
   Image7.Visible:=True;
end;

procedure TFRegister.Image7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Image9.Visible:=True;
   Image7.Visible:=False;
end;

procedure TFRegister.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Image9.Visible:=False;
   Image7.Visible:=True;
end;

procedure TFRegister.Image9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Image9.Visible:=False;
   Image8.Visible:=True;
   Image7.Visible:=False;
end;

procedure TFRegister.Image9MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Image9.Visible:=True;
   Image8.Visible:=False;
end;

procedure TFRegister.Label2Click(Sender: TObject);
begin
   Form2.Show;
   FRegister.Hide;
   FMain.ADOQuery2.Insert;
end;

procedure TFRegister.Image9Click(Sender: TObject);
var
   SQLRequest:string;
begin
   if (Edit1.Text = '') or (Edit1.Text = 'LOGIN') then
      Application.MessageBox('Введите логин','Ошибка авторизации')
   else
      if (Edit2.Text = '') or (Edit2.Text = 'PASSWORD') then
         Application.MessageBox('Введите пароль','Ошибка авторизации');
   FMain.ADOQuery2.Close;
   FMain.ADOQuery2.SQL.Clear;
   SQLRequest:='Select * From Login where Login = '+QuotedStr(Edit1.Text)+'and Password='+QuotedStr(Edit2.Text);
   FMain.ADOQuery2.SQL.Add(SQLRequest);
   FMain.ADOQuery2.Active:=True;
   FMain.ADOQuery2.Open;
   if (not FMain.ADOQuery2.IsEmpty) then
   begin
      FlagOfEnter:=True;
      FRegister.Close;
   end
   else
      Application.MessageBox('Логин или пароль неверны, проверьте еще раз!','Ошибка авторизации');

   FMain.Label14.Caption:='Добро пожаловать,' + #13 + DataSource1.DataSet.Fields[2].AsString;

end;

procedure TFRegister.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if (Edit1.Text = 'LOGIN') then
      Edit1.Text := '';

end;

end.
