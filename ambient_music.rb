#ambient music for game
live_loop :main do
  use_synth :dtri
  with_fx :ping_pong do
    loop do
      notes = (scale :D, :yu).shuffle
      play notes.tick, release: 0.20, cutoff: 80, amp: 0.25
      sleep 0.25
      cue :tick
    end
  end
end


in_thread do
  with_fx :reverb do
    use_synth :dark_ambience
    loop do
      sync :tick
      play (scale :B, :minor_pentatonic).shuffle.tick, amp: 0.5
    end
  end
end
