Vagrant.configure( "2" ) do |config|
    config.vm.define( "consul-one" ) do |vm|
        vm.vm.provider( "docker" ) do |d|
            d.name = "consul-one"
            d.image = "mtinside/consul-test"
            d.cmd = ["/consul", "agent", "-server", "-client", "0.0.0.0", "-bootstrap-expect", "3", "-data-dir", "/tmp", "-ui-dir", "/ui/dist"]
            d.ports = [ "8500:8500" ]
        end
    end
    config.vm.define( "consul-two" ) do |vm|
        vm.vm.provider( "docker" ) do |d|
            d.image = "mtinside/consul-test"
            d.link("consul-one:one")
            d.cmd = ["/consul", "agent", "-server", "-join", "one", "-bootstrap-expect", "3", "-data-dir", "/tmp", "-ui-dir", "/ui/dist"]
        end
    end
    config.vm.define( "consul-three" ) do |vm|
        vm.vm.provider( "docker" ) do |d|
            d.image = "mtinside/consul-test"
            d.link("consul-one:one")
            d.cmd = ["/consul", "agent", "-server", "-join", "one", "-bootstrap-expect", "3", "-data-dir", "/tmp", "-ui-dir", "/ui/dist"]
        end
    end
end
