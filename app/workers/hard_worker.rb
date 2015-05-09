class HardWorker
  include Sidekiq::Worker
  def perform (name,spreadcount)
    puts "hello"
    puts name
    @postid=name
    if spreadcount<100
      start_limit=rand(100)
    elsif spreadcount>100 and spreadcount<1000
      start_limit=rand(1000)
    end
    rand_ids=(start_limit..start_limit+20).to_a.shuffle
    rand_ids.each do |ids|
      mapping=Mapping.new
      mapping.post_id=@postid
      mapping.user_id=ids
      mapping.save
    end

  end
end
