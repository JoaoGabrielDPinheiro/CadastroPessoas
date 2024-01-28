unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  uCadastroController, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, uPessoaModel;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
  FPessoa: TPessoaModel;
  FController: TCadastroController;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPessoa     := TPessoaModel.Create;
  FController := TCadastroController.Create;
  DBGrid1.DataSource.DataSet := FController.getQry(FPessoa);

end;

end.
