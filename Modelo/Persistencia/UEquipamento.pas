unit UEquipamento;

interface

uses
    UEntidade
    ;

type
  TEQUIPAMENTO = class (TENTIDADE)
  public
    NOME    : String;
    MARCA   : String;
    N_SERIE : String;
  end;

const

  TBL_EQUIPAMENTO         = 'EQUIPAMENTO';
  FLD_EQUIPAMENTO_NOME    = 'NOME';
  FLD_EQUIPAMENTO_MARCA   = 'MARCA';
  FLD_EQUIPAMENTO_N_SERIE = 'N_SERIE';

  VW_EQUIPAMENTO          = 'VW_EQUIPAMENTO';
  VW_EQUIPAMENTO_NOME     = 'Nome';
  VW_EQUIPAMENTO_MARCA    = 'Marca';
  VW_EQUIPAMENTO_N_SERIE  = 'N�mero de S�rie';
  VW_EQUIPAMENTO_ID       = 'C�d.';

  resourcestring

  STR_EQUIPAMENTO = 'Equipamento';

implementation

end.
