# require libraries/modules here

require 'nokogiri'
require 'open-uri'
require 'pry'

# class Project
#   @@all = []
#   attr_accessor :image_link, :descrption, :location, :percent_funded
#
#   def initialize
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.reset_all
#     @@all.clear
#   end
#
#  end

def create_project_hash
  # write your code here

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  #doc = Nokogiri::HTML(open("fixtures/kickstarter.html"))

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {}
  end
  projects
end
  #
  # doc.css("post").each do |post|
  #   project = Project.new
  #   project.image_link = post.css("a").text
  #   project.descrption = post.css("bbcard_blurb").text
  #   project.location = post.css("location-name").text
  #   project.percent_funded = post.css("strong").text
  #   projects << project
  # end
  #
  # projects
