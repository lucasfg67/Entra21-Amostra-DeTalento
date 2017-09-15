unit UMaterial;

interface

uses
    UEntidade
    ;

type
  TMaterial= class (TENTIDADE)
  public
    DESCRICAO     : String;
    VALOR_UNITARIO: Double;
  end;

const
  TBL_MATERIAL                = 'MATERIAL';
  FLD_MATERIAL_DESCRICAO      = 'DESCRICAO';
  FLD_MATERIAL_VALOR_UNITARIO = 'VALOR_UNITARIO';

  VW_MATERIAL                 = 'VW_MATERIAL';
  VW_MATERIAL_DESCRICAO       = 'Descri��o';
  VW_MATERIAL_VALOR_UNITARIO  = 'Valor Unit�rio';
  VW_MATERIAL_ID              = 'C�d.';

  resourcestring

  STR_MATERIAL                  = 'Material';

implementation

end.
