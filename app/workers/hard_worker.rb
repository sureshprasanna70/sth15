class HardWorker
  include Sidekiq::Worker
  def perform (name,spreadcount,user_id)
    puts "hello"
    puts name
    puts spreadcount
    @postid=name
    if spreadcount<100
      start_limit=rand(100)
    elsif spreadcount>100 and spreadcount<1000
      start_limit=rand(1000)
    end
    redis_key="user_id_"+@postid.to_s
    rand_ids=(0..spreadcount).to_a.shuffle
    existing_keys=$redis.smembers(redis_key)
    prop_ids=rand_ids-existing_keys
    prop_id_twenty=prop_ids[0..20]
    puts prop_id_twenty 
    prop_id_twenty.each do |ind_keys|
      $redis.sadd(redis_key,ind_keys)
      $redis.sadd(ind_keys,@postid)
    end
  end
end
