unit UPais;

interface
uses
   UEntidade
   ;

type
    TPAIS = class (TENTIDADE)
    public
    NOME:  String;
    SIGLA: String;
    end;
const
  TBL_PAIS       = 'PAIS';
  FLD_PAIS_NOME  = 'NOME';
  FLD_PAIS_SIGLA = 'SIGLA';

  VW_PAIS        = 'VW_PAIS';
  VW_PAIS_NOME   = 'Pa�s';
  VW_PAIS_SIGLA  = 'Sigla';
  VW_PAIS_ID     = 'C�d.';

  resourcestring

  STR_PAIS = 'Pa�s';


implementation

end.
