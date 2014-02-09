
module Ygg
module Acao
module MainDb

class Socio < Ygg::PublicModel
  establish_connection :acao_sqlserver

  self.table_name = :soci_dati_generale

end

end
end
end
