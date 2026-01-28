package("libds4")
    set_homepage("https://github.com/YOUR_USERNAME/libds4")
    set_description("DualShock 4 controller library")
    set_license("MIT")

    add_urls("https://github.com/YOUR_USERNAME/libds4/archive/refs/tags/$(version).tar.gz",
             "https://github.com/YOUR_USERNAME/libds4.git")
    
    
    add_versions("1.0.0", "52D0040DB8E854A8A524314805BB144C6703B0EAF596D4178AB789FE362A6662")

    add_deps("hidapi")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.build_shared = true
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("ds4_init", {includes = "ds4/ds4.h"}))
    end)
package_end()