module Shmacros
  module Functionals
    
    ##
    #  Provides shortcut to declaring multiple should_route tests if routes are supposed to be REST-style.
    #
    #    should_rest_route # tests routing for all actions
    #    should_rest_route :show, :new, :create # tests routing for listed actions
    #    
    #  In cases such as profile or account where no id is involved use :singular => true option.
    #
    #    should_rest_route :show, :edit, :update, :singular => true
    #
    def should_rest_route *actions
      controller = self.name.gsub(/ControllerTest$/, '').underscore
      options = actions.extract_options!
      plural = options[:singular] ? nil : true
      controller_segment = plural ? controller : controller.singularize
      if plural
        actions = actions.empty? ? [:index, :show, :new, :create, :edit, :update, :destroy] : actions
      else
        actions = actions.empty? ? [:show, :new, :create, :edit, :update, :destroy] : actions
      end

      actions.each do |action|
        case action
        when :index
          method = :get
          url = "/#{controller_segment}"
        when :show
          id = plural && 1
          method = :get
          url = "/#{controller_segment}#{plural && '/1'}"
        when :new
          method = :get
          url = "/#{controller_segment}/new"
        when :create
          method = :post
          url = "/#{controller_segment}"
        when :edit
          id = plural && 1
          method = :get
          url = "/#{controller_segment}#{plural && '/1'}/edit"
        when :update
          id = plural && 1
          method = :put
          url = "/#{controller_segment}#{plural && '/1'}"
        when :destroy
          id = plural && 1
          method = :delete
          url = "/#{controller_segment}#{plural && '/1'}"
        end
        id ||= nil

        route = {:controller => controller, :action => action}
        route.merge!(:id => id) if id
        should_route method, url, route
      end
    end
  end
end

class ActionController::TestCase
  extend Shmacros::Functionals
end