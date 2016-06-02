# coding: utf-8
#


require 'digest/md5'
require 'rest_client'
require 'optparse'
require 'net/ssh'

require 'uri'
require 'pp'
require 'base64'
require 'erb'
require 'uri'
include ERB::Util

require 'rest_client'
require 'digest/md5'

require 'uri'
require 'erb'
require 'pp'

include ERB::Util

options = {}
option_parser = OptionParser.new do |opts|
    opts.banner = 'ia hook'


    options[:password] = "12345678"

    opts.on('-s sequence', '--sequence sequence', 'sequence') do |value|
        options[:sequence] = value
    end


end.parse!


if options[:sequence] == nil then
    puts "input wrong, see -h."
    exit
end



url = "http://s1.idle.game.u77.com/f2.aspx?x=&_=" + options[:sequence]
p url
resp = RestClient.get url , {:cookies => {
    'ASP.NET_SessionId' => "50q4nuiorvtvmc1shxi1hb3d", 
    :Hm_lvt_6c48009a7a7c700db9726e1b246444bd => "1424070518", 
    :Hm_lpvt_6c48009a7a7c700db9726e1b246444bd => "1424070569",
    :_marrla_uid_ => "OVOCPgqVc8tJmqtLi%2bUJkkcy4gOzieDcjQinVwdqeS0%3d",
    :_idle_chara_id_ => "GLy836914VQ%3d", 
#     :Hm_lvt_230a8010ff1ce989519d1f32d71d80e0 => "1424070529,1424070544,1424070571",
    :Hm_lpvt_230a8010ff1ce989519d1f32d71d80e0 => "1424072092", 
    :Hm_lvt_b195e32916bcc4e0a237a94e4afe72f6 => "1424070641", 
    :Hm_lpvt_b195e32916bcc4e0a237a94e4afe72f6 => "1424072092"
}} 
PP.pp JSON.parse(resp)

