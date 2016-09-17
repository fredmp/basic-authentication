class RenamePasswordToPasswordDigestInUser < ActiveRecord::Migration[5.0]
  change_table :users do |t|
    t.rename :password, :password_digest
  end
end
