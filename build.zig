const Builder = @import("std").build.Builder;
const deps = @import("./deps.zig");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("zig-mul", "src/main.zig");
    lib.setBuildMode(mode);
    for (deps.packages) |pkg| {
        lib.addPackage(pkg);
    }
    lib.install();

    var main_tests = b.addTest("src/main.zig");
    for (deps.packages) |pkg| {
        main_tests.addPackage(pkg);
    }
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
