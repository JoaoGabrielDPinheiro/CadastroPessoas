unit uCadastroController;

interface
  uses SysUtils, uConexao, uPessoaModel,  FireDAC.Comp.Client;

  type TCadastroController = class
    FConexao: TConexao;
    FPessoa: TPessoaModel;
    class var Finstace: TCadastroController;
    constructor Create;
    destructor Destroy;
    class function getInstance: TCadastroController;

    property Conexao: TConexao read FConexao write FConexao;
    property Pessoa: TPessoaModel read FPessoa write FPessoa;
    public
    procedure Carregar;
    procedure Inserir;
    function getQry(PessoaModel: TPessoaModel): TFDQuery;
  end;

implementation

{ TCadastroController }

uses uCadastroDao;

procedure TCadastroController.Carregar;
begin
  FPessoa.Carregar;
end;

constructor TCadastroController.Create;
begin
  FConexao := TConexao.Create;
  FPessoa  := TPessoaModel.Create;
end;

destructor TCadastroController.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FPessoa);
end;

class function TCadastroController.getInstance: TCadastroController;
begin
  if not Assigned(Self.Finstace) then
     Self.Finstace := TCadastroController.Create;

  Result := Self.Finstace;
end;

function TCadastroController.getQry(PessoaModel: TPessoaModel): TFDQuery;
var
  VCadastroDAO: TCadastroDAO;
begin
  VCadastroDAO := TCadastroDAO.Create;
  try
    VCadastroDAO.getQry(PessoaModel);
  finally
//    FreeAndNil(VCadastroDAO);
  end;
end;

procedure TCadastroController.Inserir;
begin
  FPessoa.Inserir;
end;

end.
