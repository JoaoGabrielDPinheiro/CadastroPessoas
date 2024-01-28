unit uConexao;

interface

  uses SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.DApt;

  type TConexao = class
    private
      FCon: TFDConnection;

      procedure ConfigurarConexao;
    public
      constructor Create;
      destructor Destroy;

      function CriarQuery: TFDQuery;
      function getCon: TFDConnection;
  end;
    const Banco: string = 'C:\database\MINHA_BASE.FDB';
implementation

{ TConexaoModel }

procedure TConexao.ConfigurarConexao;
begin
  FCon.Params.DriverID := 'FB';
  FCon.Params.Database := Banco;
  FCon.Params.UserName := 'SYSDBA';
  FCon.Params.Password := 'masterkey';
  FCon.LoginPrompt     := false;
end;

constructor TConexao.Create;
begin
  FCon := TFDConnection.Create(nil);

  self.ConfigurarConexao;
end;

function TConexao.CriarQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);

  VQuery.Connection := FCon;

  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FCon);
end;

function TConexao.getCon: TFDConnection;
begin
  Result := FCon;
end;

end.
