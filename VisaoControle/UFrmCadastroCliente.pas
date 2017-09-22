unit UFrmCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UUtilitarios
  , UCliente
  , URegraCRUDCliente
  , URegraCRUDCidade
  , UCidade, Mask
  ;

type
  TFrmCadastroCliente = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edSolicitante: TLabeledEdit;
    edNome: TLabeledEdit;
    edCidade: TLabeledEdit;
    stNomeCidade: TStaticText;
    btnLocalizarCidade: TButton;
    rgTipoPessoa: TRadioGroup;
    edTelefone: TMaskEdit;
    lbTelefone: TLabel;
    edEndereco: TLabeledEdit;
    edCpfCnpj: TMaskEdit;
    lbCpfCnpj: TLabel;
    procedure edCidadeExit(Sender: TObject);
    procedure btnLocalizarCidadeClick(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure edCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCLIENTE: TCLIENTE;

    FRegraCRUDCliente: TRegraCRUDCliente;
    FRegraCRUDCidade:  TRegraCRUDCidade;

  protected
    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

uses
    UOpcaoPesquisa
  , UEntidade
  , UDialogo
  , UFrmPesquisa
  ;

{ TFrmCadastroCliente }

procedure TFrmCadastroCliente.btnLocalizarCidadeClick(Sender: TObject);
begin
  inherited;
  edCidade.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_CIDADE)
    .DefineNomeCampoRetorno(VW_CIDADE_ID)
    .DefineNomePesquisa(STR_CIDADE)
    .AdicionaFiltro(VW_CIDADE_NOME));

  if Trim(edCidade.Text) <> EmptyStr then
    edCidade.OnExit(btnLocalizarCidade);
end;

procedure TFrmCadastroCliente.edCidadeExit(Sender: TObject);
begin
  stNomeCidade.Caption := EmptyStr;
  if Trim(edCidade.Text) <> EmptyStr then
    try
      FRegraCRUDCidade.ValidaExistencia(StrToIntDef(edCidade.Text, 0));
      FCLIENTE.CIDADE := TCIDADE(
      FRegraCRUDCidade.Retorna(StrToIntDef(edCidade.Text, 0)));

      stNomeCidade.Caption := FCLIENTE.CIDADE.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edCidade.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroCliente.edCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F7 then
    btnLocalizarCidade.Click;
end;

procedure TFrmCadastroCliente.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDCliente);
end;

procedure TFrmCadastroCliente.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroCliente.Inicializa;
begin
  inherited;

  DefineEntidade(@FCLIENTE, TCLIENTE);
  DefineRegraCRUD(@FregraCRUDCliente, TRegraCRUDCliente);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(VW_CLIENTE_NOME)
    .DefineNomeCampoRetorno(VW_CLIENTE_ID)
    .DefineNomePesquisa(STR_CLIENTE)
    .DefineVisao(VW_CLIENTE));

  FRegraCRUDCidade := TRegraCRUDCidade.Create;

end;

procedure TFrmCadastroCliente.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroCliente.PreencheEntidade;
begin
  inherited;
  FCLIENTE.NOME        := edNome.Text;
  FCLIENTE.SOLICITANTE := edSolicitante.Text;
  FCLIENTE.CNPJ_CPF    := edCpfCnpj.Text;
  FCLIENTE.TELEFONE    := edTelefone.Text;
  FCLIENTE.ENDERE�O    := edEndereco.Text;
  FCLIENTE.TIPO_PESSOA := TTipoPessoa(rgTipoPessoa.ItemIndex);
end;

procedure TFrmCadastroCliente.PreencheFormulario;
begin
  inherited;
  edNome.Text            := FCLIENTE.NOME;
  edSolicitante.Text     := FCLIENTE.SOLICITANTE;
  edCpfCnpj.Text         := FCLIENTE.CNPJ_CPF;
  edTelefone.Text        := FCLIENTE.TELEFONE;
  edCidade.Text          := IntToStr(FCLIENTE.CIDADE.ID);
  stNomeCidade.Caption   := FCLIENTE.CIDADE.NOME;
  edEndereco.Text        := FCLIENTE.ENDERE�O;
  rgTipoPessoa.ItemIndex := Integer(FCLIENTE.TIPO_PESSOA);
end;

procedure TFrmCadastroCliente.rgTipoPessoaClick(Sender: TObject);
var
  leTipoPessoa: TTipoPessoa;
begin
  leTipoPessoa       := TTipoPessoa(rgTipoPessoa.ItemIndex);
  lbCpfCnpj.Caption  := CNT_TIPO_INSCRICAO_PESSOA[leTipoPessoa];
  edCpfCnpj.EditMask := CNT_TIPO_MASCARA_PESSOA[leTipoPessoa]
end;

end.

