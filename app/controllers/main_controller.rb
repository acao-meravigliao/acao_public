require 'date'

class MainController < ApplicationController
  def player
    @files = {}

    tdir = File.join(Rails.root, 'public', 'timelapses')
    pdir = '/timelapses'

    Dir.open(tdir).each do |f|
      next unless f =~ /^(.*)_(\d\d\d\d)(\d\d)(\d\d)_(.*)\.mp4$/

      date = Date.new($2.to_i, $3.to_i, $4.to_i)

      @files[$1] ||= {}
      @files[$1][date] ||= { :title => "Timelapse", :variants => {}, :description => "Timelapse for #{date.to_s}"  }
      @files[$1][date][:variants][$5] = { :file => File.join(pdir, f), :label => $5 }
    end

#    @files.each { |k,v| @files[k] = Hash[@files[k].sort.reverse] }

    @playlist = [
     {
      :image => '/acao.jpg',
      :title => 'Today',
      :description => 'Today Timelapse',
      :file => '/livelapse.m3u8',
     },
     {
      :image => '/acao.jpg',
      :title => 'Live!',
      :description => 'Live camera',
      :file => '/cam.m3u8',
     },
    ]

    @files.each do |name, dates|
      Hash[dates.sort.reverse].each do |date, content|
        @playlist << {
          :image => '/acao.jpg',
          :title => content[:title],
          :description => content[:description],
          :mediaid => "acao_timelapse_#{date.strftime('%Y%m%d')}",
          :sources => content[:variants].map { |k,v| v },
        }
      end
    end

    render :layout => 'fullscreen'
  end

  def live
    if request.env['HTTP_USER_AGENT'] =~ /Android/
      redirect_to '/cam.m3u8'
      return
    end

    response.headers['X-Frame-Options'] = 'GOFORIT'
    response.headers['X-XSS-Protection'] = '0'
    render :layout => 'fullscreen'
  end

  def find_video
    @mediaid = params[:mediaid]

    if !(@mediaid =~ /^(.*)_(\d\d\d\d)(\d\d)(\d\d)$/)
      render :status => 404
      return
    end

    @date = Date.new($2.to_i, $3.to_i, $4.to_i)

    if $1 == 'acao_timelapse'
      @title = "ACAO Timelapse #{@date.strftime('%Y-%m-%d')}"
      @description = "Timelapse for ACAO Webcam recorded on #{@date.strftime('%Y-%m-%d')}"
      @dir = 'timelapses'
      @source = 'cam'
    else
      render :status => 404
      return
    end

    @timestamp = @date.strftime('%Y%m%d')

    tdir = File.join(Rails.root, 'public', @dir)
    pdir = '/' + @dir

    @variants = {}
    Dir.open(tdir).each do |f|
      next unless f =~ /^#{@source}_#{@timestamp}_(.*)\.mp4$/

      @variants[$1] = { :file => File.join(pdir, f), :label => $1 }
    end

    @variants.sort

    @sources = @variants.map { |k,v| v }
    @file_url = root_url + @variants.values.first[:file]
  end

  def video
    find_video
  end

  def embed
    find_video

    render :layout => 'embed'
  end
end
