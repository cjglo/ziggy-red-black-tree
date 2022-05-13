const std = @import("std");
const graph = @import("graph.zig");

const TestError = error{ Unimplemented, GraphInitFailure };

// === Tests ===
test "Expect ReadFromFile to initialize Graph w/o error" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();
    var g = try graph.Graph([]const u8).init(allocator); // take type and just initialize it

    var g2 = try graph.Graph([]const u8).init(allocator);
    try g2.deinit();

    try g.readFromFile("example_graph.txt");

    try g.deinit();
}

test "Expect FindShortestPath to return shortest path from \"a\" to \"g\" to be 15" {
    //return error.SkipZigTest;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();
    var g = try graph.Graph([]const u8).init(allocator); // take type and just initialize it

    try g.readFromFile("example_graph.txt");

    // actual test

    const dist1 = g.findShortestPath("a", "f");

    _ = dist1 catch 0;

    //return error.SkipZigTest;
}

test "Expect FindShortestPath to return shortest path from \"f\" to \"d\" to be 17" {
    return error.SkipZigTest;
}

test "Expect DoesNameExistInGraph to return true for \"a\"" {
    return error.SkipZigTest;
}

test "Expect DoesNameExistInGraph to return false for \"z\"" {
    return error.SkipZigTest;
}
