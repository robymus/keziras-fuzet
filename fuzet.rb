require 'prawn'

# everything in mm
baseline_h = 12
misclines = true
margin = 20
page_size = [210, 297]

baseline_width = 0.25
baseline_color = '404040'
miscline_width = 0.1
miscline_color = 'a0a0f0'

def usage_exit
	STDERR.puts "Hasznalat: ruby fuzet.rb <tipus> kimeneti_file.pdf"
	STDERR.puts "A tipus 1,2,3 vagy 4 lehet."
	exit 1
end

usage_exit if ARGV.size < 2


case ARGV[0]
when ?1
	baseline_h, misclines = 12, true
when ?2
	baseline_h, misclines = 10, true
when ?3
	baseline_h, misclines = 10, false
when ?4
	baseline_h, misclines = 7, false
else
	usage_exit
end


Prawn::Document.generate(ARGV[1], page_size: page_size, page_layout: :portrait, margin: margin) do
	y = 0
	# initial single misc line
	if misclines then
			stroke_color miscline_color
			self.line_width = miscline_width
			stroke do
				horizontal_line 0, page_size[0]-2*margin, at: y
			end	
			y += baseline_h*1/3
	end
	# all lines
	while y + baseline_h < page_size[1]-2*margin do
		stroke_color baseline_color
		self.line_width = baseline_width
		stroke do
			horizontal_line 0, page_size[0]-2*margin, at: y
		end
		if misclines then
			stroke_color miscline_color
			self.line_width = miscline_width
			stroke do
				horizontal_line 0, page_size[0]-2*margin, at: y+baseline_h*1/3
				horizontal_line 0, page_size[0]-2*margin, at: y+baseline_h*2/3
			end
		end
		y += baseline_h
	end
	# closing line if no misc
	if not misclines then
		stroke_color baseline_color
		self.line_width = baseline_width
		stroke do
			horizontal_line 0, page_size[0]-2*margin, at: y
		end
	end
end