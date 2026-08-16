	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E6C0
sub_0802E6C0: @ 0x0802E6C0
	push {lr}
	bl sub_08034F60
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E6E8
	bl sub_08035810
	bl sub_080258CC
	ldr r0, _0802E6E4 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_0802E4B4
	b _0802E6EE
	.align 2, 0
_0802E6E4: .4byte gUnknown_030040D8
_0802E6E8:
	ldr r1, _0802E6F4 @ =gUnknown_03003334
	movs r0, #0
	strh r0, [r1]
_0802E6EE:
	pop {r0}
	bx r0
	.align 2, 0
_0802E6F4: .4byte gUnknown_03003334

