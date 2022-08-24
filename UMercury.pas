unit UMercury;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Grids, DBGrids, GradBtn, Db, DBTables;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Volume: TTrackBar;
    Balance: TTrackBar;
    ImageParar: TImage;
    BParar: TShape;
    ImageProxima: TImage;
    ImageAbrir: TImage;
    ImagePause: TImage;
    ImagePlay: TImage;
    ImageAnterior: TImage;
    ImageInterromper: TImage;
    ImageLoop: TImage;
    ImageGrafico: TImage;
    ImageSobre: TImage;
    ImagePlayList: TImage;
    BAnterior: TShape;
    BPlay: TShape;
    BProxima: TShape;
    BAbrir: TShape;
    BPause1: TShape;
    BPause2: TShape;
    GradBtn2: TGradBtn;
    GradBtn1: TGradBtn;
    Playlist: TGradBtn;
    TimerPlayList1: TTimer;
    TimerPlayList2: TTimer;
    TMusica: TTable;
    DSMusica: TDataSource;
    TMusicaNome: TStringField;
    TMusicaTempo: TStringField;
    TMusicaNomeCompleto: TStringField;
    Image2: TImage;
    DBGrid1: TDBGrid;
    TimerLista: TTimer;
    procedure ImagePararMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImagePararMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageAnteriorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageAnteriorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImagePlayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImagePlayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageProximaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageProximaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageAbrirMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageAbrirMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImagePauseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImagePauseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerPlayList1Timer(Sender: TObject);
    procedure TimerPlayList2Timer(Sender: TObject);
    procedure PlaylistClick(Sender: TObject);
    procedure TimerListaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ImagePararMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BParar.Visible:=true;
end;

procedure TForm1.ImagePararMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BParar.visible:=false;
end;

procedure TForm1.ImageAnteriorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Banterior.visible:=true;
end;

procedure TForm1.ImageAnteriorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Banterior.visible:=false;
end;

procedure TForm1.ImagePlayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BPlay.visible:=true;
end;

procedure TForm1.ImagePlayMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BPlay.visible:=false;
end;

procedure TForm1.ImageProximaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Bproxima.visible:=true;
end;

procedure TForm1.ImageProximaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Bproxima.visible:=false;
end;

procedure TForm1.ImageAbrirMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BAbrir.visible:=true;
end;

procedure TForm1.ImageAbrirMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BAbrir.Visible:=false;
end;

procedure TForm1.ImagePauseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Bpause1.visible:=true;
  Bpause2.visible:=true;
end;

procedure TForm1.ImagePauseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Bpause1.visible:=false;
  Bpause2.visible:=false;
end;

procedure TForm1.TimerPlayList1Timer(Sender: TObject);
begin
    if playlist.top<352 then
      begin
        playlist.top:=playlist.top+8;
        image2.height:=image2.height+8;
        GradBtn1.Height:=gradbtn1.height+8;
        GradBtn2.Height:=GradBtn2.Height+8;
        form1.Height:=form1.height+8;
      end
    else
      begin
        TimerLista.enabled:=true;
        timerPlayList1.Enabled:=false;
        playlist.Enabled:=true;

      end;
end;

procedure TForm1.TimerPlayList2Timer(Sender: TObject);
begin
    if playlist.top>120 then
      begin
        playlist.top:=playlist.top-8;
        GradBtn1.Height:=gradbtn1.height-8;
        GradBtn2.Height:=GradBtn2.Height-8;
        image2.height:=image2.Height-8;
        form1.Height:=form1.height-8;
      end
    else
      begin
        timerPlayList2.Enabled:=false;
        dbgrid1.Height:=0;
        dbgrid1.Visible:=true;
        playlist.Enabled:=true;
      end;
end;

procedure TForm1.PlaylistClick(Sender: TObject);
begin
  if playlist.top=120 then
    begin
      TimerPlayList1.enabled:=true;
      playlist.Enabled:=false;
    end
  else
    begin
      TimerPlayList2.Enabled:=true;
      dbgrid1.Visible:=false;
      playlist.enabled:=false;
    end;

end;

procedure TForm1.TimerListaTimer(Sender: TObject);
begin
    if Dbgrid1.height<190 then
      begin
        dbgrid1.height:=dbgrid1.height+10;
      end
    else
      begin
        TimerLista.enabled:=false;

      end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Brush.Style:=bsclear;
end;

end.
