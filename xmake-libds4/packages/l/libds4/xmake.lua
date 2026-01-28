package("libds4")
    set_homepage("https://github.com/Tm24sense/libds4")
    set_description("DualShock 4 controller library")
    set_license("MIT")
    add_urls("https://github.com/Tm24sense/libds4/archive/refs/tags/v$(version).tar.gz")
    add_versions("1.0.0", "52D0040DB8E854A8A524314805BB144C6703B0EAF596D4178AB789FE362A6662")
    add_deps("hidapi")
    on_install(function (package)
        import("package.tools.xmake").install(package, {
            shared = package:config("shared")
        })
    end)

    on_test(function (package)
        assert(package:has_cfuncs("ds4_open_device", {
            includes = "ds4/ds4_handle.h"
        }))
    end)
