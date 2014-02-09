
module Ygg
module Acao

class FlightsController < Ygg::Hel::RestController
  ar_controller_for Ygg::Acao::Flight

  view :grid do
    empty!
    attribute(:id) { show! }
    attribute(:uuid) { show! }
    attribute(:takeoff_at) { show! }
    attribute(:towplane_landing_at) { show! }
    attribute(:landing_at) { show! }
    attribute(:quota) { show! }
    attribute(:bollini_volo) { show! }
    attribute(:plane) do
      include!
      empty!
      attribute(:registration) { show! }
    end
    attribute(:towplane) do
      include!
      empty!
      attribute(:registration) { show! }
    end

    attribute(:plane_pilot1) do
      include!
      empty!
      attribute(:first_name) { show! }
      attribute(:last_name) { show! }
    end

    attribute(:plane_pilot2) do
      include!
      empty!
      attribute(:first_name) { show! }
      attribute(:last_name) { show! }
    end
  end

  view :edit do
    attribute(:plane) do
      include!
    end
    attribute(:towplane) do
      include!
    end

    attribute(:plane_pilot1) do
      include!
    end
    attribute(:plane_pilot2) do
      include!
    end

    attribute(:towplane_pilot1) do
      include!
    end
    attribute(:towplane_pilot2) do
      include!
    end
  end

end

end
end
