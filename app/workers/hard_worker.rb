class HardWorker
  include Sidekiq::Worker
  def perform (type,forumid,spreadcount,user_id)
    puts "hello"
    if type==1
      puts "Spreadcount"+forumid.to_s+"spreadcount"+spreadcount+"user_id"+user_id
      puts spreadcount
      postid=forumid
      user_id=user_id
      if spreadcount<100
        start_limit=rand(100)
      elsif spreadcount>100 and spreadcount<1000
        start_limit=rand(1000)
      end
      redis_key="user_id_"+postid.to_s
      int_ids=(0..spreadcount).to_a.shuffle
      rand_ids=int_ids.map(&:to_s)
      existing_keys=$redis.smembers(redis_key)
      prop_ids=rand_ids-existing_keys
      prop_id_twenty=prop_ids[0..2]
      prop_id_twenty.delete(user_id)
      puts prop_id_twenty 
      prop_id_twenty.each do |ind_keys|
        $redis.sadd(redis_key,ind_keys)
        $redis.sadd(ind_keys,postid)
      end
    else
      puts "Spreadcount"+forumid.to_s+"spreadcount"+spreadcount+"user_id"+user_id
      redis_key="user_id_"+forumid.to_s
      int_ids=(0..spreadcount).to_a.shuffle
      rand_ids=int_ids.map(&:to_s)
      existing_keys=$redis.smembers(redis_key)
      if not existing_keys.nil?
        prop_ids=rand_ids-existing_keys
      end
      prop_id_twenty=prop_ids[0..2]
      prop_id_twenty.delete(user_id)
      puts prop_id_twenty 
      prop_id_twenty.each do |ind_keys|
        $redis.sadd(redis_key,ind_keys)
        $redis.sadd(ind_keys,postid)
      end
    end
  end
end
