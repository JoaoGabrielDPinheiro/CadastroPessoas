unit uPessoaModel;

interface
  uses SysUtils, FireDAC.Comp.Client;

  type TPessoaModel = class

  private
    FdataNascimento: TDate;
    Fid: integer;
    Fsaldo: Currency;
    Fnome: string;

    procedure SetdataNascimento(const Value: TDate);
    procedure Setid(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setsaldo(const Value: Currency);
  public
    property id: integer read Fid write Setid;
    property nome: string read Fnome write Setnome;
    property dataNascimento: TDate read FdataNascimento write SetdataNascimento;
    property saldo: Currency read Fsaldo write Setsaldo;

    procedure Carregar;
    procedure Inserir;
    function getQry(PessoaModel: TPessoaModel): TFDQuery;
  end;


implementation

{ TPessoaModel }

uses uCadastroDao;

procedure TPessoaModel.Carregar;
var
  VCadastroDao: TCadastroDao;
begin
  VCadastroDao := TCadastroDao.Create;
  try
    VCadastroDao.Carregar(Self)
  finally
    FreeAndNil(VCadastroDao);
  end;
end;

function TPessoaModel.getQry(PessoaModel: TPessoaModel): TFDQuery;
var
  VCadastroDao: TCadastroDao;
begin
  VCadastroDao := TCadastroDao.Create;
  try
    VCadastroDao.getQry(Self)
  finally
    FreeAndNil(VCadastroDao);
  end;
end;
procedure TPessoaModel.Inserir;
var
  VCadastroDao: TCadastroDao;
begin
  VCadastroDao := TCadastroDao.Create;
  try
    VCadastroDao.Inserir(Self)
  finally
    FreeAndNil(VCadastroDao);
  end;
end;

procedure TPessoaModel.SetdataNascimento(const Value: TDate);
begin
  FdataNascimento := Value;
end;

procedure TPessoaModel.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPessoaModel.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TPessoaModel.Setsaldo(const Value: Currency);
begin
  Fsaldo := Value;
end;

end.
