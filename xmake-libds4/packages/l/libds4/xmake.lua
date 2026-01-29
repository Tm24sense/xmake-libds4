package("libds4")
    set_homepage("https://github.com/yourusername/libds4")
    set_description("DS4 library for DualShock 4 controller support")
    set_license("MIT") 
    
    add_urls("https://github.com/yourusername/libds4/archive/refs/tags/$(version).tar.gz")
    add_urls("https://github.com/yourusername/libds4.git")
    
    add_versions("1.0.0", "ACF21D152CA1EDFE4DBECF763F57824B45D0CF08EA07EE8F816D391A2177A6AE")
    
    add_deps("hidapi")
    
    add_configs("shared", {description = "Build shared library", default = false, type = "boolean"})
    add_configs("build_tests", {description = "Build test executables", default = false, type = "boolean"})
    
    on_install(function (package)
        local configs = {}
        
        if package:config("shared") then
            table.insert(configs, "-DBUILD_SHARED=y")
        end
        
        if package:config("build_tests") then
            table.insert(configs, "-DBUILD_TESTS=y")
        end
        
        import("package.tools.xmake").install(package, configs)
    end)