# frozen_string_literal: true

class Variable < ApplicationRecord
  translates :description
  extend FriendlyId
  friendly_id :name

  has_and_belongs_to_many(:variables,
                          class_name: 'Variable',
                          join_table: 'links',
                          foreign_key: 'link_to',
                          association_foreign_key: 'link_from')

  has_and_belongs_to_many(:reversed_variables,
                          class_name: 'Variable',
                          join_table: 'links',
                          foreign_key: 'link_from',
                          association_foreign_key: 'link_to')

  def has_formula?
    spec['formulas'].present?
  end

  def value_type
    spec['valueType']
  end
end
