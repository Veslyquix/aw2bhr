	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F4CC
sub_0805F4CC: @ 0x0805F4CC
	push {lr}
	ldr r2, _0805F4F0 @ =gUnknown_030040D8
	ldr r1, [r2]
	ldrb r0, [r1, #0xb]
	cmp r0, #7
	bls _0805F4DC
	movs r0, #1
	strb r0, [r1, #0xb]
_0805F4DC:
	ldr r1, _0805F4F4 @ =gUnknown_085768E0
	ldr r0, [r2]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_0805F4F0: .4byte gUnknown_030040D8
_0805F4F4: .4byte gUnknown_085768E0

