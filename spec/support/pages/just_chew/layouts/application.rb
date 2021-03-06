module JustChew::Spec::Layouts

  module Application
    extend ActiveSupport::Concern

    require_relative './application/components'

    class Header < SitePrism::Section
      element  :logo,     '.navbar-brand img'
      elements :items,    '.navbar-nav .nav-item'
      element  :sign_in,  '.navbar-nav .nav-link', text: 'Sign in'
      element  :sign_out, '.navbar-nav .nav-link', text: 'Sign out'
      element  :sign_up,  '.navbar-nav .nav-link', text: 'Sign up'
      element  :profile,  '.navbar-nav .nav-link', text: 'Profile'
      section  :order_type_toggle, Components::OrderTypeToggle, '#order-preference-toggle'
    end

    class Footer < SitePrism::Section

      class SocialMedia < SitePrism::Section
        elements :links,       '.navbar .nav-link'
        element  :icons,       '.navbar .nav-link .fa'
        element  :twitter,     '.navbar .nav-link .fa-twitter'
        element  :facebook,    '.navbar .nav-link .fa-facebook'
        element  :google_plus, '.navbar .nav-link .fa-google-plus'
      end

      section :social_media, SocialMedia, '#social-media'
      element :copyleft, '#copyleft'
    end

    included do
      section :header, Header, 'header.main'
      section :footer, Footer, 'footer.main'
    end
  end
end
