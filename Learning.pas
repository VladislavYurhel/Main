unit Learning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, XPMan;

type
  TFLearning = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    Image4: TImage;
    Image5: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Image6: TImage;
    Label6: TLabel;
    Image7: TImage;
    Label7: TLabel;
    Image8: TImage;
    Label8: TLabel;
    Image9: TImage;
    Label9: TLabel;
    XPManifest1: TXPManifest;
    Image10: TImage;
  procedure WMGetMinMaxInfo(var M: TWMGetMinMaxInfo);
    procedure Button2Click(Sender: TObject);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLearning: TFLearning;

implementation

uses MainMenu;

{$R *.dfm}

{ TForm1 }

procedure TFLearning.WMGetMinMaxInfo(var M: TWMGetMinMaxInfo);
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

procedure TFLearning.Button2Click(Sender: TObject);
begin
   FMain.Show;
   FLearning.Close;
end;

procedure TFLearning.Image6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Image6.Visible:=False;
   Image10.Visible:=True;
end;

procedure TFLearning.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Image6.Visible:=True;
   Image10.Visible:=False;
end;

procedure TFLearning.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FMain.Close;
end;

end.
