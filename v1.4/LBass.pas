{$mode delphi}
Unit LBass;
 // version 0.2

INTERFACE
 Uses Windows,
      BassFPC;

 Const
      MaxStream = 30;

 type
     TBass = object
      // Inum      : Integer;
      Stream    : Array[1..MaxStream] of  HStream;
      Procedure InitBass;
      Procedure DoneBass;
       // wav,mp3,ogg
      Procedure load(name:string;num:integer);
      Procedure play(num:integer;Loop:boolean);
      Procedure stop(num:integer);
       // mod,s3m,xm,mod
      Procedure load_music(name:string;num:integer;Loop:boolean);
      Procedure play_music(num:integer);
     end;


IMPLEMENTATION

// TBass.
Procedure TBass.InitBass;
 Begin
   if BASS_GetVersion() <> MAKELONG(2,0) then begin Halt; end;
   if not BASS_Init(1, 44100, 0, 0, nil) then begin end;
 End;

Procedure TBass.DoneBass;
 var inum: integer;
 Begin
  for Inum:= 1 to MaxStream do begin
                                BASS_StreamFree(stream[Inum]);
                               end;
  BASS_Free();
 End;

Procedure TBass.load(name:string;num:integer);
 var
   p  :  PChar;
 Begin
   p := PChar(name);

   stream[num] :=BASS_StreamCreateFile(FALSE,p,0,0,0);
   if (stream[num] = 0) then begin end;
 End;

Procedure TBass.play(num:integer;Loop:boolean);
 Var Lf: byte;
 Begin
   if Loop = True then begin Lf:=4; end
                                     else
                       begin Lf:=0; end;
   if not BASS_StreamPlay(stream[num], FALSE, Lf) then begin end;
 End;

procedure TBass.stop(num:integer);
 Begin
   BASS_ChannelStop(stream[num]);
 End;

Procedure TBass.load_music(name:string;num:integer;Loop:boolean);
 var
   p  : PChar;
   Lf : byte;
 Begin
   p := PChar(name);
   if Loop = True then begin Lf:=BASS_MUSIC_LOOP; end
                                                   else
                       begin Lf:=0; end;
   stream[num] :=BASS_MusicLoad(FALSE,p,0,0,Lf,0);
   if (stream[num] = 0) then begin end;
 End;

Procedure TBass.play_music(num:integer);
 Begin
   if not BASS_MusicPlay(stream[num]) then begin end;
 End;
end.
