const std = @import("std");
const clap = @import("clap");
// const zelda = @import("zelda");

const version = "0.1.0a";

pub fn main() !void {
    // Standard output/err
    const stdout = std.io.getStdOut().writer();
    const stderr = std.io.getStdErr().writer();

    // Create an arena allocator to reduce time spent allocating
    // and freeing memory during runtime.
    var arena_state = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    _ = arena_state.allocator();

    // Cmdline
    // ------------
    const params = comptime clap.parseParamsComptime(
        \\-h, --help         Display this help and exit.
        \\-v, --version      Display nvrg version and exit.
        \\-f, --from <file>  Generate rockspec files for plugins from a JSON file.
        \\<plugin>...
        \\
    );
    const parsers = comptime .{
        .file = clap.parsers.string,
        .plugin = clap.parsers.string,
    };
    var diag = clap.Diagnostic{};
    var res = clap.parse(clap.Help, &params, parsers, .{
        .diagnostic = &diag,
    }) catch |err| {
        // Report useful error and exit
        diag.report(stderr, err) catch {};
        return err;
    };
    defer res.deinit();

    if (res.args.help) {
        // We print a small usage message banner as zig-clap does not implement it
        try stdout.writeAll("Usage: nvrg [options] [plugins]\n\nOptions:\n");
        return clap.help(stdout, clap.Help, &params, .{});
    }
    if (res.args.version)
        try stdout.print("nvrg v{s} by NTBBloodbath & Vhyrro\n", .{version});
    if (res.args.from) |file|
        try stdout.print("JSON file path: {s}\n", .{file});
    for (res.positionals) |pos|
        try stdout.print("{s}\n", .{pos});
}

// test "simple test" {
//     var list = std.ArrayList(i32).init(std.testing.allocator);
//     defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
//     try list.append(42);
//     try std.testing.expectEqual(@as(i32, 42), list.pop());
// }
