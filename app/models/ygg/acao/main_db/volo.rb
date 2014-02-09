
module Ygg
module Acao
module MainDb

class Volo < Ygg::PublicModel
#  self.table_name = :flights

  establish_connection :acao_sqlserver

  self.table_name = :voli


end

end
end
end
