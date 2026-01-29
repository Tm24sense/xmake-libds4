package("libds4")
    set_homepage("https://github.com/Tm24sense/libds4")
    set_description("DualShock 4 C/C++ library")
    set_license("MIT")

    set_urls(
        "https://github.com/Tm24sense/libds4/archive/refs/tags/v$(version).zip",
        "https://github.com/Tm24sense/libds4/archive/refs/heads/main.zip"
    )

    add_versions("1.0.0", "ACF21D152CA1EDFE4DBECF763F57824B45D0CF08EA07EE8F816D391A2177A6AE")
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
