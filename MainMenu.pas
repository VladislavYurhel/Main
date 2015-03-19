unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, XPMan, StdCtrls, ComCtrls, Menus, DB, ADODB;

type
  TFMain = class(TForm)
    SlotOne: TImage;
    Label1: TLabel;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    XPManifest1: TXPManifest;
    SlotTwo: TImage;
    SlotThree: TImage;
    SlotFour: TImage;
    SlotFive: TImage;
    SlotSix: TImage;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button4: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Button5: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Button6: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Button7: TButton;
    Label12: TLabel;
    Label13: TLabel;
    Button8: TButton;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Button9: TButton;
    LabelDate: TLabel;
    Timer1: TTimer;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    Label14: TLabel;
    DataSource1: TDataSource;
    EditLogin: TEdit;
    EditPassword: TEdit;
    Label15: TLabel;
    ImageLFalse: TImage;
    ImageLTrue: TImage;
    ImagePFalse: TImage;
    ImagePTrue: TImage;
    ImageBOn: TImage;
    Label16: TLabel;
    ImageBEnter: TImage;
    ImageBDown: TImage;
    ImageBexit: TImage;
    ImageBExitDown: TImage;
    ImageBExitEnter: TImage;
    ProgressBar1: TProgressBar;
    LabelCount: TLabel;
    LabelLevel: TLabel;
    Image8: TImage;
    Image9: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SlotOneMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SlotTwoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SlotThreeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SlotFourMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SlotFiveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SlotSixMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure EditLoginMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditPasswordMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label16MouseEnter(Sender: TObject);
    procedure Label16MouseLeave(Sender: TObject);
    procedure ImageBOnMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageBEnterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBEnterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBexitClick(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image9Click(Sender: TObject);
  private
  
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

  stDay:array[1..7] of string[11] = ('воскресенье','понедельник','вторник',
                                     'среда','четверг','пятница','суббота');
  stMonth : array[1..12] of string[8] = ('января','февраля','марта',
                                          'апреля','мая','июня','июля',
                                          'августа','сентября','октября',
                                          'ноября','декабря');
   AuthentFlag,saveResultLearning:boolean;
implementation

uses Video, WordTranslate, Learning, Unit1, Registered, SingUp;

{$R *.dfm}

procedure TFMain.Button1Click(Sender: TObject);
begin
   FMain.Hide;
   //FVideo.Show;
   FLearning.Show;
end;

procedure TFMain.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button3.Visible:=True;
end;


procedure TFMain.SlotOneMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button3.Visible:=False;
   Button4.Visible:=False;
   Button5.Visible:=False;
   Button6.Visible:=False;
   Button7.Visible:=False;
   Button8.Visible:=False;
   Image9.Visible:=False;
end;

procedure TFMain.SlotTwoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button4.Visible:=True;
end;

procedure TFMain.SlotThreeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button5.Visible:=True;
end;

procedure TFMain.SlotFourMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button6.Visible:=True;
end;

procedure TFMain.SlotFiveMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button7.Visible:=True;
end;

procedure TFMain.SlotSixMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Button8.Visible:=True;
end;

procedure TFMain.Button3Click(Sender: TObject);
begin
   FWordTranslate.Show;
   FMain.Hide;
end;

procedure TFMain.Button9Click(Sender: TObject);
begin
   FLearning.Show;
   FMain.Hide;
end;

procedure TFMain.Timer1Timer(Sender: TObject);
var
   Present: TDateTime;
   Year,Month,Day: Word;
begin
   Present:= Now;
   DecodeDate(Present,Year,Month,Day);
   LabelDate.Caption:='Сейчас ' + IntToStr(Day) + ' ' + StMonth[Month] + ' ' + IntToStr(Year) + ' года, ' + stDay[DayOfWeek(Present)] + ' | Время: ' + TimeToStr(Now);
end;

procedure TFMain.Button10Click(Sender: TObject);
begin
   if (Registered.FlagOfEnter = True) then
      Application.MessageBox('Выход совершен','Выход с аккаунта');
   FRegister.Show;
end;

procedure TFMain.EditLoginMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ImageLFalse.Visible:=False;
   ImageLTrue.Visible:=True;
   ImagePFalse.Visible:=True;
   ImagePTrue.Visible:=False;
   if (EditLogin.Text = 'LOGIN') then
      EditLogin.Text:='';
   if (EditPassword.Text = '') then
      EditPassword.Text:='PASSWORD';
end;

procedure TFMain.EditPasswordMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   ImageLFalse.Visible:=True;
   ImageLTrue.Visible:=False;
   ImagePFalse.Visible:=False;
   ImagePTrue.Visible:=True;
   if (EditPassword.Text = 'PASSWORD') then
      EditPassword.Text:='';
   if (EditLogin.Text = '') then
      EditLogin.Text:='LOGIN';
end;

procedure TFMain.Label16MouseEnter(Sender: TObject);
begin
   Label16.Font.Color:=clGray;
end;

procedure TFMain.Label16MouseLeave(Sender: TObject);
begin
   Label16.Font.Color:=clWhite;
end;

procedure TFMain.ImageBOnMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   ImageBOn.Visible:=False;
   ImageBEnter.Visible:=True;
end;

procedure TFMain.ImageBEnterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   SQLRequest,UserName:string;
   timeForBar,i:integer;
   FlagForAuth:boolean;
begin
   {*Поиск пользователя в базе даннных*}
   if (EditLogin.Text = '') or (EditLogin.Text = 'LOGIN') then
      Application.MessageBox('Введите логин','Ошибка авторизации')
   else
      if (EditPassword.Text = '') or (EditPassword.Text = 'PASSWORD') then
         Application.MessageBox('Введите пароль','Ошибка авторизации');
   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   SQLRequest:='Select * From Login where Login = '+QuotedStr(EditLogin.Text)+'and Password='+QuotedStr(EditPassword.Text);
   ADOQuery2.SQL.Add(SQLRequest);
   ADOQuery2.Active:=True;
   ADOQuery2.Open;

   {*Если пользователь был найден в базе данных*}
   if (not ADOQuery2.IsEmpty) then
      begin
         ProgressBar1.Visible:=True;

         {*Прогресс поиска и авторизации пользователя*}
         for i:=1 to ProgressBar1.Max*50 do
            ProgressBar1.Position:=i;
         if ProgressBar1.Position=ProgressBar1.Max then
            begin
               FlagForAuth:=False;
               Application.MessageBox('Авторизация прошла успешно','Авторизация');
               ProgressBar1.Visible:=False;
            end
         else
            FlagForAuth:=True;

         if FlagForAuth = False then
            begin
               UserName:=DataSource1.DataSet.Fields[2].AsString;
               UserName:=UpCase(UserName[1]) + UserName;
               Delete(userName,2,1);
               Label14.Caption:='Добро пожаловать,' + #13 + UserName;

               //Личный кабинет
                  LabelCount.Visible:=True;
                  LabelCount.Caption:='Счет: ' + DataSource1.DataSet.Fields[4].AsString;
                  LabelLevel.Visible:=True;
                  LabelLevel.Caption:='Уровень: ' + DataSource1.DataSet.Fields[5].AsString;

               {После авторизации}
               EditLogin.Visible:=False;
               EditPassword.Visible:=False;
               ImageBDown.Visible:=False;
               ImageBEnter.Visible:=False;
               ImageBOn.Visible:=False;
               ImageLFalse.Visible:=False;
               ImageLTrue.Visible:=False;
               ImagePFalse.Visible:=False;
               ImagePTrue.Visible:=False;
               Label16.Visible:=False;
               Label15.Visible:=False;
               AuthentFlag:=True;
               ImageBExit.visible:=True;
            end;
      end
         else
            begin
               Application.MessageBox('Логин или пароль неверны, проверьте еще раз!','Ошибка авторизации');
               AuthentFlag:=False;
            end;

   {*Если пользователь авторизован*}
   if (AuthentFlag = True) then
      begin
         ImageBOn.Visible:=False;
         ImageBEnter.Visible:=False;
         ImageBDown.Visible:=False;
         SaveResultLearning:=True;
      end;
end;

procedure TFMain.ImageBEnterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   SQLRequest:string;
begin
    ImageBEnter.Visible:=True;
   ImageBDown.Visible:=False;
end;

procedure TFMain.ImageBexitClick(Sender: TObject);
begin
   Label14.Caption:='Для сохранения результатов необходимо авторизоваться';
   //Панель авторизации
      ImageBEnter.Visible:=True;
      ImageLFalse.Visible:=True;
      ImagePFalse.Visible:=True;
      ImageBExit.Visible:=False;
      EditLogin.Visible:=True;
      EditPassword.Visible:=True;
      Label15.Visible:=True;
      Label16.Visible:=True;

   //Личный кабинет
      LabelCount.Visible:=False;
      LabelLevel.Visible:=False;

   SaveResultLearning:=False;
end;

procedure TFMain.Label16Click(Sender: TObject);
begin
   ADOQuery2.Insert;
   Form2.Show;
end;


procedure TFMain.Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Image9.Visible:=True;
end;

procedure TFMain.Image9Click(Sender: TObject);
begin
   FMain.Close;
end;

end.
