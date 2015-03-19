unit SingUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ImageB: TImage;
    ImagePFalse: TImage;
    ImagePTrue: TImage;
    ImageLFalse: TImage;
    ImageLTrue: TImage;
    ImageNTrue: TImage;
    ImageNFalse: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ImageBEnter: TImage;
    ImageBDown: TImage;
    DataSource1: TDataSource;
    procedure Edit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageBEnterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBEnterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses MainMenu, Registered;

{$R *.dfm}

procedure TForm2.Edit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageLTrue.Visible:=True;
   ImageLFalse.Visible:=False;
   ImagePTrue.Visible:=False;
   ImagePFalse.Visible:=True;
   ImageNTrue.Visible:=False;
   ImageNFalse.Visible:=True;
   Edit1.Text:='';
   if (Edit2.Text = 'PASSWORD') or (Edit2.Text = '') then
      Edit2.Text:='PASSWORD';
   if (Edit3.Text = 'NAME') or (Edit3.Text = '') then
      Edit3.Text:='NAME';
end;

procedure TForm2.Edit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageLTrue.Visible:=False;
   ImageLFalse.Visible:=True;
   ImagePTrue.Visible:=True;
   ImagePFalse.Visible:=False;
   ImageNTrue.Visible:=False;
   ImageNFalse.Visible:=True;
   Edit2.Text:='';
   if (Edit1.Text = 'LOGIN') or (Edit1.Text = '') then
      Edit1.Text:='LOGIN';
   if (Edit3.Text = 'NAME') or (Edit3.Text = '') then
      Edit3.Text:='NAME';

end;

procedure TForm2.Edit3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageLTrue.Visible:=False;
   ImageLFalse.Visible:=True;
   ImagePTrue.Visible:=False;
   ImagePFalse.Visible:=True;
   ImageNTrue.Visible:=True;
   ImageNFalse.Visible:=False;
   Edit3.Text:='';
   if (Edit1.Text = 'LOGIN') or (Edit1.Text = '') then
      Edit1.Text:='LOGIN';
   if (Edit2.Text = 'PASSWORD') or (Edit2.Text = '') then
      Edit2.Text:='PASSWORD';
end;

procedure TForm2.ImageBMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageBDown.Visible:=True;
   ImageB.Visible:=False;
   ImageBEnter.Visible:=False;
end;

procedure TForm2.ImageBMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageBDown.Visible:=False;
   ImageB.Visible:=True;
end;

procedure TForm2.ImageBMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   ImageB.Visible:=False;
   ImageBDown.Visible:=False;
   ImageBEnter.Visible:=True;
end;

procedure TForm2.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   ImageB.Visible:=True;
   ImageBDown.Visible:=False;
   ImageBEnter.Visible:=False;
end;

procedure TForm2.ImageBEnterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   ImageBEnter.Visible:=False;
   ImageBDown.Visible:=True;
   if (Edit1.Text <> 'LOGIN') and (Edit2.Text <> 'PASSWORD') and (Edit3.Text <> 'NAME') then
      begin
         FMain.ADOQuery2.FieldByName('Login').AsString:=Edit1.Text;
         FMain.ADOQuery2.FieldByName('Password').AsString:=Edit2.Text;
         FMain.ADOQuery2.FieldByName('Name').AsString:=Edit3.Text;
         Application.MessageBox('Регистрация прошла успешно','Регистрация');
         FMain.ADOQuery2.Post;
         Edit1.Clear;
         Edit2.Clear;
         Form2.Close;
      end
   else
      Application.MessageBox('Введены не все данные','Ошибка регистрации');
end;

procedure TForm2.ImageBEnterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageBEnter.Visible:=True;
   ImageBDown.Visible:=False;
end;

end.
