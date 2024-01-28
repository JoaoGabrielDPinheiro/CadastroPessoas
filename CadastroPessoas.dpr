program CadastroPessoas;

uses
  Vcl.Forms,
  FPrincipal in 'view\FPrincipal.pas' {frmPrincipal},
  uPessoaModel in 'model\uPessoaModel.pas',
  uCadastroDao in 'dao\uCadastroDao.pas',
  uConexao in 'dao\uConexao.pas',
  uCadastroController in 'controller\uCadastroController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
