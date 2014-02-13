## SimpleLogging

This is a very simple module to enable creating simple log files.  It's meant to augment the standard rails or other log files, and is used to separate items of interest.  For example, you may want to log each time a particular type of event happens, for example, a new user registers or some such, so that it's easy to quickly scan and see them

##Usage
The module is meant to be included into a class of interest, as such

    class A
      include NoPlanB::SimpleLogging
      configure_simple_logger(file: "some_file.log",time_stamp: true)
      
      def self.class_method
        # blah blah
        simple_log "Something interesting happened"
      end
      
      def insance_method
        # blah blah
        simple_log "Something else happened"
      end
    end
    
The log file is configured in the *configure\_simple\_logger* command.  You can additionally indicate that you want all lines to be timestamped (recommended).  After the methods are called, you'll see something like

    2/12/14 08:35:12:  Something interesting happened

in the log file.
