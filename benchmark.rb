require 'benchmark/ips'
require_relative 'new_hash.rb'




Benchmark.ips do |x|
    h = Hash.new
    m_h = NewHash.new
    #100.times { |n| h[n] = n }
    #100.times { |n| m_h[n] = n }
    x.report("original_hash_add") { 1_000_000.times do |n|
                                h["#{n}"] = n
                                  end }
    x.report("my_hash_add") { 1_000_000.times do |n|
                            m_h["#{n}"] = n
                          end }
  
  #   x.report("origina_hash_get") { 100000.times do |n|
  #                              h[n]
  #                              end }
  #   x.report("my_hash_get") { 100000.times do |n|
  #                            m_h[n]
  #                            end }
  #   x.report("original_hash_delete") { 1000000.times do |n|
  #                                h.delete(n)
  #                                end }
  # x.report("my_hash_delete") { 1000000.times do |n|
  #                      m_h.delete(n)
  #                    end }
  #   x.report("origina_hash_keys") { h.keys }
  #   x.report("my_hash_keys") { m_h.keys }
  
  
  x.compare!
  
  end