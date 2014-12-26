Pod::Spec.new do |s|
  s.name             = "DBPickableItemCell"
  s.version          = "0.1.0"
  s.summary          = "A UITableViewCell subclass that presents a UIPickerView for selection from multiple objects."
  s.description      = <<-DESC
                       A UITableViewCell subclass that presents a UIPickerView for selection from multiple objects. Support for both iPhone (via inputView) and iPad (via UIPopoverController). Any object that conforms to the DBPickableItem protocol can be offered as an option in the pickerview. 
                       DESC
  s.homepage         = "https://github.com/danielbowden/DBPickableItemCell"
  s.license          = 'MIT'
  s.author           = { "Daniel Bowden" => "github@bowden.in" }
  s.source           = { :git => "https://github.com/danielbowden/DBPickableItemCell.git", :tag => s.version.to_s }
  s.screenshots      = "https://raw.githubusercontent.com/danielbowden/DBDynamicHeightTableCell/master/Example/Screenshots/DBDynamicHeightTableCell-AttributedLabels.png", "https://raw.githubusercontent.com/danielbowden/DBDynamicHeightTableCell/master/Example/Screenshots/DBDynamicHeightTableCell-PlainLabels.png"
  s.social_media_url = 'https://twitter.com/danielgbowden'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.public_header_files = 'Classes/*.h'
end
