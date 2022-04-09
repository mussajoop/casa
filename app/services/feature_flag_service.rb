class FeatureFlagService
  SOME_FLAG = "some_flag"
  SHOW_ADDITIONAL_EXPENSES_FLAG = "show_additional_expenses"
  PRINCE_GEORGE_FUND_REQUEST = "prince_george_fund_request"

  def self.is_enabled?(feature_flag_name)
    FeatureFlag.find_by(name: feature_flag_name)&.enabled
  end

  def self.enable!(feature_flag_name)
    FeatureFlag.find_or_create_by(name: feature_flag_name).update!(enabled: true)
  end

  def self.disable!(feature_flag_name)
    FeatureFlag.find_or_create_by(name: feature_flag_name).update!(enabled: false)
  end
end
