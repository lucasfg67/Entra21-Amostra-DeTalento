unit UPapel;

interface

uses
    UEntidade
  , UUtilitarios
  ;

type
  TPAPEL = class(TENTIDADE)
  public
    DESCRICAO: String;
  end;

const
  TBL_PAPEL           = 'PAPEL';
  FLD_PAPEL_DESCRICAO = 'DESCRICAO';

resourcestring
  STR_PAPEL = 'Usu�rio do Sistema';

implementation

end.
