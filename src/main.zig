const std = @import("std");
const testing = std.testing;
const add = @import("add").add;

pub export fn mul(a: i32, b: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 0;
    while (i < b) : (i += 1) {
        res = add(res, a);
    }
    return res;
}

test "basic mul functionality" {
    testing.expect(mul(3, 7) == 21);
}
