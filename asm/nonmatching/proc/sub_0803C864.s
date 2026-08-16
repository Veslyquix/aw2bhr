	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C864
sub_0803C864: @ 0x0803C864
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803C88C @ =gUnknown_0849EDB0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r3, #0
	adds r2, #0xc
	adds r2, r1, r2
	adds r3, #0x10
	adds r1, r1, r3
	ldr r0, [r1]
	ldr r2, [r2]
	movs r1, #1
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0803C88C: .4byte gUnknown_0849EDB0

