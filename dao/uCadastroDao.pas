unit uCadastroDao;

interface
  uses SysUtils, FireDac.Comp.Client, uPessoaModel, uCadastroController,
  uConexao;

  type TCadastroDao = class
    private
      FConexao: TConexao;
      Constructor Create;
    public
     procedure Carregar(PessoaModel: TPessoaModel);
     procedure Inserir(PessoaModel: TPessoaModel);

     function getQry(PessoaModel: TPessoaModel): TFDQuery;

  end;

implementation

{ TCadastroDao }

procedure TCadastroDao.Carregar(PessoaModel: TPessoaModel);
var
  VQuery: TFDQuery;
begin
  VQuery := TCadastroController.getInstance.Conexao.CriarQuery;
  try
    VQuery.Open('select * from pessoa');
    try
      PessoaModel.nome            := VQuery.FieldByName('pes_nome').AsString;
      PessoaModel.saldo           := VQuery.FieldByName('pes_saldodevedor').AsCurrency;
      PessoaModel.dataNascimento  := VQuery.FieldByName('pes_datanascimento').AsDateTime;
    finally
      VQuery.Close;
    end;
  finally
    FreeAndNil(VQuery);
  end;

end;

constructor TCadastroDao.Create;
begin
end;

function TCadastroDao.getQry(PessoaModel: TPessoaModel): TFDQuery;
var
  VQuery: TFDQuery;
  VSql: string;
begin
  VQuery := TCadastroController.getInstance.Conexao.CriarQuery;
  try
    VSql :=
    'select * from pessoa';

    if PessoaModel.id <> 0 then
      VSql := VSql + 'where pes_id = '''+PessoaModel.id.ToString+''' ';

    VQuery.Open(VSql);

    Result := VQuery;
  finally
//    FreeAndNil(VQuery);
  end;
end;

procedure TCadastroDao.Inserir(PessoaModel: TPessoaModel);
var
  VQuery: TFDQuery;
  VSql: string;
begin
  VQuery := TCadastroController.getInstance.Conexao.CriarQuery;
  try
    VSql :=
    'INSERT INTO PESSOA (PES_NOME, PES_DATANASCIMENTO, PES_SALDODEVEDOR) '+
    'VALUES('''+PessoaModel.nome+''', '''+DateToStr(PessoaModel.dataNascimento)+''', '''+CurrToStr(PessoaModel.saldo)+''')           ';
    try
      VQuery.SQL.Text := VSql;
      VQuery.ExecSQL;
    finally
      VQuery.Close;
    end;
  finally
    FreeAndNil(VQuery);
  end;


end;

end.
