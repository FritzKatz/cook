# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cook::Application.initialize!

# Configure application fpr pdf as a possible output format
#Mime::Type.register 'application/pdf', :pdf
