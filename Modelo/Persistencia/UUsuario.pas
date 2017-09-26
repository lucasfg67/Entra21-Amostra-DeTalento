unit UUsuario;

interface

uses
    UEntidade
   , UUtilitarios
    ;

type
  TUSUARIO = class (TENTIDADE)
  public
    LOGIN: String;
    NOME : String;
    SENHA: String;
    DESCRICAO_SERVICO : String;
    PAPEL : TPapelUsuario;
    PERMISSOES : TListaPermissoesUsuario;
  end;

const

  TBL_USUARIO                   = 'USUARIO';
  FLD_USUARIO_DESCRICAO_SERVICO = 'DESCRICAO_SERVICO';
  FLD_USUARIO_LOGIN             = 'LOGIN';
  FLD_USUARIO_NOME              = 'NOME';
  FLD_USUARIO_SENHA             = 'SENHA';
  FLD_USUARIO_ID_PAPEL          = 'ID_PAPEL';

  VW_USUARIO                    = 'VW_USUARIO';
  VW_USUARIO_NOME               = 'Nome';
  VW_USUARIO_LOGIN              = 'Login';
  VW_USUARIO_ID                 = 'C�d.';
  VW_USUARIO_DESCRICAO_SERVICO  = 'Descri��o do Servi�o';

  resourcestring

  STR_USUARIO = 'Usuario do Sistema';


implementation

end.
