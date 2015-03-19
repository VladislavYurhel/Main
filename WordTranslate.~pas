unit WordTranslate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMan, StdCtrls, DB, ADODB, Buttons, DBCtrls;

type
  TFWordTranslate = class(TForm)
    SlotOne: TImage;
    XPManifest1: TXPManifest;
    LabelTitle: TLabel;
    ButtonHome: TButton;
    DataSource1: TDataSource;
    LabelWord: TLabel;
    LabelSubTitle: TLabel;
    LabelListen: TLabel;
    ImgListenFalse: TImage;
    ImgListenTrue: TImage;
    ImgExitTrue: TImage;
    ImgExitFalse: TImage;
    LabelWordList: TLabel;
    ListBoxWord: TListBox;
    ButtonNext: TButton;
    LabelCorrect: TLabel;
    ButtonRepeat: TButton;
    Label1: TLabel;
  procedure WMGetMinMaxInfo(var M:TWMGetMinMaxInfo); message WM_GetMinMaxInfo;
    procedure ButtonHomeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BW2(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonPrevClick(Sender: TObject);
    procedure ImgListenFalseMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SlotOneMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImgExitFalseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImgExitTrueMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonNextClick(Sender: TObject);
    procedure ListBoxWordMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonRepeatClick(Sender: TObject);
  private

  public

  end;

var
  FWordTranslate: TFWordTranslate;
  But:TBitBtn;
  mass:array of TBitBtn;
  arrayForDataBase:array of string;
  CountTranslate,CorrectAnswer,colcount:integer;

implementation

uses MainMenu;

{$R *.dfm}

{ TFWordTranslate }

procedure TFWordTranslate.WMGetMinMaxInfo(var M: TWMGetMinMaxInfo);
begin
   M.MinMaxInfo^.PTMaxSize.X:=800;
   M.MinMaxInfo^.PTMaxPosition.X:=0;

   M.MinMaxInfo^.PTMaxTrackSize.X:=884;
   M.MinMaxInfO^.PTMinTrackSize.X:=884;

   M.MinMaxInfo^.PTMaxSize.Y:=600;
   M.MinMaxInfo^.PTMaxPosition.Y:=0;

   M.MinMaxInfo^.PTMaxTrackSize.Y:=584;
   M.MinMaxInfo^.PTMinTrackSize.Y:=584;
end;

procedure TFWordTranslate.ButtonHomeClick(Sender: TObject);
begin
   FWordTranslate.Hide;
   FMain.Show;
end;

procedure TFWordTranslate.FormCreate(Sender: TObject);
var
   id,i,colCount:integer;
   textForArray,textForButton,arrayForTransc:string;
begin
   CountTranslate:=0;
   ColCount:=DataSource1.DataSet.RecordCount;
   SetLength(arrayForDataBase,ColCount);
   SetLength(arrayForTransc,ColCount);
   SetLength(mass,ColCount);

   LabelCorrect.Caption:='Правильно: ' + IntToStr(CorrectAnswer) + ' / ' + IntToStr(ColCount);
   i:=0;
      LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
      LabelListen.Caption:=DataSource1.DataSet.Fields[3].AsString;
   for i:=0 to ColCount-1 do
      begin
         textForArray:=DataSource1.DataSet.FieldByName('RUS').AsString;
         arrayForDataBase[i]:=textForArray;
         DataSource1.DataSet.Next;
      end;

   for i:=1 to 4 do
      begin
         but:=TBitBtn.Create(Application);
         but.Parent:=FWordTranslate;
         but.OnClick:=BW2;
         but.Tag:=i;

         but.Height:=30;
         but.Width:=150;

         if (i >= 1) and (i < 2) then
            begin
               but.Left:=450;
               but.Top:=35*i+255;
            end;
         if (i >= 2) and (i < 3) then
            begin
               but.Left:=450;
               but.Top:=35*i+115; //255
            end;
         if (i >= 3) and (i < 4) then
            begin
               but.Left:=450;
               but.Top:=35*i+150; //185
            end;
         if (i >= 4) and (i < 5) then
            begin
               but.Left:=450;
               but.Top:=35*i+80
            end;
         mass[i]:=but;
         mass[i].Tag:=i;
      end;

   i:=0;
   for i:=0 to 5 do
      mass[i+1].Caption:=arrayForDataBase[i];
   DataSource1.DataSet.FindFirst;

   DataSource1.DataSet.First;
   for i:=0 to ColCount-1 do
      begin
         ListBoxWord.Items.Add(DataSource1.DataSet.Fields[1].AsString);
         DataSource1.DataSet.Next;
      end;
   DataSource1.DataSet.First;
end;

procedure TFWordTranslate.BW2(Sender: TObject);
var
   id:string;
   i,arrIndex:integer;
begin
   colcount:=DataSource1.DataSet.RecordCount;
   if (Sender as TBitBtn).Tag = DataSource1.DataSet.Fields[0].AsInteger then
      begin
         inc(i);
         Application.MessageBox('Правильно','Результат');
         FMain.ADOQuery1.Edit;
         FMain.ADOQuery1.FieldByName('Complete').AsInteger := 1;
         FMain.ADOQuery1.Post;
         inc(CorrectAnswer);

         (Sender as TBitBtn).Tag := (Sender as TBitBtn).Tag + 4;
         //(Sender as TBitBtn).Caption:=mass[i+3].Caption;

         ListBoxWord.ItemIndex:=DataSource1.DataSet.Fields[0].AsInteger;
         LabelCorrect.Caption:='Правильно: ' + IntToStr(CorrectAnswer) + ' / ' + IntToStr(ColCount);
         DataSource1.DataSet.Next;
         countTranslate:=countTranslate + 1;
         LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
         LabelListen.Caption:=DataSource1.DataSet.Fields[3].AsString;
         FMain.Label2.Caption:='Уже переведено: ' + IntToStr(CountTranslate);
      end
   else
      begin
         Application.MessageBox('Вы ошиблись','Результат');
         ListBoxWord.ItemIndex:=DataSource1.DataSet.Fields[0].AsInteger;
         DataSource1.DataSet.Next;
         LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
         LabelListen.Caption:=DataSource1.DataSet.Fields[3].AsString;
      end;
end;

procedure TFWordTranslate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FMain.Close;
end;

procedure TFWordTranslate.ButtonPrevClick(Sender: TObject);
begin
   DataSource1.DataSet.Prior;
   LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
end;

procedure TFWordTranslate.ImgListenFalseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ImgListenFalse.Visible:=False;
   ImgListenTrue.Visible:=True;
end;

procedure TFWordTranslate.SlotOneMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ImgListenTrue.Visible:=False;
   ImgListenFalse.Visible:=True;
   ImgExitTrue.Visible:=False;
   ImgExitFalse.Visible:=True;
end;

procedure TFWordTranslate.ImgExitFalseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ImgExitFalse.Visible:=False;
   ImgExitTrue.Visible:=True;
end;

procedure TFWordTranslate.ImgExitTrueMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FWordTranslate.Close;
   FMain.Close;
end;

procedure TFWordTranslate.ButtonNextClick(Sender: TObject);
begin
   ListBoxWord.ItemIndex:=StrToInt(DataSource1.DataSet.Fields[0].AsString);
   DataSource1.DataSet.Next;
   LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
   LabelListen.Caption:=DataSource1.DataSet.Fields[3].AsString;
end;

procedure TFWordTranslate.ListBoxWordMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   i:integer;
begin
   DataSource1.DataSet.First;
   DataSource1.DataSet.MoveBy(ListBoxWord.ItemIndex);
   LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
   LabelListen.Caption:=DataSource1.DataSet.Fields[3].AsString;
   
end;

procedure TFWordTranslate.ButtonRepeatClick(Sender: TObject);
begin
   if Application.MessageBox('Вы действительно хотите аннулировать прогресс?','Начать сначала',MB_YESNO) = IDYES then
      begin
         CorrectAnswer:=0;
         DataSource1.DataSet.First;
         LabelWord.Caption:=DataSource1.DataSet.Fields[1].AsString;
         LabelListen.Caption:=DataSource1.DataSet.Fields[2].AsString;
         ListBoxWord.ItemIndex:=0;
         LabelCorrect.Caption:='Правильно: ' + IntToStr(CorrectAnswer) + ' / ' + IntToStr(ColCount);
      end;
end;

end.
