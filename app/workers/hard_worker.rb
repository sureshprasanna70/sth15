class HardWorker
  include Sidekiq::Worker
  def perform (type,forumid,spreadcount,user_id)
    puts "hello"
    if type==1
      puts forumid
      puts spreadcount
      postid=forumid
      user_id=user_id
      if spreadcount<100
          start_limit=rand(100)
      elsif spreadcount>100 and spreadcount<1000
        start_limit=rand(1000)
      end
      redis_key="user_id_"+postid.to_s
      rand_ids=(0..spreadcount).to_a.shuffle
      existing_keys=$redis.smembers(redis_key)
      prop_ids=rand_ids-existing_keys
      prop_id_twenty=prop_ids[0..2]
      puts prop_id_twenty 
      prop_id_twenty.each do |ind_keys|
        $redis.sadd(redis_key,ind_keys)
        $redis.sadd(ind_keys,postid)
      end
    else
      puts forumid
      puts spreadcount
      puts user_id

      redis_key="user_id_"+forumid.to_s
      puts redis_key
      rand_ids=(0..spreadcount).to_a.shuffle
      
      rand_ids.each do |rand_id|
        puts rand_id
      end
      existing_keys=$redis.smembers(redis_key)
      existing_keys.each do |existing_key|
        puts existing_key
      end
      if not existing_keys.nil?
        prop_ids=rand_ids-existing_keys
      end
      puts prop_ids
      prop_id_twenty=prop_ids[0..2]
      puts prop_id_twenty 
      prop_id_twenty.each do |ind_keys|
        $redis.sadd(redis_key,ind_keys)
        $redis.sadd(ind_keys,postid)
      end
    end
  end
 
end
