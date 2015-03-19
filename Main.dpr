program Main;

uses
  Forms,
  MainMenu in 'MainMenu.pas' {FMain},
  Video in 'Video.pas' {FVideo},
  WordTranslate in 'WordTranslate.pas' {FWordTranslate},
  Learning in 'Learning.pas' {FLearning},
  Registered in 'Registered.pas' {FRegister},
  Unit1 in 'Unit1.pas' {Form1},
  SingUp in 'SingUp.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFRegister, FRegister);
  Application.CreateForm(TFVideo, FVideo);
  Application.CreateForm(TFWordTranslate, FWordTranslate);
  Application.CreateForm(TFLearning, FLearning);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
