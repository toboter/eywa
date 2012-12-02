class PopulateTypeInAccounts < ActiveRecord::Migration
  def up
  	Account.all.each do |a|
      a.update_attribute :type, 'User'
    end
  end
end
