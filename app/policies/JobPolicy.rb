class JobPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def update?
    user.admin?
  end

  def create?
    byebug
    user.admin?
  end

end