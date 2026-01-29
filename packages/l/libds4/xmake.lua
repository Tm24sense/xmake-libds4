package("libds4")
    set_homepage("https://github.com/Tm24sense/libds4")
    set_description("DualShock 4 C/C++ library")
    set_license("MIT")

    set_urls(
        "https://github.com/Tm24sense/libds4/archive/refs/tags/v$(version).zip",
        "https://github.com/Tm24sense/libds4/archive/refs/heads/main.zip"
    )

    add_versions("1.0.0", "52D0040DB8E854A8A524314805BB144C6703B0EAF596D4178AB789FE362A6662")
    add_deps("hidapi", {configs = {shared = false}})

    add_configs("shared", {
        description = "Build shared library",
        default = false,
        type = "boolean"
    })

    on_install(function (package)
        import("package.tools.xmake").install(package, {
            build_shared = package:config("shared") or false,
            build_tests  = false
        })
    end)
