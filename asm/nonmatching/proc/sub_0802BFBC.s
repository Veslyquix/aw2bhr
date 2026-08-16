	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BFBC
sub_0802BFBC: @ 0x0802BFBC
	push {lr}
	ldr r0, _0802BFCC @ =gUnknown_0849A450
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802BFCC: .4byte gUnknown_0849A450

