unit UTecnico;

interface

uses
    UEntidade
    ;

type
  TTECNICO = class (TENTIDADE)
  public
    NOME: String;
    VALOR_HORA : Double;
  end;

const

  TBL_TECNICO            = 'TECNICO';
  FLD_TECNICO_NOME       = 'NOME';
  FLD_TECNICO_VALOR_HORA = 'VALOR_HORA';

  VW_TECNICO            = 'VW_TECNICO';
  VW_TECNICO_NOME       = 'Nome';
  VW_TECNICO_VALOR_HORA = 'Pre�o Hora';
  VW_TECNICO_ID          = 'C�d.';

  resourcestring

  STR_TECNICO = 'Tecnico';

implementation

end.
