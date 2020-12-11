#balttle music
set :AMP, 0.4


in_thread(name: :main_loop) do
  with_fx :ping_pong do
    sleep 2
    loop do
      28.times do
        sample :mehackit_robot7, amp: get[:AMP], pan: rrand(-1,1)
        sleep 0.5
      end
    end
  end
  sleep 4
end

use_random_seed 30
use_synth :saw
with_fx :reverb do |rev|
  loop do
    control rev, mix: rrand(0, 0.6)
    r = rrand(0.05, 0.3)
    32.times do
      play chord(:c3, :minor).choose, release: r, cutoff: rrand(110, 130), amp: get[:AMP]
      sleep 0.25
    end
  end
end


