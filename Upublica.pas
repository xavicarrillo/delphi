unit Upublica;

interface
uses IBCustomDataSet, uDMmain,umain;

//procedure actualitza(taula:Tibcustomdataset);
function estaFormulari(formulari:string):boolean;

implementation

 {procedure actualitza(taula:Tibcustomdataset);
   begin
        //Fproveidors.setfocus;//hem de treure-li el focus o sino no insereix be
        DMmain.MainTransaction.Commit;
        DMmain.MainTransaction.Active:=true;
        taula.active:=true;
        //taula.CachedUpdates:=true;  //es necessari que estigui a true, sino el applyUpdates peta
        //DMmain.DBaok.ApplyUpdates([taula]);
        taula.ApplyUpdates;
        taula.close;
        taula.open;
   end;
  }
 function estaFormulari(formulari:string):boolean;

    var I: integer;

    begin
       with fMain do
         for I:= MDIChildCount-1 downto 0 do begin
          if MDIChildren[I].name=formulari then estaFormulari := true
          else estaFormulari := false;
         end;
    end;

end.
