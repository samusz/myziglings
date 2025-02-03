//
//    "Elephants walking
//     Along the trails
//
//     Are holding hands
//     By holding tails."
//
//     from Holding Hands
//       by Lenore M. Link
//
const std = @import("std");

const Elephant = struct {
    letter: u8, //this is the payload
    tail: *Elephant = undefined, // next Elephant
    visited: bool = false, // mark
};

pub fn main() void {
    var elephantA = Elephant{ .letter = 'A' };
    var elephantB = Elephant{ .letter = 'B' };
    var elephantC = Elephant{ .letter = 'C' };

    // Link the elephants so that each tail "points" to the next elephant.
    // They make a circle: A->B->C->A...
    elephantA.tail = &elephantB;
    elephantB.tail = &elephantC;
    elephantC.tail = &elephantA;

    visitElephants(&elephantA);

    std.debug.print("\n", .{});
}

// This function visits all elephants once, starting with the
// first elephant and following the tails to the next elephant.
// If we did not "mark" the elephants as visited (by setting
// visited=true), then this would loop infinitely!
fn visitElephants(first_elephant: *Elephant) void {
    var e = first_elephant;

    while (!e.visited) {
        std.debug.print("Elephant {u}. ", .{e.letter});
        e.visited = true;
        e = e.tail;
    }
}
